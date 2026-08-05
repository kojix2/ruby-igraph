require "ffi"
require_relative "datatype"
require_relative "vector"

module IGraph
  module LibIGraph
    # igraph_error_t igraph_betweenness(const igraph_t *graph, igraph_vector_t *res, const igraph_vs_t vids, igraph_bool_t directed, const igraph_vector_t *weights);
    attach_function :igraph_betweenness, %i[pointer pointer pointer bool pointer], :int

    # igraph_error_t igraph_betweenness_cutoff(const igraph_t *graph, igraph_vector_t *res, const igraph_vs_t vids, igraph_bool_t directed, const igraph_vector_t *weights, igraph_real_t cutoff);
    attach_function :igraph_betweenness_cutoff, %i[pointer pointer pointer bool pointer double], :int

    # igraph_error_t igraph_betweenness_subset(const igraph_t *graph, igraph_vector_t *res, const igraph_vs_t vids, igraph_bool_t directed, const igraph_vs_t sources, const igraph_vs_t targets, const igraph_vector_t *weights);
    attach_function :igraph_betweenness_subset, %i[pointer pointer pointer bool pointer pointer pointer], :int

    # igraph_error_t igraph_edge_betweenness(const igraph_t *graph, igraph_vector_t *res, igraph_bool_t directed, const igraph_vector_t *weights);
    attach_function :igraph_edge_betweenness, %i[pointer pointer bool pointer], :int

    # igraph_error_t igraph_edge_betweenness_cutoff(const igraph_t *graph, igraph_vector_t *res, igraph_bool_t directed, const igraph_vector_t *weights, igraph_real_t cutoff);
    attach_function :igraph_edge_betweenness_cutoff, %i[pointer pointer bool pointer double], :int

    # igraph_error_t igraph_edge_betweenness_subset(const igraph_t *graph, igraph_vector_t *res, const igraph_vs_t sources, const igraph_vs_t targets, igraph_bool_t directed, const igraph_vector_t *weights);
    attach_function :igraph_edge_betweenness_subset, %i[pointer pointer pointer pointer bool pointer], :int

    # igraph_error_t igraph_pagerank(const igraph_t *graph, igraph_pagerank_algo_t algo, igraph_vector_t *vector, igraph_real_t *value, const igraph_vs_t vids, igraph_bool_t directed, igraph_real_t damping, const igraph_vector_t *weights, igraph_arpack_options_t *options);
    attach_function :igraph_pagerank, %i[pointer int pointer pointer pointer bool double pointer pointer], :int

    # igraph_error_t igraph_personalized_pagerank(const igraph_t *graph, igraph_pagerank_algo_t algo, igraph_vector_t *vector, igraph_real_t *value, const igraph_vs_t vids, igraph_bool_t directed, igraph_real_t damping, const igraph_vector_t *reset, const igraph_vector_t *weights, igraph_arpack_options_t *options);
    attach_function :igraph_personalized_pagerank, %i[pointer int pointer pointer pointer bool double pointer pointer pointer], :int

    # igraph_error_t igraph_personalized_pagerank_vs(const igraph_t *graph, igraph_pagerank_algo_t algo, igraph_vector_t *vector, igraph_real_t *value, const igraph_vs_t vids, igraph_bool_t directed, igraph_real_t damping, igraph_vs_t reset_vids, const igraph_vector_t *weights, igraph_arpack_options_t *options);
    attach_function :igraph_personalized_pagerank_vs, %i[pointer int pointer pointer pointer bool double pointer pointer pointer], :int

    # igraph_error_t igraph_closeness(const igraph_t *graph, igraph_vector_t *res, igraph_vector_int_t *reachable_count, igraph_bool_t *all_reachable, const igraph_vs_t vids, igraph_neimode_t mode, const igraph_vector_t *weights, igraph_bool_t normalized);
    attach_function :igraph_closeness, %i[pointer pointer pointer pointer pointer int pointer bool], :int

    # igraph_error_t igraph_closeness_cutoff(const igraph_t *graph, igraph_vector_t *res, igraph_vector_int_t *reachable_count, igraph_bool_t *all_reachable, const igraph_vs_t vids, igraph_neimode_t mode, const igraph_vector_t *weights, igraph_bool_t normalized, igraph_real_t cutoff);
    attach_function :igraph_closeness_cutoff, %i[pointer pointer pointer pointer pointer int pointer bool double], :int

    # igraph_error_t igraph_eigenvector_centrality(const igraph_t *graph, igraph_vector_t *vector, igraph_real_t *value, igraph_bool_t directed, igraph_bool_t scale, const igraph_vector_t *weights, igraph_arpack_options_t *options);
    attach_function :igraph_eigenvector_centrality, %i[pointer pointer pointer bool bool pointer pointer], :int

    # igraph_error_t igraph_hub_and_authority_scores(const igraph_t *graph, igraph_vector_t *hub_vector, igraph_vector_t *authority_vector, igraph_real_t *value, igraph_bool_t scale, const igraph_vector_t *weights, igraph_arpack_options_t *options);
    attach_function :igraph_hub_and_authority_scores, %i[pointer pointer pointer pointer bool pointer pointer], :int

    # igraph_error_t igraph_harmonic_centrality(const igraph_t *graph, igraph_vector_t *res, const igraph_vs_t vids, igraph_neimode_t mode, const igraph_vector_t *weights, igraph_bool_t normalized);
    attach_function :igraph_harmonic_centrality, %i[pointer pointer pointer int pointer bool], :int

    # igraph_error_t igraph_harmonic_centrality_cutoff(const igraph_t *graph, igraph_vector_t *res, const igraph_vs_t vids, igraph_neimode_t mode, const igraph_vector_t *weights, igraph_bool_t normalized, igraph_real_t cutoff);
    attach_function :igraph_harmonic_centrality_cutoff, %i[pointer pointer pointer int pointer bool double], :int

    # igraph_error_t igraph_constraint(const igraph_t *graph, igraph_vector_t *res, const igraph_vs_t vids, const igraph_vector_t *weights);
    attach_function :igraph_constraint, %i[pointer pointer pointer pointer], :int

    # igraph_error_t igraph_convergence_degree(const igraph_t *graph, igraph_vector_t *result, const igraph_vector_t *ins, const igraph_vector_t *outs);
    attach_function :igraph_convergence_degree, %i[pointer pointer pointer pointer], :int

    # igraph_real_t igraph_centralization(const igraph_vector_t *scores, igraph_real_t theoretical_max, igraph_bool_t normalized);
    attach_function :igraph_centralization, %i[pointer double bool], :double

    # igraph_error_t igraph_centralization_degree(const igraph_t *graph, igraph_vector_t *res, igraph_neimode_t mode, igraph_bool_t loops, igraph_real_t *centralization, igraph_real_t *theoretical_max, igraph_bool_t normalized);
    attach_function :igraph_centralization_degree, %i[pointer pointer int bool pointer pointer bool], :int

    # igraph_error_t igraph_centralization_degree_tmax(const igraph_t *graph, igraph_int_t nodes, igraph_neimode_t mode, igraph_bool_t loops, igraph_real_t *res);
    attach_function :igraph_centralization_degree_tmax, %i[pointer long_long int bool pointer], :int

    # igraph_error_t igraph_centralization_betweenness(const igraph_t *graph, igraph_vector_t *res, igraph_bool_t directed, igraph_bool_t normalized, igraph_real_t *centralization, igraph_real_t *theoretical_max);
    attach_function :igraph_centralization_betweenness, %i[pointer pointer bool bool pointer pointer], :int

    # igraph_error_t igraph_centralization_betweenness_tmax(const igraph_t *graph, igraph_int_t nodes, igraph_bool_t directed, igraph_real_t *res);
    attach_function :igraph_centralization_betweenness_tmax, %i[pointer long_long bool pointer], :int

    # igraph_error_t igraph_centralization_closeness(const igraph_t *graph, igraph_vector_t *res, igraph_neimode_t mode, igraph_bool_t normalized, igraph_real_t *centralization, igraph_real_t *theoretical_max);
    attach_function :igraph_centralization_closeness, %i[pointer pointer int bool pointer pointer], :int

    # igraph_error_t igraph_centralization_closeness_tmax(const igraph_t *graph, igraph_int_t nodes, igraph_neimode_t mode, igraph_real_t *res);
    attach_function :igraph_centralization_closeness_tmax, %i[pointer long_long int pointer], :int

    # igraph_error_t igraph_centralization_eigenvector_centrality(const igraph_t *graph, igraph_vector_t *res, igraph_bool_t directed, igraph_bool_t scale, igraph_real_t *centralization, igraph_real_t *theoretical_max, igraph_arpack_options_t *options);
    attach_function :igraph_centralization_eigenvector_centrality, %i[pointer pointer bool bool pointer pointer pointer], :int

    # igraph_error_t igraph_centralization_eigenvector_centrality_tmax(const igraph_t *graph, igraph_int_t nodes, igraph_bool_t directed, igraph_bool_t scale, igraph_real_t *res);
    attach_function :igraph_centralization_eigenvector_centrality_tmax, %i[pointer long_long bool bool pointer], :int
  end
end
