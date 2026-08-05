# frozen_string_literal: true

module IGraph
  # High-level graph class
  #
  # Holds an igraph_t internally and automatically calls igraph_destroy
  # via GC finalizer. This is the central class for all high-level graph operations.
  #
  # @example
  #   g = IGraph::Graph.new(edges: [[0, 1], [1, 2]], directed: false)
  #   g.vcount        # => 3
  #   g.ecount        # => 2
  #   g.directed?     # => false
  #   g.degree(0)     # => 1
  class Graph
    # @param edges [Array<Array(Integer, Integer)>] Edge list
    # @param n [Integer] Number of vertices (inferred from edges if omitted)
    # @param directed [Boolean] Whether the graph is directed
    def initialize(edges: [], n: nil, directed: false)
      @struct = LibIGraph::Graph.new
      @directed = directed

      if edges.empty?
        vertex_count = n || 0
        IGraph.check_error LibIGraph.igraph_empty(@struct.pointer, vertex_count, directed)
      else
        max_vertex = edges.flatten.max
        vertex_count = n || (max_vertex + 1)

        edge_vec = LibIGraph::VectorIntStruct.new
        initialized = false
        begin
          IGraph.check_error LibIGraph.igraph_vector_int_init(edge_vec.pointer, edges.size * 2)
          initialized = true
          edges.each_with_index do |(from, to), i|
            LibIGraph.igraph_vector_int_set(edge_vec.pointer, i * 2, from)
            LibIGraph.igraph_vector_int_set(edge_vec.pointer, i * 2 + 1, to)
          end

          IGraph.check_error LibIGraph.igraph_create(@struct.pointer, edge_vec.pointer, vertex_count, directed)
        ensure
          LibIGraph.igraph_vector_int_destroy(edge_vec.pointer) if initialized
        end
      end

      ObjectSpace.define_finalizer(self, self.class._destroy(@struct.pointer))
    end

    # ---------------------------------------------------------------
    # Basic information
    # ---------------------------------------------------------------

    # @return [Integer] Number of vertices
    def vcount
      LibIGraph.igraph_vcount(@struct.pointer)
    end

    # @return [Integer] Number of edges
    def ecount
      LibIGraph.igraph_ecount(@struct.pointer)
    end

    # @return [Boolean] Whether the graph is directed
    def directed?
      @directed
    end

    # ---------------------------------------------------------------
    # Vertex and edge operations
    # ---------------------------------------------------------------

    # Add vertices to the graph
    # @param n [Integer] Number of vertices to add
    # @return [self]
    def add_vertices(n)
      IGraph.check_error LibIGraph.igraph_add_vertices(@struct.pointer, n, FFI::Pointer::NULL)
      self
    end

    # Add edges to the graph
    # @param edges [Array<Array(Integer, Integer)>]
    # @return [self]
    def add_edges(edges)
      edge_vec = LibIGraph::VectorIntStruct.new
      initialized = false
      begin
        IGraph.check_error LibIGraph.igraph_vector_int_init(edge_vec.pointer, edges.size * 2)
        initialized = true
        edges.each_with_index do |(from, to), i|
          LibIGraph.igraph_vector_int_set(edge_vec.pointer, i * 2, from)
          LibIGraph.igraph_vector_int_set(edge_vec.pointer, i * 2 + 1, to)
        end
        IGraph.check_error LibIGraph.igraph_add_edges(@struct.pointer, edge_vec.pointer, FFI::Pointer::NULL)
      ensure
        LibIGraph.igraph_vector_int_destroy(edge_vec.pointer) if initialized
      end
      self
    end

    # Delete vertices from the graph
    # @param vids [Integer, Array<Integer>] Vertex IDs to delete
    # @return [self]
    def delete_vertices(vids)
      vs = VertexSelector.resolve(vids)
      begin
        IGraph.check_error LibIGraph.igraph_delete_vertices(@struct.pointer, vs)
      ensure
        VertexSelector.destroy(vs)
      end
      self
    end

    # Delete edges from the graph
    # @param eids [Integer, Array<Integer>] Edge IDs to delete
    # @return [self]
    def delete_edges(eids)
      es = EdgeSelector.resolve(eids)
      begin
        IGraph.check_error LibIGraph.igraph_delete_edges(@struct.pointer, es)
      ensure
        EdgeSelector.destroy(es)
      end
      self
    end

    # Check if two vertices are connected by an edge
    # @param from [Integer]
    # @param to [Integer]
    # @return [Boolean]
    def adjacent?(from, to)
      result_ptr = FFI::MemoryPointer.new(:bool, 1)
      IGraph.check_error LibIGraph.igraph_are_adjacent(@struct.pointer, from, to, result_ptr)
      result_ptr.get_uint8(0) != 0
    end

    # Get the degree of a vertex
    # @param vid [Integer]
    # @param mode [:out, :in, :all]
    # @return [Integer]
    def degree(vid, mode: :out)
      result_ptr = FFI::MemoryPointer.new(:long_long, 1)
      IGraph.check_error LibIGraph.igraph_degree_1(@struct.pointer, result_ptr, vid, _mode_to_i(mode), false)
      result_ptr.get_long_long(0)
    end

    # ---------------------------------------------------------------
    # Iterators
    # ---------------------------------------------------------------

    # Iterate over all vertices
    # @yield [Integer] Vertex ID
    # @return [Enumerator] When no block is given
    def each_vertex(&block)
      return to_enum(:each_vertex) unless block_given?
      vcount.times(&block)
    end

    # Iterate over all edges
    # @yield [Array(Integer, Integer)] Edge endpoints (from, to)
    # @return [Enumerator] When no block is given
    def each_edge(&block)
      return to_enum(:each_edge) unless block_given?
      n = ecount
      from_ptr = FFI::MemoryPointer.new(:long_long, 1)
      to_ptr   = FFI::MemoryPointer.new(:long_long, 1)
      n.times do |eid|
        IGraph.check_error LibIGraph.igraph_edge(@struct.pointer, eid, from_ptr, to_ptr)
        yield [from_ptr.get_long_long(0), to_ptr.get_long_long(0)]
      end
    end

    # Iterate over the neighbors of a vertex
    # @param vid [Integer]
    # @param mode [:out, :in, :all]
    # @yield [Integer] Neighbor vertex ID
    # @return [Array] When no block is given
    def each_neighbor(vid, mode: :out, &block)
      vec = LibIGraph::VectorIntStruct.new
      initialized = false
      begin
        IGraph.check_error LibIGraph.igraph_vector_int_init(vec.pointer, 0)
        initialized = true
        IGraph.check_error LibIGraph.igraph_neighbors(@struct.pointer, vec.pointer, vid, _mode_to_i(mode))
        count = LibIGraph.igraph_vector_int_size(vec.pointer)
        result = Array.new(count) { |i| LibIGraph.igraph_vector_int_get(vec.pointer, i) }
      ensure
        LibIGraph.igraph_vector_int_destroy(vec.pointer) if initialized
      end
      return result.each(&block) if block_given?
      result
    end

    # @return [Array<Integer>] Array of all vertex IDs
    def vertices
      each_vertex.to_a
    end

    # @return [Array<Array(Integer, Integer)>] Array of all edges
    def edges
      each_edge.to_a
    end

    # ---------------------------------------------------------------
    # Structural properties
    # ---------------------------------------------------------------

    # @return [Float] Graph density
    def density(loops: false)
      result_ptr = FFI::MemoryPointer.new(:double, 1)
      IGraph.check_error LibIGraph.igraph_density(@struct.pointer, FFI::Pointer::NULL, result_ptr, loops)
      result_ptr.get_double(0)
    end

    # @return [Boolean] Whether the graph is simple
    def simple?
      result_ptr = FFI::MemoryPointer.new(:bool, 1)
      IGraph.check_error LibIGraph.igraph_is_simple(@struct.pointer, result_ptr)
      result_ptr.get_uint8(0) != 0
    end

    # @return [Boolean] Whether the graph is connected
    def connected?(mode: :weak)
      result_ptr = FFI::MemoryPointer.new(:bool, 1)
      IGraph.check_error LibIGraph.igraph_is_connected(@struct.pointer, result_ptr, _conn_mode_to_i(mode))
      result_ptr.get_uint8(0) != 0
    end

    # @return [Boolean] Whether the graph is a tree
    def tree?
      result_ptr = FFI::MemoryPointer.new(:bool, 1)
      IGraph.check_error LibIGraph.igraph_is_tree(@struct.pointer, result_ptr, FFI::Pointer::NULL, LibIGraph::IGRAPH_ALL)
      result_ptr.get_uint8(0) != 0
    end

    # @return [Boolean] Whether the graph is a forest
    def forest?
      result_ptr = FFI::MemoryPointer.new(:bool, 1)
      IGraph.check_error LibIGraph.igraph_is_forest(@struct.pointer, result_ptr, FFI::Pointer::NULL, LibIGraph::IGRAPH_ALL)
      result_ptr.get_uint8(0) != 0
    end

    # ---------------------------------------------------------------
    # Operators
    # ---------------------------------------------------------------

    # @param other [Graph]
    # @return [Boolean]
    def ==(other)
      return false unless other.is_a?(self.class)
      result_ptr = FFI::MemoryPointer.new(:bool, 1)
      IGraph.check_error LibIGraph.igraph_is_same_graph(@struct.pointer, other.instance_variable_get(:@struct).pointer, result_ptr)
      result_ptr.get_uint8(0) != 0
    end

    # @return [String]
    def inspect
      "#<IGraph::Graph vcount=#{vcount} ecount=#{ecount} directed=#{directed?}>"
    end
    alias to_s inspect

    # ---------------------------------------------------------------
    # Low-level pointer (for testing and debugging)
    # ---------------------------------------------------------------
    def pointer
      @struct.pointer
    end

    private

    def _mode_to_i(mode)
      case mode
      when :out  then LibIGraph::IGRAPH_OUT
      when :in   then LibIGraph::IGRAPH_IN
      when :all  then LibIGraph::IGRAPH_ALL
      else raise IGraph::ArgumentError, "Unknown mode: #{mode.inspect}"
      end
    end

    def _conn_mode_to_i(mode)
      case mode
      when :weak    then LibIGraph::IGRAPH_WEAK
      when :strong  then LibIGraph::IGRAPH_STRONG
      else raise IGraph::ArgumentError, "Unknown connectedness mode: #{mode.inspect}"
      end
    end

    # GC finalizer helper
    def self._destroy(ptr)
      proc { LibIGraph.igraph_destroy(ptr) }
    end
  end
end
