require "ffi"
require_relative "datatype"
require_relative "vector"

module IGraph
  module LibIGraph
    # igraph_error_t igraph_betweenness(const igraph_t *graph, igraph_vector_t *res, const igraph_vs_t vids, igraph_bool_t directed, const igraph_vector_t *weights);
    attach_function :igraph_betweenness, %i[pointer pointer int bool pointer], :int

    # igraph_error_t igraph_pagerank(const igraph_t *graph, igraph_pagerank_algo_t algo, igraph_vector_t *vector, igraph_real_t *value, const igraph_vs_t vids, igraph_bool_t directed, igraph_real_t damping, const igraph_vector_t *weights, igraph_arpack_options_t *options);
    attach_function :igraph_pagerank, %i[pointer int pointer pointer int bool double pointer pointer], :int

    # igraph_error_t igraph_closeness(const igraph_t *graph, igraph_vector_t *res, igraph_vector_int_t *reachable_count, igraph_bool_t *all_reachable, const igraph_vs_t vids, igraph_neimode_t mode, const igraph_vector_t *weights, igraph_bool_t normalized);
    attach_function :igraph_closeness, %i[pointer pointer pointer pointer int int pointer bool], :int
  end
end
