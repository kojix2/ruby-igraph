require "ffi"
require_relative "datatype"
require_relative "vector"
require_relative "matrix"

module IGraph
  module LibIGraph
    # igraph_error_t igraph_isoclass(const igraph_t *graph, igraph_int_t *isoclass);
    attach_function :igraph_isoclass, %i[pointer pointer], :int

    # igraph_error_t igraph_isoclass_subgraph(const igraph_t *graph, igraph_vector_int_t *vids, igraph_int_t *isoclass);
    attach_function :igraph_isoclass_subgraph, %i[pointer pointer pointer], :int

    # igraph_error_t igraph_isoclass_create(igraph_t *graph, igraph_int_t size, igraph_int_t number, igraph_bool_t directed);
    attach_function :igraph_isoclass_create, %i[pointer long_long long_long bool], :int

    # igraph_error_t igraph_isomorphic(const igraph_t *graph1, const igraph_t *graph2, igraph_bool_t *iso);
    attach_function :igraph_isomorphic, %i[pointer pointer pointer], :int

    # igraph_error_t igraph_isomorphic_34(const igraph_t *graph1, const igraph_t *graph2, igraph_bool_t *iso);
    attach_function :igraph_isomorphic_34, %i[pointer pointer pointer], :int

    # igraph_error_t igraph_isomorphic_vf2(const igraph_t *graph1, const igraph_t *graph2, const igraph_vector_int_t *vertex_color1, const igraph_vector_int_t *vertex_color2, const igraph_vector_int_t *edge_color1, const igraph_vector_int_t *edge_color2, igraph_bool_t *iso, igraph_vector_int_t *map12, igraph_vector_int_t *map21, igraph_isohandler_t *isohandler, igraph_isocompat_t *node_compat_fn, igraph_isocompat_t *edge_compat_fn, void *arg);
    attach_function :igraph_isomorphic_vf2, %i[pointer pointer pointer pointer pointer pointer pointer pointer pointer pointer pointer pointer pointer], :int

    # igraph_error_t igraph_subisomorphic(const igraph_t *graph1, const igraph_t *graph2, igraph_bool_t *iso);
    attach_function :igraph_subisomorphic, %i[pointer pointer pointer], :int

    # igraph_error_t igraph_subisomorphic_vf2(const igraph_t *graph1, const igraph_t *graph2, const igraph_vector_int_t *vertex_color1, const igraph_vector_int_t *vertex_color2, const igraph_vector_int_t *edge_color1, const igraph_vector_int_t *edge_color2, igraph_bool_t *iso, igraph_vector_int_t *map12, igraph_vector_int_t *map21, igraph_isohandler_t *isohandler, igraph_isocompat_t *node_compat_fn, igraph_isocompat_t *edge_compat_fn, void *arg);
    attach_function :igraph_subisomorphic_vf2, %i[pointer pointer pointer pointer pointer pointer pointer pointer pointer pointer pointer pointer pointer], :int

    # igraph_error_t igraph_get_subisomorphisms_vf2(const igraph_t *graph1, const igraph_t *graph2, const igraph_vector_int_t *vertex_color1, const igraph_vector_int_t *vertex_color2, const igraph_vector_int_t *edge_color1, const igraph_vector_int_t *edge_color2, igraph_vector_ptr_t *maps, igraph_isohandler_t *isohandler, igraph_isocompat_t *node_compat_fn, igraph_isocompat_t *edge_compat_fn, void *arg);
    attach_function :igraph_get_subisomorphisms_vf2, %i[pointer pointer pointer pointer pointer pointer pointer pointer pointer pointer pointer], :int

    # igraph_error_t igraph_automorphisms(const igraph_t *graph, igraph_vector_ptr_t *maps, igraph_bliss_info_t *info, igraph_bliss_sh_t sh);
    attach_function :igraph_automorphisms, %i[pointer pointer pointer pointer], :int

    # igraph_error_t igraph_isomorphic_bliss(const igraph_t *graph1, const igraph_t *graph2, const igraph_vector_int_t *vertex_color1, const igraph_vector_int_t *vertex_color2, igraph_bool_t *iso, igraph_vector_int_t *map12, igraph_vector_int_t *map21, igraph_bliss_info_t *info, igraph_bliss_sh_t sh);
    attach_function :igraph_isomorphic_bliss, %i[pointer pointer pointer pointer pointer pointer pointer pointer pointer], :int

    # igraph_error_t igraph_automorphism_group(const igraph_t *graph, const igraph_vector_int_t *colors, igraph_vector_t *generators, igraph_bliss_sh_t sh);
    attach_function :igraph_automorphism_group, %i[pointer pointer pointer pointer], :int

    # igraph_error_t igraph_canonical_permutation(const igraph_t *graph, const igraph_vector_int_t *colors, igraph_vector_int_t *labeling, igraph_bliss_sh_t sh);
    attach_function :igraph_canonical_permutation, %i[pointer pointer pointer pointer], :int

    # igraph_error_t igraph_permute_vertices(igraph_t *graph, igraph_t *res, const igraph_vector_int_t *permutation);
    attach_function :igraph_permute_vertices, %i[pointer pointer pointer], :int

    # igraph_error_t igraph_isomorphic_function_vf2(const igraph_t *graph1, const igraph_t *graph2, const igraph_vector_int_t *vertex_color1, const igraph_vector_int_t *vertex_color2, const igraph_vector_int_t *edge_color1, const igraph_vector_int_t *edge_color2, igraph_vector_int_t *map12, igraph_vector_int_t *map21, igraph_isohandler_t *isohandler, igraph_isocompat_t *node_compat_fn, igraph_isocompat_t *edge_compat_fn, void *arg);
    attach_function :igraph_isomorphic_function_vf2, %i[pointer pointer pointer pointer pointer pointer pointer pointer pointer pointer pointer pointer], :int

    # igraph_error_t igraph_bfs(const igraph_t *graph, igraph_int_t root, const igraph_vector_int_t *roots, igraph_neimode_t mode, igraph_bool_t unreachable, const igraph_vector_int_t *restricted, igraph_vector_int_t *order, igraph_vector_int_t *rank, igraph_vector_int_t *father, igraph_vector_int_t *pred, igraph_vector_int_t *succ, igraph_vector_int_t *dist, igraph_bfshandler_t *callback, void *extra);
    attach_function :igraph_bfs, %i[pointer long_long pointer int bool pointer pointer pointer pointer pointer pointer pointer pointer pointer], :int

    # igraph_error_t igraph_bfs_simple(const igraph_t *graph, igraph_int_t root, igraph_neimode_t mode, igraph_vector_int_t *order, igraph_vector_int_t *layers, igraph_vector_int_t *parents);
    attach_function :igraph_bfs_simple, %i[pointer long_long int pointer pointer pointer], :int

    # igraph_error_t igraph_dfs(const igraph_t *graph, igraph_int_t root, igraph_neimode_t mode, igraph_bool_t unreachable, igraph_vector_int_t *order, igraph_vector_int_t *order_out, igraph_vector_int_t *father, igraph_vector_int_t *dist, igraph_dfshandler_t *in_callback, igraph_dfshandler_t *out_callback, void *extra);
    attach_function :igraph_dfs, %i[pointer long_long int bool pointer pointer pointer pointer pointer pointer pointer], :int
  end
end
