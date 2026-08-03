require "ffi"
require_relative "datatype"
require_relative "vector"

module IGraph
  module LibIGraph
    # igraph_error_t igraph_barabasi_game(igraph_t *graph, igraph_integer_t n, igraph_real_t power, igraph_integer_t m, const igraph_vector_int_t *outseq, igraph_bool_t outpref, igraph_real_t A, igraph_bool_t directed, igraph_barabasi_algorithm_t algo, const igraph_t *start_from);
    attach_function :igraph_barabasi_game, %i[pointer long_long double long_long pointer bool double bool int pointer], :int

    # igraph_error_t igraph_erdos_renyi_game_gnp(igraph_t *graph, igraph_integer_t n, igraph_real_t p, igraph_bool_t directed, igraph_bool_t loops);
    attach_function :igraph_erdos_renyi_game_gnp, %i[pointer long_long double bool bool], :int

    # igraph_error_t igraph_erdos_renyi_game_gnm(igraph_t *graph, igraph_integer_t n, igraph_integer_t m, igraph_bool_t directed, igraph_bool_t loops);
    attach_function :igraph_erdos_renyi_game_gnm, %i[pointer long_long long_long bool bool], :int

    # igraph_error_t igraph_iea_game(igraph_t *graph, igraph_integer_t n, igraph_real_t p, igraph_real_t q, igraph_integer_t m, igraph_bool_t directed);
    attach_function :igraph_iea_game, %i[pointer long_long double double long_long bool], :int

    # igraph_error_t igraph_degree_sequence_game(igraph_t *graph, const igraph_vector_int_t *out_deg, const igraph_vector_int_t *in_deg, igraph_degseq_t method);
    attach_function :igraph_degree_sequence_game, %i[pointer pointer pointer int], :int

    # igraph_error_t igraph_growing_random_game(igraph_t *graph, igraph_integer_t n, igraph_integer_t m, igraph_bool_t directed, igraph_bool_t citation);
    attach_function :igraph_growing_random_game, %i[pointer long_long long_long bool bool], :int

    # igraph_error_t igraph_barabasi_aging_game(igraph_t *graph, igraph_integer_t n, igraph_integer_t m, const igraph_vector_int_t *outseq, igraph_bool_t outpref, igraph_real_t pa_exp, igraph_real_t aging_exp, igraph_integer_t zero_deg_appeal, igraph_integer_t zero_age_appeal, igraph_real_t deg_coef, igraph_real_t age_coef, igraph_bool_t directed);
    attach_function :igraph_barabasi_aging_game, %i[pointer long_long long_long pointer bool double double long_long long_long double double bool], :int

    # igraph_error_t igraph_recent_degree_game(igraph_t *graph, igraph_integer_t n, igraph_real_t power, igraph_integer_t m, const igraph_vector_int_t *outseq, igraph_bool_t outpref, igraph_real_t zero_appeal, igraph_bool_t directed);
    attach_function :igraph_recent_degree_game, %i[pointer long_long double long_long pointer bool double bool], :int

    # igraph_error_t igraph_recent_degree_aging_game(igraph_t *graph, igraph_integer_t n, igraph_integer_t m, const igraph_vector_int_t *outseq, igraph_bool_t outpref, igraph_real_t pa_exp, igraph_real_t aging_exp, igraph_integer_t zero_appeal, igraph_bool_t directed);
    attach_function :igraph_recent_degree_aging_game, %i[pointer long_long long_long pointer bool double double long_long bool], :int

    # igraph_error_t igraph_callaway_traits_game(igraph_t *graph, igraph_integer_t nodes, igraph_integer_t types, igraph_integer_t edges_per_step, igraph_real_t type_dist, igraph_matrix_t *pref_matrix, igraph_bool_t directed, igraph_vector_t *node_type_vec);
    attach_function :igraph_callaway_traits_game, %i[pointer long_long long_long long_long double pointer bool pointer], :int

    # igraph_error_t igraph_establishment_game(igraph_t *graph, igraph_integer_t nodes, igraph_integer_t types, igraph_integer_t k, igraph_real_t type_dist, igraph_matrix_t *pref_matrix, igraph_bool_t directed, igraph_vector_t *node_type_vec);
    attach_function :igraph_establishment_game, %i[pointer long_long long_long long_long double pointer bool pointer], :int

    # igraph_error_t igraph_grg_game(igraph_t *graph, igraph_integer_t nodes, igraph_real_t radius, igraph_bool_t torus, igraph_vector_t *x, igraph_vector_t *y);
    attach_function :igraph_grg_game, %i[pointer long_long double bool pointer pointer], :int

    # igraph_error_t igraph_preference_game(igraph_t *graph, igraph_integer_t nodes, igraph_integer_t types, const igraph_vector_t *type_dist, igraph_bool_t fixed_sizes, const igraph_matrix_t *pref_matrix, igraph_vector_int_t *node_type_out, igraph_vector_int_t *node_type_in, igraph_bool_t directed, igraph_bool_t loops);
    attach_function :igraph_preference_game, %i[pointer long_long long_long pointer bool pointer pointer pointer bool bool], :int

    # igraph_error_t igraph_asymmetric_preference_game(igraph_t *graph, igraph_integer_t nodes, igraph_integer_t out_types, igraph_integer_t in_types, const igraph_matrix_t *type_dist_matrix, const igraph_matrix_t *pref_matrix, igraph_vector_int_t *node_type_out, igraph_vector_int_t *node_type_in, igraph_bool_t loops);
    attach_function :igraph_asymmetric_preference_game, %i[pointer long_long long_long long_long pointer pointer pointer pointer bool], :int

    # igraph_error_t igraph_rewire_edges(igraph_t *graph, igraph_real_t prob, igraph_bool_t loops, igraph_rewiring_t mode);
    attach_function :igraph_rewire_edges, %i[pointer double bool int], :int

    # igraph_error_t igraph_rewire_directed_edges(igraph_t *graph, igraph_real_t prob, igraph_bool_t loops, igraph_rewiring_t mode);
    attach_function :igraph_rewire_directed_edges, %i[pointer double bool int], :int

    # igraph_error_t igraph_watts_strogatz_game(igraph_t *graph, igraph_integer_t dim, igraph_integer_t size, igraph_integer_t nei, igraph_real_t p, igraph_bool_t loops, igraph_bool_t multiple);
    attach_function :igraph_watts_strogatz_game, %i[pointer long_long long_long long_long double bool bool], :int

    # igraph_error_t igraph_lastcit_game(igraph_t *graph, igraph_integer_t nodes, igraph_integer_t edges_per_node, igraph_integer_t agebins, const igraph_vector_int_t *preference, igraph_bool_t directed);
    attach_function :igraph_lastcit_game, %i[pointer long_long long_long long_long pointer bool], :int

    # igraph_error_t igraph_cited_type_game(igraph_t *graph, igraph_integer_t nodes, const igraph_vector_int_t *types, const igraph_vector_t *pref, igraph_integer_t edges_per_step, igraph_bool_t directed);
    attach_function :igraph_cited_type_game, %i[pointer long_long pointer pointer long_long bool], :int

    # igraph_error_t igraph_citing_cited_type_game(igraph_t *graph, igraph_integer_t nodes, const igraph_vector_int_t *types, const igraph_matrix_t *pref, igraph_integer_t edges_per_step, igraph_bool_t directed);
    attach_function :igraph_citing_cited_type_game, %i[pointer long_long pointer pointer long_long bool], :int

    # igraph_error_t igraph_forest_fire_game(igraph_t *graph, igraph_integer_t nodes, igraph_real_t fw_prob, igraph_real_t bw_factor, igraph_integer_t ambs, igraph_bool_t directed);
    attach_function :igraph_forest_fire_game, %i[pointer long_long double double long_long bool], :int

    # igraph_error_t igraph_simple_interconnected_islands_game(igraph_t *graph, igraph_integer_t islands_n, igraph_integer_t islands_size, igraph_real_t islands_pin, igraph_integer_t n_inter);
    attach_function :igraph_simple_interconnected_islands_game, %i[pointer long_long long_long double long_long], :int

    # igraph_error_t igraph_static_fitness_game(igraph_t *graph, igraph_integer_t no_of_edges, const igraph_vector_t *fitness_out, const igraph_vector_t *fitness_in, igraph_bool_t loops, igraph_bool_t multiple);
    attach_function :igraph_static_fitness_game, %i[pointer long_long pointer pointer bool bool], :int

    # igraph_error_t igraph_static_power_law_game(igraph_t *graph, igraph_integer_t no_of_edges, igraph_integer_t no_of_nodes, igraph_real_t exponent_out, igraph_real_t exponent_in, igraph_bool_t loops, igraph_bool_t multiple, igraph_bool_t finite_size_correction);
    attach_function :igraph_static_power_law_game, %i[pointer long_long long_long double double bool bool bool], :int

    # igraph_error_t igraph_chung_lu_game(igraph_t *graph, const igraph_vector_t *out_weights, const igraph_vector_t *in_weights, igraph_bool_t loops, igraph_bool_t multiple);
    attach_function :igraph_chung_lu_game, %i[pointer pointer pointer bool bool], :int

    # igraph_error_t igraph_k_regular_game(igraph_t *graph, igraph_integer_t no_of_nodes, igraph_integer_t k, igraph_bool_t directed, igraph_bool_t multiple);
    attach_function :igraph_k_regular_game, %i[pointer long_long long_long bool bool], :int

    # igraph_error_t igraph_sbm_game(igraph_t *graph, igraph_integer_t n, const igraph_matrix_t *pref_matrix, const igraph_vector_int_t *block_sizes, igraph_bool_t directed, igraph_bool_t loops);
    attach_function :igraph_sbm_game, %i[pointer long_long pointer pointer bool bool], :int

    # igraph_error_t igraph_hsbm_game(igraph_t *graph, igraph_integer_t n, igraph_integer_t m, const igraph_vector_t *rho, const igraph_matrix_t *C, igraph_real_t gamma);
    attach_function :igraph_hsbm_game, %i[pointer long_long long_long pointer pointer double], :int

    # igraph_error_t igraph_hsbm_list_game(igraph_t *graph, igraph_integer_t n, const igraph_vector_int_t *mlist, const igraph_vector_t *rholist, const igraph_matrix_list_t *Clist, igraph_real_t gamma);
    attach_function :igraph_hsbm_list_game, %i[pointer long_long pointer pointer pointer double], :int

    # igraph_error_t igraph_tree_game(igraph_t *graph, igraph_integer_t n, igraph_bool_t directed, igraph_random_tree_t method);
    attach_function :igraph_tree_game, %i[pointer long_long bool int], :int

    # igraph_error_t igraph_correlated_game(const igraph_t *old_graph, igraph_t *new_graph, igraph_real_t corr, igraph_real_t p, const igraph_vector_int_t *permutation);
    attach_function :igraph_correlated_game, %i[pointer pointer double double pointer], :int

    # igraph_error_t igraph_correlated_pair_game(igraph_t *graph1, igraph_t *graph2, igraph_integer_t n, igraph_real_t corr, igraph_real_t p, igraph_bool_t directed);
    attach_function :igraph_correlated_pair_game, %i[pointer pointer long_long double double bool], :int

    # igraph_error_t igraph_dot_product_game(igraph_t *graph, const igraph_matrix_t *vecs, igraph_bool_t directed);
    attach_function :igraph_dot_product_game, %i[pointer pointer bool], :int
  end
end
