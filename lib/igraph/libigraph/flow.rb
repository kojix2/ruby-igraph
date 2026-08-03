require "ffi"
require_relative "datatype"
require_relative "vector"

module IGraph
  module LibIGraph
    # igraph_error_t igraph_maxflow(const igraph_t *graph, igraph_real_t *value, igraph_vector_t *flow, igraph_vector_int_t *cut, igraph_vector_int_t *partition, igraph_vector_int_t *partition2, igraph_int_t source, igraph_int_t target, const igraph_vector_t *capacity, const igraph_maxflow_stats_t *stats);
    attach_function :igraph_maxflow, %i[pointer pointer pointer pointer pointer pointer long_long long_long pointer pointer], :int

    # igraph_error_t igraph_maxflow_value(const igraph_t *graph, igraph_real_t *value, igraph_int_t source, igraph_int_t target, const igraph_vector_t *capacity, igraph_maxflow_stats_t *stats);
    attach_function :igraph_maxflow_value, %i[pointer pointer long_long long_long pointer pointer], :int

    # igraph_error_t igraph_edge_connectivity(const igraph_t *graph, igraph_int_t *res, igraph_bool_t checks);
    attach_function :igraph_edge_connectivity, %i[pointer pointer bool], :int

    # igraph_error_t igraph_edge_disjoint_paths(const igraph_t *graph, igraph_int_t *res, igraph_int_t source, igraph_int_t target);
    attach_function :igraph_edge_disjoint_paths, %i[pointer pointer long_long long_long], :int

    # igraph_error_t igraph_vertex_connectivity(const igraph_t *graph, igraph_int_t *res, igraph_bool_t checks);
    attach_function :igraph_vertex_connectivity, %i[pointer pointer bool], :int

    # igraph_error_t igraph_vertex_disjoint_paths(const igraph_t *graph, igraph_int_t *res, igraph_int_t source, igraph_int_t target);
    attach_function :igraph_vertex_disjoint_paths, %i[pointer pointer long_long long_long], :int

    # igraph_error_t igraph_st_edge_connectivity(const igraph_t *graph, igraph_int_t *res, igraph_int_t source, igraph_int_t target);
    attach_function :igraph_st_edge_connectivity, %i[pointer pointer long_long long_long], :int

    # igraph_error_t igraph_st_vertex_connectivity(const igraph_t *graph, igraph_int_t *res, igraph_int_t source, igraph_int_t target);
    attach_function :igraph_st_vertex_connectivity, %i[pointer pointer long_long long_long], :int

    # igraph_error_t igraph_mincut(const igraph_t *graph, igraph_real_t *value, igraph_vector_int_t *partition, igraph_vector_int_t *partition2, igraph_vector_int_t *cut, const igraph_vector_t *capacity);
    attach_function :igraph_mincut, %i[pointer pointer pointer pointer pointer pointer], :int

    # igraph_error_t igraph_mincut_value(const igraph_t *graph, igraph_real_t *res, const igraph_vector_t *capacity);
    attach_function :igraph_mincut_value, %i[pointer pointer pointer], :int

    # igraph_error_t igraph_st_mincut(const igraph_t *graph, igraph_real_t *value, igraph_vector_int_t *cut, igraph_vector_int_t *partition, igraph_vector_int_t *partition2, igraph_int_t source, igraph_int_t target, const igraph_vector_t *capacity);
    attach_function :igraph_st_mincut, %i[pointer pointer pointer pointer pointer long_long long_long pointer], :int

    # igraph_error_t igraph_st_mincut_value(const igraph_t *graph, igraph_real_t *res, igraph_int_t source, igraph_int_t target, const igraph_vector_t *capacity);
    attach_function :igraph_st_mincut_value, %i[pointer pointer long_long long_long pointer], :int

    # igraph_bool_t igraph_is_separator(const igraph_t *graph, const igraph_vs_t candidate, igraph_bool_t *res);
    attach_function :igraph_is_separator, %i[pointer pointer pointer], :int

    # igraph_error_t igraph_all_minimal_st_separators(const igraph_t *graph, igraph_vector_int_list_t *separators);
    attach_function :igraph_all_minimal_st_separators, %i[pointer pointer], :int

    # igraph_bool_t igraph_is_minimal_separator(const igraph_t *graph, const igraph_vs_t candidate, igraph_bool_t *res);
    attach_function :igraph_is_minimal_separator, %i[pointer pointer pointer], :int

    # igraph_error_t igraph_minimum_size_separators(const igraph_t *graph, igraph_vector_int_list_t *separators);
    attach_function :igraph_minimum_size_separators, %i[pointer pointer], :int

    # igraph_error_t igraph_is_eulerian(const igraph_t *graph, igraph_bool_t *has_path, igraph_bool_t *has_cycle);
    attach_function :igraph_is_eulerian, %i[pointer pointer pointer], :int

    # igraph_error_t igraph_eulerian_path(const igraph_t *graph, igraph_vector_int_t *edge_res, igraph_vector_int_t *vertex_res);
    attach_function :igraph_eulerian_path, %i[pointer pointer pointer], :int

    # igraph_error_t igraph_eulerian_cycle(const igraph_t *graph, igraph_vector_int_t *edge_res, igraph_vector_int_t *vertex_res);
    attach_function :igraph_eulerian_cycle, %i[pointer pointer pointer], :int
  end
end
