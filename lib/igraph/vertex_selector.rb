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
    # @param value [Integer, Array, Range, Symbol]
    # @return [IGraph::LibIGraph::VertexSelector] FFI struct
    def self.resolve(value)
      vs = LibIGraph::VertexSelector.new
      case value
      when Integer
        IGraph.check_error LibIGraph.igraph_vs_1(vs, value)
      when Array
        vec = LibIGraph::VectorIntStruct.new
        IGraph.check_error LibIGraph.igraph_vector_int_init(vec.pointer, value.size)
        value.each_with_index { |v, i| LibIGraph.igraph_vector_int_set(vec.pointer, i, v) }
        IGraph.check_error LibIGraph.igraph_vs_vector(vs, vec.pointer)
        LibIGraph.igraph_vector_int_destroy(vec.pointer)
      when Range
        first = value.first
        last  = value.exclude_end? ? value.last - 1 : value.last
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
  end
end
