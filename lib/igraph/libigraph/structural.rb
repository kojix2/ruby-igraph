require "ffi"
require_relative "datatype"
require_relative "vector"

module IGraph
  module LibIGraph
    # igraph_error_t igraph_density(const igraph_t *graph, igraph_real_t *res, igraph_bool_t loops);
    attach_function :igraph_density, %i[pointer pointer bool], :int

    # igraph_error_t igraph_girth(const igraph_t *graph, igraph_real_t *girth, igraph_vector_int_t *circle);
    attach_function :igraph_girth, %i[pointer pointer pointer], :int

    # igraph_error_t igraph_has_loop(const igraph_t *graph, igraph_bool_t *res);
    attach_function :igraph_has_loop, %i[pointer pointer], :int

    # igraph_error_t igraph_has_multiple(const igraph_t *graph, igraph_bool_t *res);
    attach_function :igraph_has_multiple, %i[pointer pointer], :int

    # igraph_error_t igraph_count_loops(const igraph_t *graph, igraph_integer_t *loop_count);
    attach_function :igraph_count_loops, %i[pointer pointer], :int

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

    # igraph_error_t igraph_is_complete(const igraph_t *graph, igraph_bool_t *res);
    attach_function :igraph_is_complete, %i[pointer pointer], :int

    # igraph_error_t igraph_are_adjacent(const igraph_t *graph, igraph_integer_t v1, igraph_integer_t v2, igraph_bool_t *res);
    attach_function :igraph_are_adjacent, %i[pointer long_long long_long pointer], :int

    # igraph_error_t igraph_is_connected(const igraph_t *graph, igraph_bool_t *res, igraph_connectedness_t mode);
    attach_function :igraph_is_connected, %i[pointer pointer int], :int
  end
end
