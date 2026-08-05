# frozen_string_literal: true

module IGraph
  # Vertex selector (vs) helper
  #
  # Accepts Integer, Array, Range, :all, :none, etc., and converts them
  # internally to igraph_vs_t.
  #
  # @example
  #   VertexSelector.resolve(0)            # => single vertex
  #   VertexSelector.resolve([0, 1, 2])    # => vertex list
  #   VertexSelector.resolve(0..5)         # => range
  #   VertexSelector.resolve(:all)         # => all vertices
  class VertexSelector
    # Convert a Ruby value to igraph_vs_t
    #
    # The returned selector owns its data (vector-backed selectors are
    # copied with igraph_vs_vector_copy) and must be released with
    # {VertexSelector.destroy} once the underlying C call has completed.
    #
    # @param value [Integer, Array, Range, Symbol]
    # @return [IGraph::LibIGraph::VertexSelector] FFI struct
    def self.resolve(value)
      vs = LibIGraph::VertexSelector.new
      case value
      when Integer
        IGraph.check_error LibIGraph.igraph_vs_1(vs, value)
      when Array
        vec = LibIGraph::VectorIntStruct.new
        initialized = false
        begin
          IGraph.check_error LibIGraph.igraph_vector_int_init(vec.pointer, value.size)
          initialized = true
          value.each_with_index { |v, i| LibIGraph.igraph_vector_int_set(vec.pointer, i, v) }
          # Copy the vector into the selector: igraph_vs_vector only keeps
          # a pointer, which would dangle once the vector is destroyed.
          IGraph.check_error LibIGraph.igraph_vs_vector_copy(vs, vec.pointer)
        ensure
          LibIGraph.igraph_vector_int_destroy(vec.pointer) if initialized
        end
      when Range
        first = value.begin
        last = value.end
        raise IGraph::ArgumentError, "Vertex selector range must be bounded" if first.nil? || last.nil?

        # igraph uses a half-open interval, while Ruby ranges may include
        # their endpoint.
        last += 1 unless value.exclude_end?
        IGraph.check_error LibIGraph.igraph_vs_range(vs, first, last)
      when :all
        IGraph.check_error LibIGraph.igraph_vs_all(vs)
      when :none
        IGraph.check_error LibIGraph.igraph_vs_none(vs)
      else
        raise IGraph::ArgumentError, "Unsupported vertex selector: #{value.class}"
      end
      vs
    end

    # Release the resources owned by a selector created with {.resolve}.
    # The selector must not be used afterwards.
    #
    # @param vs [IGraph::LibIGraph::VertexSelector]
    # @return [nil]
    def self.destroy(vs)
      LibIGraph.igraph_vs_destroy(vs)
      nil
    end
  end
end
