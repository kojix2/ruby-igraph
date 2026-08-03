require "ffi"
require_relative "datatype"
require_relative "vector"

module IGraph
  module LibIGraph
    # igraph_error_t igraph_full_bipartite(igraph_t *graph, const igraph_vector_bool_t *types, igraph_int_t n1, igraph_int_t n2, igraph_bool_t directed, igraph_neimode_t mode);
    attach_function :igraph_full_bipartite, %i[pointer pointer long_long long_long bool int], :int

    # igraph_error_t igraph_create_bipartite(igraph_t *g, const igraph_vector_bool_t *types, const igraph_vector_int_t *edges, igraph_bool_t directed);
    attach_function :igraph_create_bipartite, %i[pointer pointer pointer bool], :int

    # igraph_error_t igraph_bipartite_projection_size(const igraph_t *graph, const igraph_vector_bool_t *types, igraph_int_t *vcount1, igraph_int_t *ecount1, igraph_int_t *vcount2, igraph_int_t *ecount2);
    attach_function :igraph_bipartite_projection_size, %i[pointer pointer pointer pointer pointer pointer], :int

    # igraph_error_t igraph_bipartite_projection(const igraph_t *graph, const igraph_vector_bool_t *types, igraph_t *proj1, igraph_t *proj2, igraph_int_t *multiplicity1, igraph_int_t *multiplicity2, igraph_int_t probe1);
    attach_function :igraph_bipartite_projection, %i[pointer pointer pointer pointer pointer pointer long_long], :int

    # igraph_error_t igraph_biadjacency(const igraph_t *graph, const igraph_vector_bool_t *types, igraph_matrix_t *res, igraph_int_t *row_ids, igraph_int_t *col_ids);
    attach_function :igraph_biadjacency, %i[pointer pointer pointer pointer pointer], :int

    # igraph_error_t igraph_weighted_biadjacency(const igraph_t *graph, const igraph_vector_bool_t *types, igraph_matrix_t *res, igraph_int_t *row_ids, igraph_int_t *col_ids, const igraph_vector_t *weights);
    attach_function :igraph_weighted_biadjacency, %i[pointer pointer pointer pointer pointer pointer], :int

    # igraph_error_t igraph_get_biadjacency(const igraph_t *graph, const igraph_vector_bool_t *types, igraph_matrix_t *res, igraph_int_t *row_ids, igraph_int_t *col_ids);
    attach_function :igraph_get_biadjacency, %i[pointer pointer pointer pointer pointer], :int

    # igraph_error_t igraph_is_bipartite(const igraph_t *graph, igraph_bool_t *res, igraph_vector_bool_t *type);
    attach_function :igraph_is_bipartite, %i[pointer pointer pointer], :int

    # igraph_error_t igraph_maximum_bipartite_matching(const igraph_t* graph, const igraph_vector_bool_t* types, igraph_integer_t* matching_size, igraph_real_t* matching_weight, igraph_vector_int_t* matching, const igraph_vector_t* weights, igraph_real_t eps);
    attach_function :igraph_maximum_bipartite_matching, %i[pointer pointer pointer pointer pointer pointer double], :int

    # igraph_error_t igraph_bipartite_game_gnp(igraph_t *graph, igraph_vector_bool_t *types, igraph_int_t n1, igraph_int_t n2, igraph_real_t p, igraph_bool_t directed, igraph_neimode_t mode);
    attach_function :igraph_bipartite_game_gnp, %i[pointer pointer long_long long_long double bool int], :int

    # igraph_error_t igraph_bipartite_game_gnm(igraph_t *graph, igraph_vector_bool_t *types, igraph_int_t n1, igraph_int_t n2, igraph_int_t m, igraph_bool_t directed, igraph_neimode_t mode);
    attach_function :igraph_bipartite_game_gnm, %i[pointer pointer long_long long_long long_long bool int], :int

    # igraph_error_t igraph_bipartite_iea_game(igraph_t *graph, igraph_vector_bool_t *types, igraph_int_t n1, igraph_int_t n2, igraph_int_t m1, igraph_int_t m2, igraph_real_t a, igraph_bool_t directed);
    attach_function :igraph_bipartite_iea_game, %i[pointer pointer long_long long_long long_long long_long double bool], :int
  end
end
