require "ffi"
require_relative "datatype"
require_relative "vector"

module IGraph
  module LibIGraph
    # igraph_error_t igraph_disjoint_union(igraph_t *res, const igraph_t *left, const igraph_t *right);
    attach_function :igraph_disjoint_union, %i[pointer pointer pointer], :int

    # igraph_error_t igraph_disjoint_union_many(igraph_t *res, const igraph_vector_ptr_t *graphs);
    attach_function :igraph_disjoint_union_many, %i[pointer pointer], :int

    # igraph_error_t igraph_union(igraph_t *res, const igraph_t *left, const igraph_t *right, igraph_vector_int_t *edge_map1, igraph_vector_int_t *edge_map2);
    attach_function :igraph_union, %i[pointer pointer pointer pointer pointer], :int

    # igraph_error_t igraph_union_many(igraph_t *res, const igraph_vector_ptr_t *graphs, igraph_vector_ptr_t *edgemaps);
    attach_function :igraph_union_many, %i[pointer pointer pointer], :int

    # igraph_error_t igraph_intersection(igraph_t *res, const igraph_t *left, const igraph_t *right, igraph_vector_int_t *edge_map1, igraph_vector_int_t *edge_map2);
    attach_function :igraph_intersection, %i[pointer pointer pointer pointer pointer], :int

    # igraph_error_t igraph_intersection_many(igraph_t *res, const igraph_vector_ptr_t *graphs, igraph_vector_ptr_t *edgemaps);
    attach_function :igraph_intersection_many, %i[pointer pointer pointer], :int

    # igraph_error_t igraph_difference(igraph_t *res, const igraph_t *orig, const igraph_t *sub);
    attach_function :igraph_difference, %i[pointer pointer pointer], :int

    # igraph_error_t igraph_complementer(igraph_t *res, const igraph_t *graph, igraph_bool_t loops);
    attach_function :igraph_complementer, %i[pointer pointer bool], :int

    # igraph_error_t igraph_compose(igraph_t *res, const igraph_t *g1, const igraph_t *g2, igraph_vector_int_t *edge_map1, igraph_vector_int_t *edge_map2);
    attach_function :igraph_compose, %i[pointer pointer pointer pointer pointer], :int

    # igraph_error_t igraph_connect_neighborhood(igraph_t *graph, igraph_integer_t order, igraph_neimode_t mode);
    attach_function :igraph_connect_neighborhood, %i[pointer long_long int], :int

    # igraph_error_t igraph_contract_vertices(igraph_t *graph, const igraph_vector_int_t *mapping, const igraph_attribute_combination_t *vertex_comb);
    attach_function :igraph_contract_vertices, %i[pointer pointer pointer], :int

    # igraph_error_t igraph_graph_power(igraph_t *graph, igraph_t *res, igraph_integer_t order, igraph_bool_t directed);
    attach_function :igraph_graph_power, %i[pointer pointer long_long bool], :int

    # igraph_error_t igraph_induced_subgraph(const igraph_t *graph, igraph_t *res, const igraph_vs_t vids, igraph_subgraph_implementation_t impl);
    attach_function :igraph_induced_subgraph, %i[pointer pointer pointer int], :int

    # igraph_error_t igraph_induced_subgraph_edges(const igraph_t *graph, igraph_t *res, const igraph_es_t eids, igraph_subgraph_implementation_t impl);
    attach_function :igraph_induced_subgraph_edges, %i[pointer pointer pointer int], :int

    # igraph_error_t igraph_induced_subgraph_map(const igraph_t *graph, igraph_t *res, const igraph_vs_t vids, igraph_subgraph_implementation_t impl, igraph_vector_int_t *map, igraph_vector_int_t *invmap);
    attach_function :igraph_induced_subgraph_map, %i[pointer pointer pointer int pointer pointer], :int

    # igraph_error_t igraph_subgraph_from_edges(const igraph_t *graph, igraph_t *res, const igraph_es_t eids, igraph_bool_t delete_vertices);
    attach_function :igraph_subgraph_from_edges, %i[pointer pointer pointer bool], :int

    # igraph_error_t igraph_add_edge(igraph_t *graph, igraph_vector_int_t *from, igraph_vector_int_t *to);
    attach_function :igraph_add_edge, %i[pointer pointer pointer], :int

    # igraph_error_t igraph_join(igraph_t *res, const igraph_t *left, const igraph_t *right);
    attach_function :igraph_join, %i[pointer pointer pointer], :int

    # igraph_error_t igraph_mycielskian(const igraph_t *graph, igraph_t *res);
    attach_function :igraph_mycielskian, %i[pointer pointer], :int

    # igraph_error_t igraph_product(const igraph_t *graph1, const igraph_t *graph2, igraph_t *res, igraph_product_t type);
    attach_function :igraph_product, %i[pointer pointer pointer int], :int

    # igraph_error_t igraph_reverse_edges(igraph_t *graph, igraph_es_t eids);
    attach_function :igraph_reverse_edges, %i[pointer pointer], :int

    # igraph_error_t igraph_rewire(igraph_t *graph, igraph_integer_t n, igraph_rewiring_t mode);
    attach_function :igraph_rewire, %i[pointer long_long int], :int

    # igraph_error_t igraph_rooted_product(const igraph_t *graph1, const igraph_t *graph2, igraph_t *res, igraph_rooted_product_t type);
    attach_function :igraph_rooted_product, %i[pointer pointer pointer int], :int

    # igraph_error_t igraph_simplify(igraph_t *graph, igraph_bool_t multiple, igraph_bool_t loops, const igraph_attribute_combination_t *edge_comb);
    attach_function :igraph_simplify, %i[pointer bool bool pointer], :int
  end
end
