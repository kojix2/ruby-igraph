require "ffi"
require_relative "datatype"
require_relative "vector"
require_relative "matrix"

module IGraph
  module LibIGraph
    # igraph_vs_t: VertexSelector (defined in interface.rb)

    # igraph_error_t igraph_vs_adj(igraph_vs_t *vs, igraph_int_t vid, igraph_neimode_t mode, igraph_loops_t loops, igraph_bool_t multiple);
    attach_function :igraph_vs_adj, %i[pointer long_long int int bool], :int

    # igraph_error_t igraph_vs_nonadj(igraph_vs_t *vs, igraph_int_t vid, igraph_neimode_t mode);
    attach_function :igraph_vs_nonadj, %i[pointer long_long int], :int

    # igraph_error_t igraph_vs_none(igraph_vs_t *vs);
    attach_function :igraph_vs_none, [:pointer], :int

    # igraph_error_t igraph_vs_1(igraph_vs_t *vs, igraph_int_t vid);
    attach_function :igraph_vs_1, %i[pointer long_long], :int

    # igraph_error_t igraph_vs_vector(igraph_vs_t *vs, const igraph_vector_int_t *v);
    attach_function :igraph_vs_vector, %i[pointer pointer], :int

    # igraph_error_t igraph_vs_vector_small(igraph_vs_t *vs, ...);
    attach_function :igraph_vs_vector_small, %i[pointer varargs], :int

    # igraph_error_t igraph_vs_vector_copy(igraph_vs_t *vs, const igraph_vector_int_t *v);
    attach_function :igraph_vs_vector_copy, %i[pointer pointer], :int

    # igraph_error_t igraph_vs_range(igraph_vs_t *vs, igraph_int_t start, igraph_int_t end);
    attach_function :igraph_vs_range, %i[pointer long_long long_long], :int

    # igraph_error_t igraph_vs_copy(igraph_vs_t* dest, const igraph_vs_t* src);
    attach_function :igraph_vs_copy, %i[pointer pointer], :int

    # igraph_error_t igraph_vs_as_vector(const igraph_t *graph, igraph_vs_t vs, igraph_vector_int_t *v);
    attach_function :igraph_vs_as_vector, %i[pointer pointer pointer], :int

    # igraph_error_t igraph_vs_size(const igraph_t *graph, const igraph_vs_t *vs, igraph_int_t *result);
    attach_function :igraph_vs_size, %i[pointer pointer pointer], :int

    # igraph_error_t igraph_vit_create(const igraph_t *graph, igraph_vs_t vs, igraph_vit_t *vit);
    attach_function :igraph_vit_create, %i[pointer pointer pointer], :int

    # void igraph_vit_destroy(const igraph_vit_t *vit);
    attach_function :igraph_vit_destroy, [:pointer], :void

    # igraph_error_t igraph_vit_as_vector(const igraph_vit_t *vit, igraph_vector_int_t *v);
    attach_function :igraph_vit_as_vector, %i[pointer pointer], :int

    # igraph_es_t functions
    # igraph_error_t igraph_es_all(igraph_es_t *es, igraph_edgeorder_type_t order);
    attach_function :igraph_es_all, %i[pointer int], :int

    # igraph_error_t igraph_es_incident(igraph_es_t *es, igraph_int_t vid, igraph_neimode_t mode, igraph_loops_t loops);
    attach_function :igraph_es_incident, %i[pointer long_long int int], :int

    # igraph_error_t igraph_es_none(igraph_es_t *es);
    attach_function :igraph_es_none, [:pointer], :int

    # igraph_error_t igraph_es_1(igraph_es_t *es, igraph_int_t eid);
    attach_function :igraph_es_1, %i[pointer long_long], :int

    # igraph_error_t igraph_es_vector(igraph_es_t *es, const igraph_vector_int_t *v);
    attach_function :igraph_es_vector, %i[pointer pointer], :int

    # igraph_error_t igraph_es_range(igraph_es_t *es, igraph_int_t from, igraph_int_t to);
    attach_function :igraph_es_range, %i[pointer long_long long_long], :int

    # igraph_error_t igraph_es_vector_copy(igraph_es_t *es, const igraph_vector_int_t *v);
    attach_function :igraph_es_vector_copy, %i[pointer pointer], :int

    # igraph_error_t igraph_es_pairs(igraph_es_t *es, const igraph_vector_int_t *v, igraph_bool_t directed);
    attach_function :igraph_es_pairs, %i[pointer pointer bool], :int

    # igraph_error_t igraph_es_pairs_small(igraph_es_t *es, igraph_bool_t directed, int first, ...);
    attach_function :igraph_es_pairs_small, %i[pointer bool int varargs], :int

    # igraph_error_t igraph_es_path(igraph_es_t *es, const igraph_vector_int_t *v, igraph_bool_t directed);
    attach_function :igraph_es_path, %i[pointer pointer bool], :int

    # igraph_error_t igraph_es_path_small(igraph_es_t *es, igraph_bool_t directed, int first, ...);
    attach_function :igraph_es_path_small, %i[pointer bool int varargs], :int

    # igraph_error_t igraph_es_all_between(igraph_es_t *es, igraph_int_t from, igraph_int_t to, igraph_bool_t directed);
    attach_function :igraph_es_all_between, %i[pointer long_long long_long bool], :int

    # void igraph_es_destroy(igraph_es_t *es);
    attach_function :igraph_es_destroy, [:pointer], :void

    # igraph_error_t igraph_es_copy(igraph_es_t* dest, const igraph_es_t* src);
    attach_function :igraph_es_copy, %i[pointer pointer], :int

    # igraph_error_t igraph_es_as_vector(const igraph_t *graph, igraph_es_t es, igraph_vector_int_t *v);
    attach_function :igraph_es_as_vector, %i[pointer pointer pointer], :int

    # igraph_error_t igraph_es_size(const igraph_t *graph, const igraph_es_t *es, igraph_int_t *result);
    attach_function :igraph_es_size, %i[pointer pointer pointer], :int

    # igraph_error_t igraph_eit_create(const igraph_t *graph, igraph_es_t es, igraph_eit_t *eit);
    attach_function :igraph_eit_create, %i[pointer pointer pointer], :int

    # void igraph_eit_destroy(const igraph_eit_t *eit);
    attach_function :igraph_eit_destroy, [:pointer], :void

    # igraph_error_t igraph_eit_as_vector(const igraph_eit_t *eit, igraph_vector_int_t *v);
    attach_function :igraph_eit_as_vector, %i[pointer pointer], :int
  end
end
