require "ffi"
require_relative "datatype"
require_relative "vector"

module IGraph
  module LibIGraph
    # igraph_error_t igraph_spatial_order(const igraph_vector_t *x, const igraph_vector_t *y, const igraph_vector_t *z, igraph_vector_int_t *order);
    attach_function :igraph_spatial_order, %i[pointer pointer pointer pointer], :int

    # igraph_error_t igraph_add_spatial_edges(igraph_t *graph, const igraph_vector_t *x, const igraph_vector_t *y, const igraph_vector_t *z, igraph_vector_int_t *neighbors, igraph_int_t max_neighbors, igraph_bool_t directed, const igraph_vector_t *weights);
    attach_function :igraph_add_spatial_edges, %i[pointer pointer pointer pointer pointer long_long bool pointer], :int

    # igraph_error_t igraph_spatial_neighbor_distances(const igraph_t *graph, const igraph_vector_t *x, const igraph_vector_t *y, const igraph_vector_t *z, igraph_vector_t *res, igraph_neimode_t mode);
    attach_function :igraph_spatial_neighbor_distances, %i[pointer pointer pointer pointer pointer int], :int

    # igraph_error_t igraph_spatial_network_connectivity(const igraph_t *graph, const igraph_vector_t *x, const igraph_vector_t *y, const igraph_vector_t *z, igraph_real_t radius, igraph_real_t *res, igraph_bool_t directed);
    attach_function :igraph_spatial_network_connectivity, %i[pointer pointer pointer pointer double pointer bool], :int

    # igraph_error_t igraph_delaunay(const igraph_t *graph, const igraph_vector_t *x, const igraph_vector_t *y, const igraph_vector_t *z, igraph_bool_t directed, igraph_real_t *res);
    attach_function :igraph_delaunay, %i[pointer pointer pointer pointer bool pointer], :int

    # igraph_error_t igraph_farthest_points(const igraph_t *graph, igraph_int_t *from, igraph_int_t *to, const igraph_vector_t *x, const igraph_vector_t *y, const igraph_vector_t *z);
    attach_function :igraph_farthest_points, %i[pointer pointer pointer pointer pointer pointer], :int

    # igraph_error_t igraph_convex_hull(const igraph_matrix_t *points, igraph_vector_int_t *hull);
    attach_function :igraph_convex_hull, %i[pointer pointer], :int
  end
end