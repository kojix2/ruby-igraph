require "ffi"
require_relative "vector"

module IGraph
  module LibIGraph
    # igraph_matrix_t structure (embedded, not pointer)
    class MatrixStruct < FFI::Struct
      layout(
        :data, VectorStruct,   # igraph_vector (embedded)
        :nrow, :long_long,     # igraph_integer_t
        :ncol, :long_long      # igraph_integer_t
      )
    end

    # For standalone matrix operations
    class Matrix < FFI::Struct
      layout(
        :data, VectorStruct,   # igraph_vector (embedded)
        :nrow, :long_long,     # igraph_integer_t
        :ncol, :long_long      # igraph_integer_t
      )
    end

    # igraph_error_t igraph_matrix_init(igraph_matrix_t *m, igraph_integer_t nrow, igraph_integer_t ncol);
    attach_function :igraph_matrix_init, %i[pointer long_long long_long], :int

    # void igraph_matrix_destroy(igraph_matrix_t *m);
    attach_function :igraph_matrix_destroy, [:pointer], :void

    # igraph_integer_t igraph_matrix_nrow(const igraph_matrix_t *m);
    attach_function :igraph_matrix_nrow, [:pointer], :long_long

    # igraph_integer_t igraph_matrix_ncol(const igraph_matrix_t *m);
    attach_function :igraph_matrix_ncol, [:pointer], :long_long

    # double igraph_matrix_get(const igraph_matrix_t *m, igraph_integer_t row, igraph_integer_t col);
    attach_function :igraph_matrix_get, %i[pointer long_long long_long], :double

    # void igraph_matrix_set(igraph_matrix_t *m, igraph_integer_t row, igraph_integer_t col, double value);
    attach_function :igraph_matrix_set, %i[pointer long_long long_long double], :void

    # void igraph_matrix_null(igraph_matrix_t *m);
    attach_function :igraph_matrix_null, [:pointer], :void

    # void igraph_matrix_fill(igraph_matrix_t *m, double e);
    attach_function :igraph_matrix_fill, %i[pointer double], :void
  end
end
