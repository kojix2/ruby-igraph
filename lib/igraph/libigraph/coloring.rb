require "ffi"
require_relative "datatype"
require_relative "vector"

module IGraph
  module LibIGraph
    # igraph_error_t igraph_vertex_coloring_greedy(const igraph_t *graph, igraph_vector_int_t *colors, igraph_coloring_greedy_t heuristic);
    attach_function :igraph_vertex_coloring_greedy, %i[pointer pointer int], :int

    # igraph_bool_t igraph_is_vertex_coloring(const igraph_t *graph, const igraph_vector_int_t *types, igraph_bool_t *res);
    attach_function :igraph_is_vertex_coloring, %i[pointer pointer pointer], :int

    # igraph_bool_t igraph_is_bipartite_coloring(const igraph_t *graph, const igraph_vector_bool_t *types, igraph_bool_t *res, igraph_neimode_t *mode);
    attach_function :igraph_is_bipartite_coloring, %i[pointer pointer pointer pointer], :int

    # igraph_bool_t igraph_is_edge_coloring(const igraph_t *graph, const igraph_vector_int_t *types, igraph_bool_t *res);
    attach_function :igraph_is_edge_coloring, %i[pointer pointer pointer], :int
  end
end
