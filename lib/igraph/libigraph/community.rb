require "ffi"
require_relative "datatype"
require_relative "vector"
require_relative "matrix"

module IGraph
  module LibIGraph
    # igraph_error_t igraph_coreness(const igraph_t *graph, igraph_vector_int_t *cores, igraph_neimode_t mode);
    attach_function :igraph_coreness, %i[pointer pointer int], :int

    # igraph_error_t igraph_trussness(const igraph_t* graph, igraph_vector_int_t* trussness);
    attach_function :igraph_trussness, %i[pointer pointer], :int

    # igraph_error_t igraph_community_optimal_modularity(const igraph_t *graph, const igraph_vector_t *weights, igraph_real_t resolution, igraph_real_t modularity, igraph_vector_int_t *membership, igraph_vector_t *eigenvalues, igraph_matrix_t *eigenvectors, igraph_vector_t *temp, igraph_bool_t modularity_as_hand, igraph_real_t *modularity_score);
    attach_function :igraph_community_optimal_modularity, %i[pointer pointer double double pointer pointer pointer pointer bool pointer], :int

    # igraph_error_t igraph_community_spinglass(const igraph_t *graph, const igraph_vector_t *weights, igraph_real_t *modularity, igraph_real_t *temperature, igraph_vector_int_t *membership, igraph_vector_int_t *csize, igraph_int_t spins, igraph_bool_t parupdate, igraph_real_t starttemp, igraph_real_t stoptemp, igraph_real_t coolfact, igraph_spincomm_update_t update_rule, igraph_real_t gamma, igraph_spinglass_implementation_t implementation, igraph_real_t lambda);
    attach_function :igraph_community_spinglass, %i[pointer pointer pointer pointer pointer pointer long_long bool double double double int double int double], :int

    # igraph_error_t igraph_community_spinglass_single(const igraph_t *graph, const igraph_vector_t *weights, igraph_int_t vid, igraph_vector_int_t *community, igraph_real_t *cohesion, igraph_real_t *adhesion, igraph_int_t *inner_links, igraph_int_t *outer_links, igraph_int_t spins, igraph_spincomm_update_t update_rule, igraph_real_t gamma);
    attach_function :igraph_community_spinglass_single, %i[pointer pointer long_long pointer pointer pointer pointer pointer long_long int double], :int

    # igraph_error_t igraph_community_walktrap(const igraph_t *graph, const igraph_vector_t *weights, igraph_int_t steps, igraph_matrix_int_t *merges, igraph_vector_t *modularity, igraph_vector_int_t *membership);
    attach_function :igraph_community_walktrap, %i[pointer pointer long_long pointer pointer pointer], :int

    # igraph_error_t igraph_community_infomap(const igraph_t *graph, const igraph_vector_t *weights, const igraph_vector_t *v_weights, igraph_int_t nb_trials, igraph_vector_int_t *membership, igraph_real_t *codelength);
    attach_function :igraph_community_infomap, %i[pointer pointer pointer long_long pointer pointer], :int

    # igraph_error_t igraph_community_edge_betweenness(const igraph_t *graph, igraph_vector_int_t *result, igraph_vector_t *edge_betweenness, igraph_vector_int_t *merges, igraph_vector_int_t *bridges, const igraph_vector_t *weights, igraph_bool_t directed);
    attach_function :igraph_community_edge_betweenness, %i[pointer pointer pointer pointer pointer pointer bool], :int

    # igraph_error_t igraph_community_eb_get_merges(const igraph_t *graph, const igraph_vector_t *weights, igraph_vector_int_t *merges, igraph_vector_t *bridges, igraph_vector_int_t *edge_betweenness);
    attach_function :igraph_community_eb_get_merges, %i[pointer pointer pointer pointer pointer], :int

    # igraph_error_t igraph_community_fastgreedy(const igraph_t *graph, const igraph_vector_t *weights, igraph_matrix_int_t *merges, igraph_vector_t *modularity, igraph_vector_int_t *membership);
    attach_function :igraph_community_fastgreedy, %i[pointer pointer pointer pointer pointer], :int

    # igraph_error_t igraph_community_to_membership(const igraph_matrix_int_t *merges, igraph_int_t nodes, igraph_int_t steps, igraph_vector_int_t *membership, igraph_vector_int_t *csize);
    attach_function :igraph_community_to_membership, %i[pointer long_long long_long pointer pointer], :int

    # igraph_error_t igraph_le_community_to_membership(const igraph_matrix_int_t *merges, igraph_int_t steps, igraph_vector_int_t *membership, igraph_vector_int_t *csize);
    attach_function :igraph_le_community_to_membership, %i[pointer long_long pointer pointer], :int

    # igraph_error_t igraph_community_voronoi(const igraph_t *graph, igraph_vector_int_t *membership, igraph_vector_int_t *generators, const igraph_vector_t *weights, igraph_neimode_t mode, const igraph_vector_t *generator_lengths, igraph_real_t *modularity);
    attach_function :igraph_community_voronoi, %i[pointer pointer pointer pointer int pointer pointer], :int

    # igraph_error_t igraph_modularity(const igraph_t *graph, const igraph_vector_int_t *membership, const igraph_vector_t *weights, igraph_real_t resolution, igraph_bool_t directed, igraph_real_t *modularity);
    attach_function :igraph_modularity, %i[pointer pointer pointer double bool pointer], :int

    # igraph_error_t igraph_modularity_matrix(const igraph_t *graph, const igraph_vector_t *weights, igraph_real_t resolution, igraph_matrix_t *modmat, igraph_bool_t directed);
    attach_function :igraph_modularity_matrix, %i[pointer pointer double pointer bool], :int

    # igraph_error_t igraph_reindex_membership(igraph_vector_int_t *membership, igraph_vector_int_t *new_to_old, igraph_int_t *nb_clusters);
    attach_function :igraph_reindex_membership, %i[pointer pointer pointer], :int

    # igraph_error_t igraph_community_leading_eigenvector(const igraph_t *graph, const igraph_vector_t *weights, igraph_matrix_int_t *merges, igraph_vector_t *eigenvalues, igraph_vector_t *eigenvectors, igraph_arpack_options_t *arpack_options, igraph_real_t *modularity, igraph_int_t *steps, igraph_community_leading_eigenvector_callback_t *callback, void *callback_extra);
    attach_function :igraph_community_leading_eigenvector, %i[pointer pointer pointer pointer pointer pointer pointer pointer pointer pointer], :int

    # igraph_error_t igraph_community_fluid_communities(const igraph_t *graph, igraph_int_t no_of_communities, igraph_vector_int_t *membership);
    attach_function :igraph_community_fluid_communities, %i[pointer long_long pointer], :int

    # igraph_error_t igraph_community_label_propagation(const igraph_t *graph, igraph_vector_int_t *membership, igraph_neimode_t mode, const igraph_vector_t *weights, const igraph_vector_int_t *initial, const igraph_vector_bool_t *fixed);
    attach_function :igraph_community_label_propagation, %i[pointer pointer int pointer pointer pointer], :int

    # igraph_error_t igraph_community_multilevel(const igraph_t *graph, const igraph_vector_t *weights, igraph_real_t resolution, igraph_vector_int_t *membership, igraph_vector_t *modularity);
    attach_function :igraph_community_multilevel, %i[pointer pointer double pointer pointer], :int

    # igraph_error_t igraph_community_leiden(const igraph_t *graph, const igraph_vector_t *weights, const igraph_vector_t *node_weights, igraph_real_t resolution, igraph_real_t beta, igraph_bool_t start, igraph_int_t n_iterations, igraph_vector_int_t *membership, igraph_int_t *nb_clusters, igraph_real_t *quality);
    attach_function :igraph_community_leiden, %i[pointer pointer pointer double double bool long_long pointer pointer pointer], :int

    # igraph_error_t igraph_community_leiden_simple(const igraph_t *graph, const igraph_vector_t *weights, igraph_real_t resolution, igraph_vector_int_t *membership, igraph_real_t *quality);
    attach_function :igraph_community_leiden_simple, %i[pointer pointer double pointer pointer], :int

    # igraph_error_t igraph_compare_communities(const igraph_vector_int_t *comm1, const igraph_vector_int_t *comm2, igraph_real_t *result, igraph_community_comparison_t method);
    attach_function :igraph_compare_communities, %i[pointer pointer pointer int], :int

    # igraph_error_t igraph_split_join_distance(const igraph_vector_int_t *comm1, const igraph_vector_int_t *comm2, igraph_real_t *distance);
    attach_function :igraph_split_join_distance, %i[pointer pointer pointer], :int
  end
end
