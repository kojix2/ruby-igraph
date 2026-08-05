# frozen_string_literal: true

module IGraph
  # Edge selector (es) helper
  #
  # Accepts Integer, Array, Range, :all, :none, etc., and converts them
  # internally to igraph_es_t.
  #
  # @example
  #   EdgeSelector.resolve(0)            # => single edge
  #   EdgeSelector.resolve([0, 1, 2])    # => edge list
  #   EdgeSelector.resolve(0..5)         # => range
  #   EdgeSelector.resolve(:all)         # => all edges
  class EdgeSelector
    # Convert a Ruby value to igraph_es_t
    # @param value [Integer, Array, Range, Symbol]
    # @return [IGraph::LibIGraph::EdgeSelector] FFI struct
    def self.resolve(value)
      es = LibIGraph::EdgeSelector.new
      case value
      when Integer
        IGraph.check_error LibIGraph.igraph_es_1(es, value)
      when Array
        vec = LibIGraph::VectorIntStruct.new
        IGraph.check_error LibIGraph.igraph_vector_int_init(vec.pointer, value.size)
        value.each_with_index { |v, i| LibIGraph.igraph_vector_int_set(vec.pointer, i, v) }
        IGraph.check_error LibIGraph.igraph_es_vector(es, vec.pointer)
        LibIGraph.igraph_vector_int_destroy(vec.pointer)
      when Range
        first = value.first
        last  = value.exclude_end? ? value.last - 1 : value.last
        IGraph.check_error LibIGraph.igraph_es_range(es, first, last)
      when :all
        IGraph.check_error LibIGraph.igraph_es_all(es, 0)
      when :none
        IGraph.check_error LibIGraph.igraph_es_none(es)
      else
        raise IGraph::ArgumentError, "Unsupported edge selector: #{value.class}"
      end
      es
    end
  end
end
