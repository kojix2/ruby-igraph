require "ffi"

module IGraph
  module LibIGraph
    # igraph_bitset_t functions (treated as opaque :pointer)
    # igraph_error_t igraph_bitset_init(igraph_bitset_t *bitset, igraph_int_t size);
    attach_function :igraph_bitset_init, %i[pointer long_long], :int

    # void igraph_bitset_destroy(igraph_bitset_t *bitset);
    attach_function :igraph_bitset_destroy, [:pointer], :void

    # igraph_error_t igraph_bitset_init_copy(igraph_bitset_t *dest, const igraph_bitset_t *src);
    attach_function :igraph_bitset_init_copy, %i[pointer pointer], :int

    # igraph_error_t igraph_bitset_update(igraph_bitset_t *dest, const igraph_bitset_t *src);
    attach_function :igraph_bitset_update, %i[pointer pointer], :int

    # igraph_error_t igraph_bitset_reserve(igraph_bitset_t *bitset, igraph_int_t capacity);
    attach_function :igraph_bitset_reserve, %i[pointer long_long], :int

    # igraph_error_t igraph_bitset_resize(igraph_bitset_t *bitset, igraph_int_t new_size);
    attach_function :igraph_bitset_resize, %i[pointer long_long], :int

    # void igraph_bitset_or(igraph_bitset_t *dest, const igraph_bitset_t *src1, const igraph_bitset_t *src2);
    attach_function :igraph_bitset_or, %i[pointer pointer pointer], :void

    # void igraph_bitset_and(igraph_bitset_t *dest, const igraph_bitset_t *src1, const igraph_bitset_t *src2);
    attach_function :igraph_bitset_and, %i[pointer pointer pointer], :void

    # void igraph_bitset_xor(igraph_bitset_t *dest, const igraph_bitset_t *src1, const igraph_bitset_t *src2);
    attach_function :igraph_bitset_xor, %i[pointer pointer pointer], :void

    # void igraph_bitset_not(igraph_bitset_t *dest, const igraph_bitset_t *src);
    attach_function :igraph_bitset_not, %i[pointer pointer], :void

    # void igraph_bitset_fill(igraph_bitset_t *bitset, igraph_bool_t value);
    attach_function :igraph_bitset_fill, %i[pointer bool], :void

    # void igraph_bitset_null(igraph_bitset_t *bitset);
    attach_function :igraph_bitset_null, [:pointer], :void

    # igraph_bool_t igraph_bitset_count(const igraph_bitset_t *bitset, igraph_int_t *count);
    attach_function :igraph_bitset_count, %i[pointer pointer], :bool

    # igraph_bool_t igraph_bitset_get(const igraph_bitset_t *bitset, igraph_int_t pos);
    attach_function :igraph_bitset_get, %i[pointer long_long], :bool

    # igraph_error_t igraph_bitset_set(igraph_bitset_t *bitset, igraph_int_t pos, igraph_bool_t value);
    attach_function :igraph_bitset_set, %i[pointer long_long bool], :int

    # igraph_error_t igraph_bitset_fprint(const igraph_bitset_t *bitset, FILE *file);
    attach_function :igraph_bitset_fprint, %i[pointer pointer], :int

    # igraph_error_t igraph_bitset_print(const igraph_bitset_t *bitset);
    attach_function :igraph_bitset_print, [:pointer], :int

    # igraph_int_t igraph_bitset_size(const igraph_bitset_t *bitset);
    attach_function :igraph_bitset_size, [:pointer], :long_long

    # igraph_bool_t igraph_bitset_is_empty(const igraph_bitset_t *bitset);
    attach_function :igraph_bitset_is_empty, [:pointer], :bool

    # igraph_error_t igraph_bitset_clear(igraph_bitset_t *bitset);
    attach_function :igraph_bitset_clear, [:pointer], :int

    # void igraph_bitset_swap(igraph_bitset_t *v1, igraph_bitset_t *v2);
    attach_function :igraph_bitset_swap, %i[pointer pointer], :void

    # void igraph_bitset_remove(igraph_bitset_t *bitset, igraph_int_t pos);
    attach_function :igraph_bitset_remove, %i[pointer long_long], :void

    # void igraph_bitset_remove_section(igraph_bitset_t *bitset, igraph_int_t from, igraph_int_t to);
    attach_function :igraph_bitset_remove_section, %i[pointer long_long long_long], :void

    # igraph_int_t igraph_bitset_capacity(const igraph_bitset_t *bitset);
    attach_function :igraph_bitset_capacity, [:pointer], :long_long
  end
end
