require "ffi"
require_relative "datatype"
require_relative "vector"

module IGraph
  module LibIGraph
    # igraph_error_t igraph_clusters(const igraph_t *graph, igraph_vector_int_t *membership, igraph_vector_int_t *csize, igraph_int_t *no, igraph_connectedness_t mode);
    attach_function :igraph_clusters, %i[pointer pointer pointer pointer int], :int

    # igraph_error_t igraph_is_connected(const igraph_t *graph, igraph_bool_t *res, igraph_connectedness_t mode);
    attach_function :igraph_is_connected, %i[pointer pointer int], :int

    # igraph_error_t igraph_decompose(const igraph_t *graph, igraph_graph_list_t *components, igraph_connectedness_t mode, igraph_int_t maxcompno, igraph_int_t minelements);
    attach_function :igraph_decompose, %i[pointer pointer int long_long long_long], :int

    # igraph_error_t igraph_articulation_points(const igraph_t *graph, igraph_vector_int_t *res);
    attach_function :igraph_articulation_points, %i[pointer pointer], :int

    # igraph_error_t igraph_biconnected_components(const igraph_t *graph, igraph_int_t *no, igraph_vector_int_t *tree_edges, igraph_vector_int_t *component_edges, igraph_vector_int_t *components, igraph_vector_int_t *articulation_points);
    attach_function :igraph_biconnected_components, %i[pointer pointer pointer pointer pointer pointer], :int

    # igraph_error_t igraph_bridges(const igraph_t *graph, igraph_vector_int_t *bridges);
    attach_function :igraph_bridges, %i[pointer pointer], :int

    # igraph_error_t igraph_decompose_destroy(igraph_graph_list_t *complist);
    attach_function :igraph_decompose_destroy, [:pointer], :void

    # igraph_bool_t igraph_is_biconnected(const igraph_t *graph);
    attach_function :igraph_is_biconnected, [:pointer], :bool

    # igraph_bool_t igraph_has_multiple(const igraph_t *graph);
    attach_function :igraph_has_multiple, %i[pointer pointer], :int
  end
end
