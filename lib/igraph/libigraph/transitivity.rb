require "ffi"
require_relative "datatype"
require_relative "vector"

module IGraph
  module LibIGraph
    # igraph_error_t igraph_transitivity_undirected(const igraph_t *graph, igraph_real_t *res, igraph_transitivity_mode_t mode);
    attach_function :igraph_transitivity_undirected, %i[pointer pointer int], :int

    # igraph_error_t igraph_transitivity_local_undirected(const igraph_t *graph, igraph_vector_t *res, const igraph_vs_t vids, igraph_transitivity_mode_t mode);
    attach_function :igraph_transitivity_local_undirected, %i[pointer pointer int int], :int

    # igraph_error_t igraph_transitivity_avglocal_undirected(const igraph_t *graph, igraph_real_t *res, igraph_transitivity_mode_t mode);
    attach_function :igraph_transitivity_avglocal_undirected, %i[pointer pointer int], :int

    # igraph_error_t igraph_transitivity_barrat(const igraph_t *graph, igraph_vector_t *res, const igraph_vs_t vids, const igraph_vector_t *weights, const igraph_transitivity_mode_t mode);
    attach_function :igraph_transitivity_barrat, %i[pointer pointer int pointer int], :int
  end
end
