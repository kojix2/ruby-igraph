require "ffi"
require_relative "datatype"
require_relative "vector"

module IGraph
  module LibIGraph
    # igraph_error_t igraph_are_adjacent(const igraph_t *graph, igraph_integer_t v1, igraph_integer_t v2, igraph_bool_t *res);
    attach_function :igraph_are_adjacent, %i[pointer long_long long_long pointer], :int

    # igraph_error_t igraph_count_multiple(const igraph_t *graph, igraph_vector_int_t *res, igraph_es_t es);
    attach_function :igraph_count_multiple, %i[pointer pointer pointer], :int

    # igraph_error_t igraph_count_multiple_1(const igraph_t *graph, igraph_integer_t *res, igraph_integer_t eid);
    attach_function :igraph_count_multiple_1, %i[pointer pointer long_long], :int

    # igraph_error_t igraph_density(const igraph_t *graph, const igraph_vector_t *weights, igraph_real_t *res, igraph_bool_t loops);
    attach_function :igraph_density, %i[pointer pointer pointer bool], :int

    # igraph_error_t igraph_diversity(const igraph_t *graph, const igraph_vector_t *weights, igraph_vector_t *res, const igraph_vs_t vids);
    attach_function :igraph_diversity, %i[pointer pointer pointer pointer], :int

    # igraph_error_t igraph_girth(const igraph_t *graph, igraph_real_t *girth, igraph_vector_int_t *circle);
    attach_function :igraph_girth, %i[pointer pointer pointer], :int

    # igraph_error_t igraph_has_loop(const igraph_t *graph, igraph_bool_t *res);
    attach_function :igraph_has_loop, %i[pointer pointer], :int

    # igraph_error_t igraph_has_multiple(const igraph_t *graph, igraph_bool_t *res);
    attach_function :igraph_has_multiple, %i[pointer pointer], :int

    # igraph_error_t igraph_count_loops(const igraph_t *graph, igraph_integer_t *loop_count);
    attach_function :igraph_count_loops, %i[pointer pointer], :int

    # igraph_error_t igraph_is_loop(const igraph_t *graph, igraph_vector_bool_t *res, igraph_es_t es);
    attach_function :igraph_is_loop, %i[pointer pointer pointer], :int

    # igraph_error_t igraph_is_multiple(const igraph_t *graph, igraph_vector_bool_t *res, igraph_es_t es);
    attach_function :igraph_is_multiple, %i[pointer pointer pointer], :int

    # igraph_error_t igraph_is_mutual(const igraph_t *graph, igraph_vector_bool_t *res, igraph_es_t es, igraph_bool_t loops);
    attach_function :igraph_is_mutual, %i[pointer pointer pointer bool], :int

    # igraph_error_t igraph_has_mutual(const igraph_t *graph, igraph_bool_t *res, igraph_bool_t loops);
    attach_function :igraph_has_mutual, %i[pointer pointer bool], :int

    # igraph_error_t igraph_is_simple(const igraph_t *graph, igraph_bool_t *res);
    attach_function :igraph_is_simple, %i[pointer pointer], :int

    # igraph_error_t igraph_is_tree(const igraph_t *graph, igraph_bool_t *res, igraph_integer_t *root, igraph_neimode_t mode);
    attach_function :igraph_is_tree, %i[pointer pointer pointer int], :int

    # igraph_error_t igraph_is_acyclic(const igraph_t *graph, igraph_bool_t *res);
    attach_function :igraph_is_acyclic, %i[pointer pointer], :int

    # igraph_error_t igraph_is_forest(const igraph_t *graph, igraph_bool_t *res, igraph_vector_int_t *roots, igraph_neimode_t mode);
    attach_function :igraph_is_forest, %i[pointer pointer pointer int], :int

    # igraph_error_t igraph_maxdegree(const igraph_t *graph, igraph_integer_t *res, igraph_vs_t vids, igraph_neimode_t mode, igraph_bool_t loops);
    attach_function :igraph_maxdegree, %i[pointer pointer int int bool], :int

    # igraph_error_t igraph_mean_degree(const igraph_t *graph, igraph_real_t *res, igraph_bool_t loops);
    attach_function :igraph_mean_degree, %i[pointer pointer bool], :int

    # igraph_error_t igraph_reciprocity(const igraph_t *graph, igraph_real_t *res, igraph_bool_t ignore_loops, igraph_reciprocity_t mode);
    attach_function :igraph_reciprocity, %i[pointer pointer bool int], :int

    # igraph_error_t igraph_strength(const igraph_t *graph, igraph_vector_t *res, const igraph_vs_t vids, igraph_neimode_t mode, igraph_bool_t loops, const igraph_vector_t *weights);
    attach_function :igraph_strength, %i[pointer pointer pointer int bool pointer], :int

    # igraph_error_t igraph_sort_vertex_ids_by_degree(const igraph_t *graph, igraph_vector_int_t *outvids, igraph_vector_int_t *invids, igraph_vs_t vids, igraph_neimode_t mode, igraph_bool_t loops, igraph_degorder_t order, igraph_bool_t multiple);
    attach_function :igraph_sort_vertex_ids_by_degree, %i[pointer pointer pointer pointer int bool int bool], :int

    # igraph_error_t igraph_is_perfect(const igraph_t *graph, igraph_bool_t *perfect);
    attach_function :igraph_is_perfect, %i[pointer pointer], :int

    # igraph_error_t igraph_is_complete(const igraph_t *graph, igraph_bool_t *res);
    attach_function :igraph_is_complete, %i[pointer pointer], :int

    # igraph_error_t igraph_is_clique(const igraph_t *graph, igraph_vs_t candidate, igraph_bool_t directed, igraph_bool_t *res);
    attach_function :igraph_is_clique, %i[pointer pointer bool pointer], :int

    # igraph_error_t igraph_is_independent_vertex_set(const igraph_t *graph, igraph_vs_t candidate, igraph_bool_t *res);
    attach_function :igraph_is_independent_vertex_set, %i[pointer pointer pointer], :int

    # igraph_error_t igraph_minimum_spanning_tree(const igraph_t *graph, igraph_vector_int_t *res, const igraph_vector_t *weights);
    attach_function :igraph_minimum_spanning_tree, %i[pointer pointer pointer], :int

    # igraph_error_t igraph_random_spanning_tree(const igraph_t *graph, igraph_vector_int_t *res, igraph_integer_t vid);
    attach_function :igraph_random_spanning_tree, %i[pointer pointer long_long], :int

    # igraph_error_t igraph_subcomponent(const igraph_t *graph, igraph_vector_int_t *res, igraph_integer_t vid, igraph_neimode_t mode);
    attach_function :igraph_subcomponent, %i[pointer pointer long_long int], :int

    # igraph_error_t igraph_unfold_tree(const igraph_t *graph, igraph_t *tree, igraph_neimode_t mode, const igraph_vector_int_t *roots, igraph_vector_int_t *vertex_index);
    attach_function :igraph_unfold_tree, %i[pointer pointer int pointer pointer], :int

    # igraph_error_t igraph_maximum_cardinality_search(const igraph_t *graph, igraph_vector_int_t *alpha, igraph_vector_int_t *alpham1);
    attach_function :igraph_maximum_cardinality_search, %i[pointer pointer pointer], :int

    # igraph_error_t igraph_is_chordal(const igraph_t *graph, const igraph_vector_int_t *alpha, const igraph_vector_int_t *alpham1, igraph_bool_t *chordal, igraph_vector_int_t *fill_in, igraph_t *newgraph);
    attach_function :igraph_is_chordal, %i[pointer pointer pointer pointer pointer pointer], :int

    # igraph_error_t igraph_avg_nearest_neighbor_degree(const igraph_t *graph, igraph_vs_t vids, igraph_vector_t *knn, igraph_vector_t *knnk, igraph_neimode_t mode);
    attach_function :igraph_avg_nearest_neighbor_degree, %i[pointer pointer pointer pointer int], :int

    # igraph_error_t igraph_degree_correlation_vector(const igraph_t *graph, igraph_vector_t *knnk, const igraph_vector_t *weights, igraph_neimode_t from_mode, igraph_neimode_t to_mode, igraph_bool_t directed_neighbors);
    attach_function :igraph_degree_correlation_vector, %i[pointer pointer pointer int int bool], :int

    # igraph_error_t igraph_rich_club_sequence(const igraph_t *graph, igraph_vector_t *res, igraph_vector_int_t *counts, igraph_neimode_t mode, igraph_bool_t loops);
    attach_function :igraph_rich_club_sequence, %i[pointer pointer pointer int bool], :int

    # igraph_error_t igraph_get_laplacian(const igraph_t *graph, igraph_matrix_t *res, igraph_laplacian_normalization_t mode, const igraph_vector_t *weights);
    attach_function :igraph_get_laplacian, %i[pointer pointer int pointer], :int

    # igraph_error_t igraph_get_laplacian_sparse(const igraph_t *graph, igraph_sparsemat_t *sparsemat, igraph_laplacian_normalization_t mode, const igraph_vector_t *weights);
    attach_function :igraph_get_laplacian_sparse, %i[pointer pointer int pointer], :int

    # igraph_error_t igraph_is_connected(const igraph_t *graph, igraph_bool_t *res, igraph_connectedness_t mode);
    attach_function :igraph_is_connected, %i[pointer pointer int], :int
  end
end
