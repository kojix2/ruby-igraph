require "ffi"
require_relative "datatype"
require_relative "vector"

module IGraph
  module LibIGraph
    # --- Graph attributes (GAN/GAB/GAS) ---
    # igraph_error_t igraph_cattribute_GAN(const igraph_t *graph, const char *name, igraph_real_t *value);
    attach_function :igraph_cattribute_GAN, %i[pointer string pointer], :int

    # igraph_error_t igraph_cattribute_GAB(const igraph_t *graph, const char *name, igraph_bool_t *value);
    attach_function :igraph_cattribute_GAB, %i[pointer string pointer], :int

    # igraph_error_t igraph_cattribute_GAS(const igraph_t *graph, const char *name, const char **value);
    attach_function :igraph_cattribute_GAS, %i[pointer string pointer], :int

    # igraph_error_t igraph_cattribute_GAN_set(igraph_t *graph, const char *name, igraph_real_t value);
    attach_function :igraph_cattribute_GAN_set, %i[pointer string double], :int

    # igraph_error_t igraph_cattribute_GAB_set(igraph_t *graph, const char *name, igraph_bool_t value);
    attach_function :igraph_cattribute_GAB_set, %i[pointer string bool], :int

    # igraph_error_t igraph_cattribute_GAS_set(igraph_t *graph, const char *name, const char *value);
    attach_function :igraph_cattribute_GAS_set, %i[pointer string string], :int

    # --- Vertex attributes ---
    # igraph_error_t igraph_cattribute_VAN(const igraph_t *graph, const char *name, igraph_int_t vid, igraph_real_t *value);
    attach_function :igraph_cattribute_VAN, %i[pointer string long_long pointer], :int

    # igraph_error_t igraph_cattribute_VAB(const igraph_t *graph, const char *name, igraph_int_t vid, igraph_bool_t *value);
    attach_function :igraph_cattribute_VAB, %i[pointer string long_long pointer], :int

    # igraph_error_t igraph_cattribute_VAS(const igraph_t *graph, const char *name, igraph_int_t vid, const char **value);
    attach_function :igraph_cattribute_VAS, %i[pointer string long_long pointer], :int

    # igraph_error_t igraph_cattribute_VAN_set(igraph_t *graph, const char *name, igraph_int_t vid, igraph_real_t value);
    attach_function :igraph_cattribute_VAN_set, %i[pointer string long_long double], :int

    # igraph_error_t igraph_cattribute_VAB_set(igraph_t *graph, const char *name, igraph_int_t vid, igraph_bool_t value);
    attach_function :igraph_cattribute_VAB_set, %i[pointer string long_long bool], :int

    # igraph_error_t igraph_cattribute_VAS_set(igraph_t *graph, const char *name, igraph_int_t vid, const char *value);
    attach_function :igraph_cattribute_VAS_set, %i[pointer string long_long string], :int

    # igraph_error_t igraph_cattribute_VAN_setv(igraph_t *graph, const char *name, const igraph_vector_t *v);
    attach_function :igraph_cattribute_VAN_setv, %i[pointer string pointer], :int

    # igraph_error_t igraph_cattribute_VAB_setv(igraph_t *graph, const char *name, const igraph_vector_bool_t *v);
    attach_function :igraph_cattribute_VAB_setv, %i[pointer string pointer], :int

    # igraph_error_t igraph_cattribute_VAS_setv(igraph_t *graph, const char *name, const igraph_strvector_t *sv);
    attach_function :igraph_cattribute_VAS_setv, %i[pointer string pointer], :int

    # --- Edge attributes ---
    # igraph_error_t igraph_cattribute_EAN(const igraph_t *graph, const char *name, igraph_int_t eid, igraph_real_t *value);
    attach_function :igraph_cattribute_EAN, %i[pointer string long_long pointer], :int

    # igraph_error_t igraph_cattribute_EAB(const igraph_t *graph, const char *name, igraph_int_t eid, igraph_bool_t *value);
    attach_function :igraph_cattribute_EAB, %i[pointer string long_long pointer], :int

    # igraph_error_t igraph_cattribute_EAS(const igraph_t *graph, const char *name, igraph_int_t eid, const char **value);
    attach_function :igraph_cattribute_EAS, %i[pointer string long_long pointer], :int

    # igraph_error_t igraph_cattribute_EAN_set(igraph_t *graph, const char *name, igraph_int_t eid, igraph_real_t value);
    attach_function :igraph_cattribute_EAN_set, %i[pointer string long_long double], :int

    # igraph_error_t igraph_cattribute_EAB_set(igraph_t *graph, const char *name, igraph_int_t eid, igraph_bool_t value);
    attach_function :igraph_cattribute_EAB_set, %i[pointer string long_long bool], :int

    # igraph_error_t igraph_cattribute_EAS_set(igraph_t *graph, const char *name, igraph_int_t eid, const char *value);
    attach_function :igraph_cattribute_EAS_set, %i[pointer string long_long string], :int

    # igraph_error_t igraph_cattribute_EAN_setv(igraph_t *graph, const char *name, const igraph_vector_t *v);
    attach_function :igraph_cattribute_EAN_setv, %i[pointer string pointer], :int

    # igraph_error_t igraph_cattribute_EAB_setv(igraph_t *graph, const char *name, const igraph_vector_bool_t *v);
    attach_function :igraph_cattribute_EAB_setv, %i[pointer string pointer], :int

    # igraph_error_t igraph_cattribute_EAS_setv(igraph_t *graph, const char *name, const igraph_strvector_t *sv);
    attach_function :igraph_cattribute_EAS_setv, %i[pointer string pointer], :int
  end
end
