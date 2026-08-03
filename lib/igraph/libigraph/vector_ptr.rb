require "ffi"

module IGraph
  module LibIGraph
    # igraph_vector_ptr_t functions (vector of void pointers)
    # igraph_error_t igraph_vector_ptr_init(igraph_vector_ptr_t* v, igraph_int_t size);
    attach_function :igraph_vector_ptr_init, %i[pointer long_long], :int

    # igraph_error_t igraph_vector_ptr_init_array(igraph_vector_ptr_t* v, void *const *data, igraph_int_t length);
    attach_function :igraph_vector_ptr_init_array, %i[pointer pointer long_long], :int

    # igraph_error_t igraph_vector_ptr_init_copy(igraph_vector_ptr_t *to, const igraph_vector_ptr_t *from);
    attach_function :igraph_vector_ptr_init_copy, %i[pointer pointer], :int

    # void igraph_vector_ptr_destroy(igraph_vector_ptr_t* v);
    attach_function :igraph_vector_ptr_destroy, [:pointer], :void

    # void igraph_vector_ptr_free_all(igraph_vector_ptr_t* v);
    attach_function :igraph_vector_ptr_free_all, [:pointer], :void

    # void igraph_vector_ptr_destroy_all(igraph_vector_ptr_t* v);
    attach_function :igraph_vector_ptr_destroy_all, [:pointer], :void

    # igraph_error_t igraph_vector_ptr_reserve(igraph_vector_ptr_t* v, igraph_int_t capacity);
    attach_function :igraph_vector_ptr_reserve, %i[pointer long_long], :int

    # void igraph_vector_ptr_resize_min(igraph_vector_ptr_t* v);
    attach_function :igraph_vector_ptr_resize_min, [:pointer], :void

    # igraph_bool_t igraph_vector_ptr_empty(const igraph_vector_ptr_t* v);
    attach_function :igraph_vector_ptr_empty, [:pointer], :bool

    # igraph_int_t igraph_vector_ptr_size(const igraph_vector_ptr_t* v);
    attach_function :igraph_vector_ptr_size, [:pointer], :long_long

    # void igraph_vector_ptr_clear(igraph_vector_ptr_t* v);
    attach_function :igraph_vector_ptr_clear, [:pointer], :void

    # void igraph_vector_ptr_null(igraph_vector_ptr_t* v);
    attach_function :igraph_vector_ptr_null, [:pointer], :void

    # igraph_error_t igraph_vector_ptr_push_back(igraph_vector_ptr_t* v, void* e);
    attach_function :igraph_vector_ptr_push_back, %i[pointer pointer], :int

    # igraph_error_t igraph_vector_ptr_append(igraph_vector_ptr_t *to, const igraph_vector_ptr_t *from);
    attach_function :igraph_vector_ptr_append, %i[pointer pointer], :int

    # void *igraph_vector_ptr_pop_back(igraph_vector_ptr_t *v);
    attach_function :igraph_vector_ptr_pop_back, [:pointer], :pointer

    # igraph_error_t igraph_vector_ptr_insert(igraph_vector_ptr_t *v, igraph_int_t pos, void* e);
    attach_function :igraph_vector_ptr_insert, %i[pointer long_long pointer], :int

    # void *igraph_vector_ptr_get(const igraph_vector_ptr_t* v, igraph_int_t pos);
    attach_function :igraph_vector_ptr_get, %i[pointer long_long], :pointer

    # void igraph_vector_ptr_set(igraph_vector_ptr_t* v, igraph_int_t pos, void* value);
    attach_function :igraph_vector_ptr_set, %i[pointer long_long pointer], :void

    # igraph_error_t igraph_vector_ptr_resize(igraph_vector_ptr_t* v, igraph_int_t newsize);
    attach_function :igraph_vector_ptr_resize, %i[pointer long_long], :int

    # void igraph_vector_ptr_copy_to(const igraph_vector_ptr_t *v, void** to);
    attach_function :igraph_vector_ptr_copy_to, %i[pointer pointer], :void

    # igraph_error_t igraph_vector_ptr_permute(igraph_vector_ptr_t* v, const igraph_vector_int_t* index);
    attach_function :igraph_vector_ptr_permute, %i[pointer pointer], :int

    # void igraph_vector_ptr_remove(igraph_vector_ptr_t *v, igraph_int_t pos);
    attach_function :igraph_vector_ptr_remove, %i[pointer long_long], :void

    # void igraph_vector_ptr_sort(igraph_vector_ptr_t *v, int(*compar)(const void*, const void*));
    attach_function :igraph_vector_ptr_sort, %i[pointer pointer], :void

    # igraph_error_t igraph_vector_ptr_sort_ind(igraph_vector_ptr_t *v, igraph_vector_int_t *ind, int(*compar)(const void*, const void*));
    attach_function :igraph_vector_ptr_sort_ind, %i[pointer pointer pointer], :int
  end
end
