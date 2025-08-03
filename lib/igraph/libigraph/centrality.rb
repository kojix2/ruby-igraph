require "ffi"
require_relative "datatype"
require_relative "vector"

module IGraph
  module LibIGraph
    # igraph_error_t igraph_betweenness(const igraph_t *graph, igraph_vector_t *res, const igraph_vs_t vids, igraph_bool_t directed, const igraph_vector_t *weights);
    attach_function :igraph_betweenness, %i[pointer pointer pointer bool pointer], :int

    # igraph_error_t igraph_pagerank(const igraph_t *graph, igraph_pagerank_algo_t algo, igraph_vector_t *vector, igraph_real_t *value, const igraph_vs_t vids, igraph_bool_t directed, igraph_real_t damping, const igraph_vector_t *weights, igraph_arpack_options_t *options);
    attach_function :igraph_pagerank, %i[pointer int pointer pointer pointer bool double pointer pointer], :int

    # igraph_error_t igraph_closeness(const igraph_t *graph, igraph_vector_t *res, igraph_vector_int_t *reachable_count, igraph_bool_t *all_reachable, const igraph_vs_t vids, igraph_neimode_t mode, const igraph_vector_t *weights, igraph_bool_t normalized);
    attach_function :igraph_closeness, %i[pointer pointer pointer pointer pointer int pointer bool], :int

    # igraph_error_t igraph_eigenvector_centrality(const igraph_t *graph, igraph_vector_t *vector, igraph_real_t *value, igraph_bool_t directed, igraph_bool_t scale, const igraph_vector_t *weights, igraph_arpack_options_t *options);
    attach_function :igraph_eigenvector_centrality, %i[pointer pointer pointer bool bool pointer pointer], :int

    # igraph_error_t igraph_hub_and_authority_scores(const igraph_t *graph, igraph_vector_t *hub_vector, igraph_vector_t *authority_vector, igraph_real_t *value, igraph_bool_t scale, const igraph_vector_t *weights, igraph_arpack_options_t *options);
    attach_function :igraph_hub_and_authority_scores, %i[pointer pointer pointer pointer bool pointer pointer], :int

    # igraph_error_t igraph_harmonic_centrality(const igraph_t *graph, igraph_vector_t *res, const igraph_vs_t vids, igraph_neimode_t mode, const igraph_vector_t *weights, igraph_bool_t normalized);
    attach_function :igraph_harmonic_centrality, %i[pointer pointer pointer int pointer bool], :int

    # igraph_error_t igraph_hub_score(const igraph_t *graph, igraph_vector_t *vector, igraph_real_t *value, igraph_bool_t scale, const igraph_vector_t *weights, igraph_arpack_options_t *options);
    attach_function :igraph_hub_score, %i[pointer pointer pointer bool pointer pointer], :int

    # igraph_error_t igraph_authority_score(const igraph_t *graph, igraph_vector_t *vector, igraph_real_t *value, igraph_bool_t scale, const igraph_vector_t *weights, igraph_arpack_options_t *options);
    attach_function :igraph_authority_score, %i[pointer pointer pointer bool pointer pointer], :int
  end
end
