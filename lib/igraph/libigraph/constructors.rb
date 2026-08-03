require "ffi"
require_relative "datatype"
require_relative "vector"
require_relative "matrix"

module IGraph
  module LibIGraph
    # igraph_error_t igraph_create(igraph_t *graph, const igraph_vector_int_t *edges, igraph_integer_t n, igraph_bool_t directed);
    attach_function :igraph_create, %i[pointer pointer long_long bool], :int

    # igraph_error_t igraph_small(igraph_t *graph, igraph_integer_t n, igraph_bool_t directed, int first, ...);
    attach_function :igraph_small, %i[pointer long_long bool int varargs], :int

    # igraph_error_t igraph_adjacency(igraph_t *graph, const igraph_matrix_t *adjmatrix, igraph_adjacency_t mode, igraph_loops_t loops);
    attach_function :igraph_adjacency, %i[pointer pointer int int], :int

    # igraph_error_t igraph_weighted_adjacency(igraph_t *graph, const igraph_matrix_t *adjmatrix, igraph_adjacency_t mode, igraph_vector_t *weights, igraph_loops_t loops);
    attach_function :igraph_weighted_adjacency, %i[pointer pointer int pointer int], :int

    # igraph_error_t igraph_sparse_adjacency(igraph_t *graph, igraph_sparsemat_t *adjmatrix, igraph_adjacency_t mode, igraph_loops_t loops);
    attach_function :igraph_sparse_adjacency, %i[pointer pointer int int], :int

    # igraph_error_t igraph_sparse_weighted_adjacency(igraph_t *graph, igraph_sparsemat_t *adjmatrix, igraph_adjacency_t mode, igraph_vector_t *weights, igraph_loops_t loops);
    attach_function :igraph_sparse_weighted_adjacency, %i[pointer pointer int pointer int], :int

    # igraph_error_t igraph_star(igraph_t *graph, igraph_integer_t n, igraph_star_mode_t mode, igraph_integer_t center);
    attach_function :igraph_star, %i[pointer long_long int long_long], :int

    # igraph_error_t igraph_wheel(igraph_t *graph, igraph_integer_t n, igraph_wheel_mode_t mode, igraph_integer_t center);
    attach_function :igraph_wheel, %i[pointer long_long int long_long], :int

    # igraph_error_t igraph_hypercube(igraph_t *graph, igraph_integer_t n, igraph_bool_t directed);
    attach_function :igraph_hypercube, %i[pointer long_long bool], :int

    # igraph_error_t igraph_square_lattice(igraph_t *graph, const igraph_vector_int_t *dimvector, igraph_integer_t nei, igraph_bool_t directed, igraph_bool_t mutual);
    attach_function :igraph_square_lattice, %i[pointer pointer long_long bool bool], :int

    # igraph_error_t igraph_ring(igraph_t *graph, igraph_integer_t n, igraph_bool_t directed, igraph_bool_t mutual, igraph_bool_t circular);
    attach_function :igraph_ring, %i[pointer long_long bool bool bool], :int

    # igraph_error_t igraph_path_graph(igraph_t *graph, igraph_integer_t n, igraph_bool_t directed);
    attach_function :igraph_path_graph, %i[pointer long_long bool], :int

    # igraph_error_t igraph_cycle_graph(igraph_t *graph, igraph_integer_t n, igraph_bool_t directed);
    attach_function :igraph_cycle_graph, %i[pointer long_long bool], :int

    # igraph_error_t igraph_kary_tree(igraph_t *graph, igraph_integer_t n, igraph_integer_t children, igraph_tree_mode_t type);
    attach_function :igraph_kary_tree, %i[pointer long_long long_long int], :int

    # igraph_error_t igraph_symmetric_tree(igraph_t *graph, const igraph_vector_int_t *branches, igraph_tree_mode_t type);
    attach_function :igraph_symmetric_tree, %i[pointer pointer int], :int

    # igraph_error_t igraph_regular_tree(igraph_t *graph, igraph_integer_t h, igraph_integer_t k, igraph_tree_mode_t type);
    attach_function :igraph_regular_tree, %i[pointer long_long long_long int], :int

    # igraph_error_t igraph_tree_from_parent_vector(igraph_t *graph, const igraph_vector_int_t *parents, igraph_tree_mode_t mode);
    attach_function :igraph_tree_from_parent_vector, %i[pointer pointer int], :int

    # igraph_error_t igraph_from_prufer(igraph_t *graph, const igraph_vector_int_t *prufer);
    attach_function :igraph_from_prufer, %i[pointer pointer], :int

    # igraph_error_t igraph_full(igraph_t *graph, igraph_integer_t n, igraph_bool_t directed, igraph_bool_t loops);
    attach_function :igraph_full, %i[pointer long_long bool bool], :int

    # igraph_error_t igraph_full_multipartite(igraph_t *graph, igraph_vector_int_t *types, const igraph_vector_int_t *n, igraph_bool_t directed, igraph_neimode_t mode);
    attach_function :igraph_full_multipartite, %i[pointer pointer pointer bool int], :int

    # igraph_error_t igraph_turan(igraph_t *graph, igraph_vector_int_t *types, igraph_integer_t n, igraph_integer_t r);
    attach_function :igraph_turan, %i[pointer pointer long_long long_long], :int

    # igraph_error_t igraph_full_citation(igraph_t *graph, igraph_integer_t n, igraph_bool_t directed);
    attach_function :igraph_full_citation, %i[pointer long_long bool], :int

    # igraph_error_t igraph_atlas(igraph_t *graph, igraph_integer_t number);
    attach_function :igraph_atlas, %i[pointer long_long], :int

    # igraph_error_t igraph_extended_chordal_ring(igraph_t *graph, igraph_integer_t nodes, const igraph_matrix_t *W, igraph_bool_t directed);
    attach_function :igraph_extended_chordal_ring, %i[pointer long_long pointer bool], :int

    # igraph_error_t igraph_linegraph(const igraph_t *graph, igraph_t *linegraph);
    attach_function :igraph_linegraph, %i[pointer pointer], :int

    # igraph_error_t igraph_de_bruijn(igraph_t *graph, igraph_integer_t m, igraph_integer_t n);
    attach_function :igraph_de_bruijn, %i[pointer long_long long_long], :int

    # igraph_error_t igraph_circulant(igraph_t *graph, igraph_integer_t n, const igraph_vector_int_t *l, igraph_bool_t directed);
    attach_function :igraph_circulant, %i[pointer long_long pointer bool], :int

    # igraph_error_t igraph_generalized_petersen(igraph_t *graph, igraph_integer_t n, igraph_integer_t k);
    attach_function :igraph_generalized_petersen, %i[pointer long_long long_long], :int

    # igraph_error_t igraph_kautz(igraph_t *graph, igraph_integer_t m, igraph_integer_t n);
    attach_function :igraph_kautz, %i[pointer long_long long_long], :int

    # igraph_error_t igraph_famous(igraph_t *graph, const char *name);
    attach_function :igraph_famous, %i[pointer string], :int

    # igraph_error_t igraph_lcf(igraph_t *graph, igraph_integer_t n, const igraph_vector_int_t *shifts, igraph_integer_t repeats);
    attach_function :igraph_lcf, %i[pointer long_long pointer long_long], :int

    # igraph_error_t igraph_lcf_small(igraph_t *graph, igraph_integer_t n, ...);
    attach_function :igraph_lcf_small, %i[pointer long_long varargs], :int

    # igraph_error_t igraph_realize_degree_sequence(igraph_t *graph, const igraph_vector_int_t *outdeg, const igraph_vector_int_t *indeg, igraph_edge_type_sw_t allowed_edge_types, igraph_realize_degseq_t method);
    attach_function :igraph_realize_degree_sequence, %i[pointer pointer pointer int int], :int

    # igraph_error_t igraph_triangular_lattice(igraph_t *graph, const igraph_vector_int_t *dims, igraph_bool_t directed, igraph_bool_t mutual);
    attach_function :igraph_triangular_lattice, %i[pointer pointer bool bool], :int

    # igraph_error_t igraph_hexagonal_lattice(igraph_t *graph, const igraph_vector_int_t *dims, igraph_bool_t directed, igraph_bool_t mutual);
    attach_function :igraph_hexagonal_lattice, %i[pointer pointer bool bool], :int

    # igraph_error_t igraph_realize_bipartite_degree_sequence(igraph_t *graph, const igraph_vector_int_t *deg1, const igraph_vector_int_t *deg2, igraph_edge_type_sw_t allowed_edge_types, igraph_realize_degseq_t method);
    attach_function :igraph_realize_bipartite_degree_sequence, %i[pointer pointer pointer int int], :int

    # igraph_error_t igraph_mycielski_graph(igraph_t *graph, igraph_integer_t k);
    attach_function :igraph_mycielski_graph, %i[pointer long_long], :int
  end
end
