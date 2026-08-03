require "ffi"
require_relative "datatype"
require_relative "vector"

module IGraph
  module LibIGraph
    # igraph_error_t igraph_cliques(const igraph_t *graph, igraph_vector_int_list_t *res, igraph_int_t min_size, igraph_int_t max_size);
    attach_function :igraph_cliques, %i[pointer pointer long_long long_long], :int

    # igraph_error_t igraph_cliques_callback(const igraph_t *graph, igraph_int_t min_size, igraph_int_t max_size, igraph_clique_handler_t *clique_handler, void *arg);
    attach_function :igraph_cliques_callback, %i[pointer long_long long_long pointer pointer], :int

    # igraph_error_t igraph_maximal_cliques(const igraph_t *graph, igraph_vector_int_list_t *res, igraph_int_t min_size, igraph_int_t max_size);
    attach_function :igraph_maximal_cliques, %i[pointer pointer long_long long_long], :int

    # igraph_error_t igraph_maximal_cliques_callback(const igraph_t *graph, igraph_clique_handler_t *clique_handler, void *arg, igraph_int_t min_size, igraph_int_t max_size);
    attach_function :igraph_maximal_cliques_callback, %i[pointer pointer pointer long_long long_long], :int

    # igraph_error_t igraph_maximal_cliques_count(const igraph_t *graph, igraph_int_t *res, igraph_int_t min_size, igraph_int_t max_size);
    attach_function :igraph_maximal_cliques_count, %i[pointer pointer long_long long_long], :int

    # igraph_error_t igraph_maximal_cliques_hist(const igraph_t *graph, igraph_vector_t *hist, igraph_int_t min_size, igraph_int_t max_size);
    attach_function :igraph_maximal_cliques_hist, %i[pointer pointer long_long long_long], :int

    # igraph_error_t igraph_largest_cliques(const igraph_t *graph, igraph_vector_int_list_t *cliques);
    attach_function :igraph_largest_cliques, %i[pointer pointer], :int

    # igraph_integer_t igraph_clique_number(const igraph_t *graph);
    attach_function :igraph_clique_number, [:pointer], :long_long

    # igraph_error_t igraph_weighted_cliques(const igraph_t *graph, const igraph_vector_t *vertex_weights, igraph_vector_int_list_t *res, igraph_real_t min_weight, igraph_real_t max_weight, igraph_bool_t maximal);
    attach_function :igraph_weighted_cliques, %i[pointer pointer pointer double double bool], :int

    # igraph_error_t igraph_largest_weighted_cliques(const igraph_t *graph, const igraph_vector_t *vertex_weights, igraph_vector_int_list_t *res);
    attach_function :igraph_largest_weighted_cliques, %i[pointer pointer pointer], :int

    # igraph_real_t igraph_weighted_clique_number(const igraph_t *graph, const igraph_vector_t *vertex_weights);
    attach_function :igraph_weighted_clique_number, %i[pointer pointer], :double

    # igraph_error_t igraph_independent_vertex_sets(igraph_vector_int_list_t *res, const igraph_t *graph, igraph_int_t min_size, igraph_int_t max_size);
    attach_function :igraph_independent_vertex_sets, %i[pointer pointer long_long long_long], :int

    # igraph_error_t igraph_maximal_independent_vertex_sets(const igraph_t *graph, igraph_vector_int_list_t *res, igraph_int_t min_size, igraph_int_t max_size);
    attach_function :igraph_maximal_independent_vertex_sets, %i[pointer pointer long_long long_long], :int

    # igraph_error_t igraph_largest_independent_vertex_sets(const igraph_t *graph, igraph_vector_int_list_t *res);
    attach_function :igraph_largest_independent_vertex_sets, %i[pointer pointer], :int

    # igraph_integer_t igraph_independence_number(const igraph_t *graph);
    attach_function :igraph_independence_number, [:pointer], :long_long

    # igraph_error_t igraph_maximal_independent_vertex_sets_count(const igraph_t *graph, igraph_int_t *res, igraph_int_t min_size, igraph_int_t max_size);
    attach_function :igraph_maximal_independent_vertex_sets_count, %i[pointer pointer long_long long_long], :int

    # igraph_error_t igraph_maximal_independent_vertex_sets_hist(const igraph_t *graph, igraph_vector_t *hist, igraph_int_t min_size, igraph_int_t max_size);
    attach_function :igraph_maximal_independent_vertex_sets_hist, %i[pointer pointer long_long long_long], :int
  end
end
