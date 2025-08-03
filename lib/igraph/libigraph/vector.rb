require "ffi"

module IGraph
  module LibIGraph
    # igraph_vector_t structure (double vector)
    class VectorStruct < FFI::Struct
      layout(
        :stor_begin, :pointer, # double*
        :stor_end,   :pointer, # double*
        :end,        :pointer  # double*
      )
    end

    # igraph_vector_int_t structure (int vector)
    class VectorIntStruct < FFI::Struct
      layout(
        :stor_begin, :pointer, # int*
        :stor_end,   :pointer, # int*
        :end,        :pointer  # int*
      )
    end

    # igraph_vector_bool_t structure (bool vector)
    class VectorBoolStruct < FFI::Struct
      layout(
        :stor_begin, :pointer, # bool*
        :stor_end,   :pointer, # bool*
        :end,        :pointer  # bool*
      )
    end

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

    # igraph_vector_t (double vector) functions
    # igraph_error_t igraph_vector_init(igraph_vector_t *v, igraph_integer_t size);
    attach_function :igraph_vector_init, %i[pointer long_long], :int

    # void igraph_vector_destroy(igraph_vector_t *v);
    attach_function :igraph_vector_destroy, [:pointer], :void

    # igraph_integer_t igraph_vector_size(const igraph_vector_t *v);
    attach_function :igraph_vector_size, [:pointer], :long_long

    # double igraph_vector_get(const igraph_vector_t *v, igraph_integer_t pos);
    attach_function :igraph_vector_get, %i[pointer long_long], :double

    # void igraph_vector_set(igraph_vector_t *v, igraph_integer_t pos, double value);
    attach_function :igraph_vector_set, %i[pointer long_long double], :void

    # igraph_vector_bool_t functions
    # igraph_error_t igraph_vector_bool_init(igraph_vector_bool_t *v, igraph_integer_t size);
    attach_function :igraph_vector_bool_init, %i[pointer long_long], :int

    # void igraph_vector_bool_destroy(igraph_vector_bool_t *v);
    attach_function :igraph_vector_bool_destroy, [:pointer], :void

    # igraph_integer_t igraph_vector_bool_size(const igraph_vector_bool_t *v);
    attach_function :igraph_vector_bool_size, [:pointer], :long_long

    # bool igraph_vector_bool_get(const igraph_vector_bool_t *v, igraph_integer_t pos);
    attach_function :igraph_vector_bool_get, %i[pointer long_long], :bool

    # void igraph_vector_bool_set(igraph_vector_bool_t *v, igraph_integer_t pos, bool value);
    attach_function :igraph_vector_bool_set, %i[pointer long_long bool], :void
  end
end
