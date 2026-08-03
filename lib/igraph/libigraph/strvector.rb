require "ffi"

module IGraph
  module LibIGraph
    # igraph_strvector_t structure (string vector - opaque pointer)
    # For FFI we treat it as an opaque :pointer

    # igraph_error_t igraph_strvector_init(igraph_strvector_t *sv, igraph_int_t len);
    attach_function :igraph_strvector_init, %i[pointer long_long], :int

    # void igraph_strvector_destroy(igraph_strvector_t *sv);
    attach_function :igraph_strvector_destroy, [:pointer], :void

    # igraph_error_t igraph_strvector_size(const igraph_strvector_t *sv);
    attach_function :igraph_strvector_size, [:pointer], :long_long

    # const char *igraph_strvector_get(const igraph_strvector_t *sv, igraph_int_t idx);
    attach_function :igraph_strvector_get, %i[pointer long_long], :string

    # igraph_error_t igraph_strvector_set(igraph_strvector_t *sv, igraph_int_t idx, const char *value);
    attach_function :igraph_strvector_set, %i[pointer long_long string], :int

    # igraph_error_t igraph_strvector_set_len(igraph_strvector_t *sv, igraph_int_t idx, const char *value, size_t len);
    attach_function :igraph_strvector_set_len, %i[pointer long_long string size_t], :int

    # void igraph_strvector_clear(igraph_strvector_t *sv);
    attach_function :igraph_strvector_clear, [:pointer], :void

    # void igraph_strvector_remove_section(igraph_strvector_t *v, igraph_int_t from, igraph_int_t to);
    attach_function :igraph_strvector_remove_section, %i[pointer long_long long_long], :void

    # void igraph_strvector_remove(igraph_strvector_t *v, igraph_int_t elem);
    attach_function :igraph_strvector_remove, %i[pointer long_long], :void

    # igraph_error_t igraph_strvector_init_copy(igraph_strvector_t *to, const igraph_strvector_t *from);
    attach_function :igraph_strvector_init_copy, %i[pointer pointer], :int

    # igraph_error_t igraph_strvector_append(igraph_strvector_t *to, const igraph_strvector_t *from);
    attach_function :igraph_strvector_append, %i[pointer pointer], :int

    # igraph_error_t igraph_strvector_merge(igraph_strvector_t *to, igraph_strvector_t *from);
    attach_function :igraph_strvector_merge, %i[pointer pointer], :int

    # void igraph_strvector_swap(igraph_strvector_t *v1, igraph_strvector_t *v2);
    attach_function :igraph_strvector_swap, %i[pointer pointer], :void

    # igraph_error_t igraph_strvector_update(igraph_strvector_t *to, const igraph_strvector_t *from);
    attach_function :igraph_strvector_update, %i[pointer pointer], :int

    # igraph_error_t igraph_strvector_resize(igraph_strvector_t* v, igraph_int_t newsize);
    attach_function :igraph_strvector_resize, %i[pointer long_long], :int

    # void igraph_strvector_resize_min(igraph_strvector_t *sv);
    attach_function :igraph_strvector_resize_min, [:pointer], :void

    # igraph_error_t igraph_strvector_push_back(igraph_strvector_t *v, const char *value);
    attach_function :igraph_strvector_push_back, %i[pointer string], :int

    # igraph_error_t igraph_strvector_push_back_len(igraph_strvector_t *v, const char *value, size_t len);
    attach_function :igraph_strvector_push_back_len, %i[pointer string size_t], :int

    # igraph_error_t igraph_strvector_fprint(const igraph_strvector_t *v, FILE *file, const char *sep);
    attach_function :igraph_strvector_fprint, %i[pointer pointer string], :int

    # igraph_error_t igraph_strvector_print(const igraph_strvector_t *v, const char *sep);
    attach_function :igraph_strvector_print, %i[pointer string], :int

    # igraph_error_t igraph_strvector_index(const igraph_strvector_t *v, igraph_strvector_t *newv, const igraph_vector_int_t *idx);
    attach_function :igraph_strvector_index, %i[pointer pointer pointer], :int

    # igraph_error_t igraph_strvector_reserve(igraph_strvector_t *sv, igraph_int_t capacity);
    attach_function :igraph_strvector_reserve, %i[pointer long_long], :int

    # void igraph_strvector_swap_elements(igraph_strvector_t *sv, igraph_int_t i, igraph_int_t j);
    attach_function :igraph_strvector_swap_elements, %i[pointer long_long long_long], :void
  end
end
