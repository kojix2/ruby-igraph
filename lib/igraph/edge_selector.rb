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
    #
    # The returned selector owns its data (vector-backed selectors are
    # copied with igraph_es_vector_copy) and must be released with
    # {EdgeSelector.destroy} once the underlying C call has completed.
    #
    # @param value [Integer, Array, Range, Symbol]
    # @return [IGraph::LibIGraph::EdgeSelector] FFI struct
    def self.resolve(value)
      es = LibIGraph::EdgeSelector.new
      case value
      when Integer
        IGraph.check_error LibIGraph.igraph_es_1(es, value)
      when Array
        vec = LibIGraph::VectorIntStruct.new
        initialized = false
        begin
          IGraph.check_error LibIGraph.igraph_vector_int_init(vec.pointer, value.size)
          initialized = true
          value.each_with_index { |v, i| LibIGraph.igraph_vector_int_set(vec.pointer, i, v) }
          # Copy the vector into the selector: igraph_es_vector only keeps
          # a pointer, which would dangle once the vector is destroyed.
          IGraph.check_error LibIGraph.igraph_es_vector_copy(es, vec.pointer)
        ensure
          LibIGraph.igraph_vector_int_destroy(vec.pointer) if initialized
        end
      when Range
        first = value.begin
        last = value.end
        raise IGraph::ArgumentError, "Edge selector range must be bounded" if first.nil? || last.nil?

        # igraph uses a half-open interval, while Ruby ranges may include
        # their endpoint.
        last += 1 unless value.exclude_end?
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

    # Release the resources owned by a selector created with {.resolve}.
    # The selector must not be used afterwards.
    #
    # @param es [IGraph::LibIGraph::EdgeSelector]
    # @return [nil]
    def self.destroy(es)
      LibIGraph.igraph_es_destroy(es)
      nil
    end
  end
end
