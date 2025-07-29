require "ffi"

module IGraph
  module LibIGraph
    class VectorInt < FFI::Struct
      layout(
        :stor_begin, :pointer, # int*
        :stor_end,   :pointer, # int*
        :end,        :pointer  # int*
      )
    end

    # igraph_error_t igraph_vector_int_init(igraph_vector_int_t *v, igraph_integer_t size);
    attach_function :igraph_vector_int_init, %i[pointer long_long], :int

    # void igraph_vector_int_destroy(igraph_vector_int_t *v);
    attach_function :igraph_vector_int_destroy, [:pointer], :void

    # igraph_integer_t igraph_vector_int_size(const igraph_vector_int_t *v);
    attach_function :igraph_vector_int_size, [:pointer], :long_long

    # int igraph_vector_int_get(const igraph_vector_int_t *v, igraph_integer_t pos);
    attach_function :igraph_vector_int_get, %i[pointer long_long], :int

    # void igraph_vector_int_set(igraph_vector_int_t *v, igraph_integer_t pos, int value);
    attach_function :igraph_vector_int_set, %i[pointer long_long int], :void
  end
end
