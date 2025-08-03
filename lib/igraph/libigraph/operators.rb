require "ffi"
require_relative "datatype"
require_relative "vector"

module IGraph
  module LibIGraph
    # igraph_error_t igraph_disjoint_union(igraph_t *res, const igraph_t *left, const igraph_t *right);
    attach_function :igraph_disjoint_union, %i[pointer pointer pointer], :int

    # igraph_error_t igraph_union(igraph_t *res, const igraph_t *left, const igraph_t *right, igraph_vector_int_t *edge_map1, igraph_vector_int_t *edge_map2);
    attach_function :igraph_union, %i[pointer pointer pointer pointer pointer], :int

    # igraph_error_t igraph_intersection(igraph_t *res, const igraph_t *left, const igraph_t *right, igraph_vector_int_t *edge_map1, igraph_vector_int_t *edge_map2);
    attach_function :igraph_intersection, %i[pointer pointer pointer pointer pointer], :int

    # igraph_error_t igraph_difference(igraph_t *res, const igraph_t *orig, const igraph_t *sub);
    attach_function :igraph_difference, %i[pointer pointer pointer], :int

    # igraph_error_t igraph_complementer(igraph_t *res, const igraph_t *graph, igraph_bool_t loops);
    attach_function :igraph_complementer, %i[pointer pointer bool], :int
  end
end
