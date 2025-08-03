require "ffi"
require_relative "datatype"
require_relative "vector"

module IGraph
  module LibIGraph
    # igraph_error_t igraph_topological_sorting(const igraph_t *graph, igraph_vector_int_t *res, igraph_neimode_t mode);
    attach_function :igraph_topological_sorting, %i[pointer pointer int], :int

    # igraph_error_t igraph_isomorphic(const igraph_t *graph1, const igraph_t *graph2, igraph_bool_t *iso);
    attach_function :igraph_isomorphic, %i[pointer pointer pointer], :int

    # igraph_error_t igraph_isomorphic_vf2(const igraph_t *graph1, const igraph_t *graph2, const igraph_vector_int_t *vertex_color1, const igraph_vector_int_t *vertex_color2, const igraph_vector_int_t *edge_color1, const igraph_vector_int_t *edge_color2, igraph_bool_t *iso, igraph_vector_int_t *map12, igraph_vector_int_t *map21, igraph_isohandler_t *isohandler, igraph_isocompat_t *node_compat_fn, igraph_isocompat_t *edge_compat_fn, void *arg);
    attach_function :igraph_isomorphic_vf2,
                    %i[pointer pointer pointer pointer pointer pointer pointer pointer pointer pointer pointer pointer pointer], :int
  end
end
