require "ffi"
require_relative "datatype"
require_relative "vector"
require_relative "matrix"

module IGraph
  module LibIGraph
    # igraph_error_t igraph_distances(const igraph_t *graph, igraph_matrix_t *res, const igraph_vs_t from, const igraph_vs_t to, igraph_neimode_t mode);
    attach_function :igraph_distances, %i[pointer pointer int int int], :int

    # igraph_error_t igraph_distances_cutoff(const igraph_t *graph, igraph_matrix_t *res, const igraph_vs_t from, const igraph_vs_t to, igraph_neimode_t mode, igraph_real_t cutoff);
    attach_function :igraph_distances_cutoff, %i[pointer pointer int int int double], :int

    # igraph_error_t igraph_distances_bellman_ford(const igraph_t *graph, igraph_matrix_t *res, const igraph_vs_t from, const igraph_vs_t to, const igraph_vector_t *weights, igraph_neimode_t mode);
    attach_function :igraph_distances_bellman_ford, %i[pointer pointer int int pointer int], :int

    # igraph_error_t igraph_distances_dijkstra(const igraph_t *graph, igraph_matrix_t *res, const igraph_vs_t from, const igraph_vs_t to, const igraph_vector_t *weights, igraph_neimode_t mode);
    attach_function :igraph_distances_dijkstra, %i[pointer pointer int int pointer int], :int

    # igraph_error_t igraph_distances_dijkstra_cutoff(const igraph_t *graph, igraph_matrix_t *res, const igraph_vs_t from, const igraph_vs_t to, const igraph_vector_t *weights, igraph_neimode_t mode, igraph_real_t cutoff);
    attach_function :igraph_distances_dijkstra_cutoff, %i[pointer pointer int int pointer int double], :int

    # igraph_error_t igraph_distances_floyd_warshall(const igraph_t *graph, igraph_matrix_t *res, const igraph_vs_t from, const igraph_vs_t to, const igraph_vector_t *weights, igraph_neimode_t mode);
    attach_function :igraph_distances_floyd_warshall, %i[pointer pointer int int pointer int], :int

    # igraph_error_t igraph_distances_johnson(const igraph_t *graph, igraph_matrix_t *res, const igraph_vs_t from, const igraph_vs_t to, const igraph_vector_t *weights);
    attach_function :igraph_distances_johnson, %i[pointer pointer int int pointer], :int

    # igraph_error_t igraph_diameter(const igraph_t *graph, igraph_real_t *res, igraph_integer_t *from, igraph_integer_t *to, igraph_bool_t directed, igraph_bool_t unconn);
    attach_function :igraph_diameter, %i[pointer pointer pointer pointer bool bool], :int

    # igraph_error_t igraph_pseudo_diameter(const igraph_t *graph, igraph_real_t *res, igraph_integer_t *from, igraph_integer_t *to, igraph_bool_t directed, igraph_bool_t unconn);
    attach_function :igraph_pseudo_diameter, %i[pointer pointer pointer pointer bool bool], :int

    # igraph_error_t igraph_radius(const igraph_t *graph, igraph_real_t *radius, igraph_neimode_t mode);
    attach_function :igraph_radius, %i[pointer pointer int], :int

    # igraph_error_t igraph_eccentricity(const igraph_t *graph, igraph_vector_t *res, const igraph_vs_t vids, igraph_neimode_t mode);
    attach_function :igraph_eccentricity, %i[pointer pointer int int], :int

    # igraph_error_t igraph_graph_center(const igraph_t *graph, igraph_vector_int_t *res, igraph_neimode_t mode);
    attach_function :igraph_graph_center, %i[pointer pointer int], :int

    # igraph_error_t igraph_average_path_length(const igraph_t *graph, igraph_real_t *res, igraph_real_t *unconn_pairs, igraph_bool_t directed, igraph_bool_t unconn);
    attach_function :igraph_average_path_length, %i[pointer pointer pointer bool bool], :int

    # igraph_error_t igraph_path_length_hist(const igraph_t *graph, igraph_vector_t *res, igraph_real_t *unconn, igraph_bool_t directed);
    attach_function :igraph_path_length_hist, %i[pointer pointer pointer bool], :int

    # igraph_error_t igraph_global_efficiency(const igraph_t *graph, igraph_real_t *res, const igraph_vector_t *weights, igraph_bool_t directed);
    attach_function :igraph_global_efficiency, %i[pointer pointer pointer bool], :int

    # igraph_error_t igraph_local_efficiency(const igraph_t *graph, igraph_vector_t *res, const igraph_vs_t vids, const igraph_vector_t *weights, igraph_bool_t directed, igraph_neimode_t mode);
    attach_function :igraph_local_efficiency, %i[pointer pointer pointer pointer bool int], :int

    # igraph_error_t igraph_average_local_efficiency(const igraph_t *graph, igraph_real_t *res, const igraph_vector_t *weights, igraph_bool_t directed, igraph_neimode_t mode);
    attach_function :igraph_average_local_efficiency, %i[pointer pointer pointer bool int], :int

    # igraph_error_t igraph_get_shortest_paths_dijkstra(const igraph_t *graph, igraph_vector_int_list_t *vertices, igraph_vector_int_list_t *edges, igraph_integer_t from, const igraph_vs_t to, const igraph_vector_t *weights, igraph_neimode_t mode, igraph_vector_int_t *predecessors, igraph_vector_int_t *inbound_edges);
    attach_function :igraph_get_shortest_paths_dijkstra, %i[pointer pointer pointer long_long int pointer int pointer pointer], :int

    # igraph_error_t igraph_get_shortest_paths_bellman_ford(const igraph_t *graph, igraph_vector_int_list_t *vertices, igraph_vector_int_list_t *edges, igraph_integer_t from, const igraph_vs_t to, const igraph_vector_t *weights, igraph_neimode_t mode, igraph_vector_int_t *predecessors, igraph_vector_int_t *inbound_edges);
    attach_function :igraph_get_shortest_paths_bellman_ford, %i[pointer pointer pointer long_long int pointer int pointer pointer], :int

    # igraph_error_t igraph_get_shortest_path(const igraph_t *graph, igraph_vector_int_t *vertices, igraph_vector_int_t *edges, igraph_integer_t from, igraph_integer_t to, igraph_neimode_t mode);
    attach_function :igraph_get_shortest_path, %i[pointer pointer pointer long_long long_long int], :int

    # igraph_error_t igraph_get_shortest_path_dijkstra(const igraph_t *graph, igraph_vector_int_t *vertices, igraph_vector_int_t *edges, igraph_integer_t from, igraph_integer_t to, const igraph_vector_t *weights, igraph_neimode_t mode);
    attach_function :igraph_get_shortest_path_dijkstra, %i[pointer pointer pointer long_long long_long pointer int], :int

    # igraph_error_t igraph_get_shortest_path_bellman_ford(const igraph_t *graph, igraph_vector_int_t *vertices, igraph_vector_int_t *edges, igraph_integer_t from, igraph_integer_t to, const igraph_vector_t *weights, igraph_neimode_t mode);
    attach_function :igraph_get_shortest_path_bellman_ford, %i[pointer pointer pointer long_long long_long pointer int], :int

    # igraph_error_t igraph_get_shortest_path_astar(const igraph_t *graph, igraph_vector_int_t *vertices, igraph_vector_int_t *edges, igraph_integer_t from, igraph_integer_t to, const igraph_vector_t *weights, igraph_neimode_t mode, igraph_astar_heuristic_func_t *heuristic, void *extra);
    attach_function :igraph_get_shortest_path_astar, %i[pointer pointer pointer long_long long_long pointer int pointer pointer], :int

    # igraph_error_t igraph_get_all_shortest_paths(const igraph_t *graph, igraph_matrix_t *res, igraph_vector_int_list_t *nrgeo, igraph_vector_int_list_t *inbound_edges, const igraph_vector_t *weights, igraph_neimode_t mode);
    attach_function :igraph_get_all_shortest_paths, %i[pointer pointer pointer pointer pointer int], :int

    # igraph_error_t igraph_get_all_shortest_paths_dijkstra(const igraph_t *graph, igraph_matrix_t *res, igraph_vector_int_list_t *nrgeo, igraph_vector_int_list_t *inbound_edges, const igraph_vector_t *weights, igraph_neimode_t mode);
    attach_function :igraph_get_all_shortest_paths_dijkstra, %i[pointer pointer pointer pointer pointer int], :int

    # igraph_error_t igraph_get_all_simple_paths(const igraph_t *graph, igraph_vector_int_t *res, igraph_integer_t from, const igraph_vs_t to, igraph_neimode_t mode, igraph_integer_t cutoff);
    attach_function :igraph_get_all_simple_paths, %i[pointer pointer long_long int int long_long], :int

    # igraph_error_t igraph_get_k_shortest_paths(const igraph_t *graph, igraph_vector_int_list_t *vertices, igraph_vector_int_list_t *edges, igraph_integer_t k, igraph_integer_t from, const igraph_vs_t to, const igraph_vector_t *weights, igraph_neimode_t mode);
    attach_function :igraph_get_k_shortest_paths, %i[pointer pointer pointer long_long long_long int pointer int], :int

    # igraph_error_t igraph_get_widest_paths(const igraph_t *graph, igraph_vector_int_list_t *vertices, igraph_vector_int_list_t *edges, igraph_vector_int_list_t *weights, igraph_integer_t from, const igraph_vs_t to, const igraph_vector_t *capacity, igraph_neimode_t mode);
    attach_function :igraph_get_widest_paths, %i[pointer pointer pointer pointer long_long int pointer int], :int

    # igraph_error_t igraph_get_widest_path(const igraph_t *graph, igraph_vector_int_t *vertices, igraph_vector_int_t *edges, igraph_vector_t *weights, igraph_integer_t from, igraph_integer_t to, const igraph_vector_t *capacity, igraph_neimode_t mode);
    attach_function :igraph_get_widest_path, %i[pointer pointer pointer pointer long_long long_long pointer int], :int

    # igraph_error_t igraph_widest_path_widths_dijkstra(const igraph_t *graph, igraph_matrix_t *res, const igraph_vs_t from, const igraph_vs_t to, const igraph_vector_t *capacity, igraph_neimode_t mode);
    attach_function :igraph_widest_path_widths_dijkstra, %i[pointer pointer int int pointer int], :int

    # igraph_error_t igraph_widest_path_widths_floyd_warshall(const igraph_t *graph, igraph_matrix_t *res, const igraph_vs_t from, const igraph_vs_t to, const igraph_vector_t *capacity, igraph_neimode_t mode);
    attach_function :igraph_widest_path_widths_floyd_warshall, %i[pointer pointer int int pointer int], :int

    # igraph_error_t igraph_spanner(const igraph_t *graph, igraph_vector_int_t *res, igraph_real_t stretch, igraph_spanner_algorithm_t algorithm);
    attach_function :igraph_spanner, %i[pointer pointer double int], :int

    # igraph_error_t igraph_random_walk(const igraph_t *graph, igraph_vector_int_t *walk, igraph_integer_t start, igraph_neimode_t mode, igraph_integer_t steps, igraph_random_walk_stuck_t stuck);
    attach_function :igraph_random_walk, %i[pointer pointer long_long int long_long int], :int

    # igraph_error_t igraph_voronoi(const igraph_t *graph, igraph_vector_int_t *membership, igraph_vector_t *distances, const igraph_vector_int_t *generators, const igraph_vector_t *weights, igraph_neimode_t mode);
    attach_function :igraph_voronoi, %i[pointer pointer pointer pointer pointer int], :int

    # igraph_error_t igraph_expand_path_to_pairs(const igraph_t *graph, const igraph_vector_int_t *path, const igraph_vector_t *weights, igraph_vector_int_t *pairs);
    attach_function :igraph_expand_path_to_pairs, %i[pointer pointer pointer pointer], :int

    # igraph_error_t igraph_vertex_path_from_edge_path(const igraph_t *graph, igraph_integer_t start, const igraph_vector_int_t *edge_path, igraph_vector_int_t *vertex_path);
    attach_function :igraph_vertex_path_from_edge_path, %i[pointer long_long pointer pointer], :int
  end
end
