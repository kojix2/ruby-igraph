require "ffi"
require_relative "datatype"
require_relative "vector"

module IGraph
  module LibIGraph
    # igraph_error_t igraph_adjlist_init(const igraph_t *graph, igraph_adjlist_t *al, igraph_neimode_t mode, igraph_loops_t loops, igraph_bool_t multiple);
    attach_function :igraph_adjlist_init, %i[pointer pointer int int bool], :int

    # igraph_error_t igraph_adjlist_init_empty(igraph_adjlist_t *al, igraph_int_t no_of_nodes);
    attach_function :igraph_adjlist_init_empty, %i[pointer long_long], :int

    # igraph_error_t igraph_adjlist_init_complementer(const igraph_t *graph, igraph_adjlist_t *al, igraph_neimode_t mode, igraph_loops_t loops);
    attach_function :igraph_adjlist_init_complementer, %i[pointer pointer int int], :int

    # igraph_error_t igraph_adjlist_init_from_inclist(const igraph_t *graph, igraph_adjlist_t *al, const igraph_inclist_t *il);
    attach_function :igraph_adjlist_init_from_inclist, %i[pointer pointer pointer], :int

    # void igraph_adjlist_destroy(igraph_adjlist_t *al);
    attach_function :igraph_adjlist_destroy, [:pointer], :void

    # void igraph_adjlist_clear(igraph_adjlist_t *al);
    attach_function :igraph_adjlist_clear, [:pointer], :void

    # void igraph_adjlist_sort(igraph_adjlist_t *al);
    attach_function :igraph_adjlist_sort, [:pointer], :void

    # igraph_error_t igraph_adjlist_simplify(igraph_adjlist_t *al);
    attach_function :igraph_adjlist_simplify, [:pointer], :int

    # igraph_error_t igraph_adjlist_print(const igraph_adjlist_t *al);
    attach_function :igraph_adjlist_print, [:pointer], :int

    # igraph_error_t igraph_adjlist_fprint(const igraph_adjlist_t *al, FILE *outfile);
    attach_function :igraph_adjlist_fprint, %i[pointer pointer], :int

    # igraph_error_t igraph_adjlist_replace_edge(igraph_adjlist_t* al, igraph_int_t from, igraph_int_t oldto, igraph_int_t newto, igraph_bool_t directed);
    attach_function :igraph_adjlist_replace_edge, %i[pointer long_long long_long long_long bool], :int

    # igraph_error_t igraph_adjlist(igraph_t *graph, const igraph_adjlist_t *adjlist, igraph_neimode_t mode, igraph_bool_t duplicate);
    attach_function :igraph_adjlist, %i[pointer pointer int bool], :int

    # igraph_error_t igraph_inclist_init(const igraph_t *graph, igraph_inclist_t *il, igraph_neimode_t mode, igraph_loops_t loops);
    attach_function :igraph_inclist_init, %i[pointer pointer int int], :int

    # igraph_error_t igraph_inclist_init_empty(igraph_inclist_t *il, igraph_int_t n);
    attach_function :igraph_inclist_init_empty, %i[pointer long_long], :int

    # void igraph_inclist_destroy(igraph_inclist_t *il);
    attach_function :igraph_inclist_destroy, [:pointer], :void

    # void igraph_inclist_clear(igraph_inclist_t *il);
    attach_function :igraph_inclist_clear, [:pointer], :void

    # igraph_error_t igraph_inclist_print(const igraph_inclist_t *il);
    attach_function :igraph_inclist_print, [:pointer], :int

    # igraph_error_t igraph_inclist_fprint(const igraph_inclist_t *il, FILE *outfile);
    attach_function :igraph_inclist_fprint, %i[pointer pointer], :int

    # igraph_error_t igraph_lazy_adjlist_init(const igraph_t *graph, igraph_lazy_adjlist_t *al, igraph_neimode_t mode, igraph_loops_t loops, igraph_bool_t multiple);
    attach_function :igraph_lazy_adjlist_init, %i[pointer pointer int int bool], :int

    # void igraph_lazy_adjlist_destroy(igraph_lazy_adjlist_t *al);
    attach_function :igraph_lazy_adjlist_destroy, [:pointer], :void

    # void igraph_lazy_adjlist_clear(igraph_lazy_adjlist_t *al);
    attach_function :igraph_lazy_adjlist_clear, [:pointer], :void

    # igraph_error_t igraph_lazy_inclist_init(const igraph_t *graph, igraph_lazy_inclist_t *il, igraph_neimode_t mode, igraph_loops_t loops);
    attach_function :igraph_lazy_inclist_init, %i[pointer pointer int int], :int

    # void igraph_lazy_inclist_destroy(igraph_lazy_inclist_t *il);
    attach_function :igraph_lazy_inclist_destroy, [:pointer], :void

    # void igraph_lazy_inclist_clear(igraph_lazy_inclist_t *il);
    attach_function :igraph_lazy_inclist_clear, [:pointer], :void

    # Additional neighbor/graphlet operations
    # igraph_error_t igraph_adjacent_vertices(const igraph_t *graph, igraph_vs_t *vids, igraph_int_t vertex, igraph_neimode_t mode);
    attach_function :igraph_adjacent_vertices, %i[pointer pointer long_long int], :int

    # igraph_error_t igraph_adjacent_triangles(const igraph_t *graph, igraph_vector_t *res, igraph_int_t vertex, igraph_vs_t vids);
    attach_function :igraph_adjacent_triangles, %i[pointer pointer long_long pointer], :int

    # igraph_error_t igraph_eccentricity_diameter(const igraph_t *graph, igraph_vector_t *ecc, igraph_int_t *diameter);
    attach_function :igraph_eccentricity_diameter, %i[pointer pointer pointer], :int
  end
end
