require "ffi"
require_relative "datatype"
require_relative "vector"
require_relative "matrix"

module IGraph
  module LibIGraph
    # igraph_error_t igraph_distances(const igraph_t *graph, igraph_matrix_t *res, const igraph_vs_t from, const igraph_vs_t to, igraph_neimode_t mode);
    attach_function :igraph_distances, %i[pointer pointer int int int], :int

    # igraph_error_t igraph_get_shortest_paths_dijkstra(const igraph_t *graph, igraph_vector_int_list_t *vertices, igraph_vector_int_list_t *edges, igraph_integer_t from, const igraph_vs_t to, const igraph_vector_t *weights, igraph_neimode_t mode, igraph_vector_int_t *predecessors, igraph_vector_int_t *inbound_edges);
    attach_function :igraph_get_shortest_paths_dijkstra,
                    %i[pointer pointer pointer long_long int pointer int pointer pointer], :int

    # igraph_error_t igraph_diameter(const igraph_t *graph, igraph_real_t *res, igraph_integer_t *from, igraph_integer_t *to, igraph_bool_t directed, igraph_bool_t unconn);
    attach_function :igraph_diameter, %i[pointer pointer pointer pointer bool bool], :int

    # igraph_error_t igraph_radius(const igraph_t *graph, igraph_real_t *radius, igraph_neimode_t mode);
    attach_function :igraph_radius, %i[pointer pointer int], :int

    # igraph_error_t igraph_eccentricity(const igraph_t *graph, igraph_vector_t *res, const igraph_vs_t vids, igraph_neimode_t mode);
    attach_function :igraph_eccentricity, %i[pointer pointer int int], :int
  end
end
