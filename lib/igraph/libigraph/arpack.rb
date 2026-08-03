require "ffi"
require_relative "datatype"
require_relative "vector"
require_relative "matrix"

module IGraph
  module LibIGraph
    # void igraph_arpack_options_init(igraph_arpack_options_t *o);
    attach_function :igraph_arpack_options_init, [:pointer], :void

    # igraph_error_t igraph_arpack_storage_init(igraph_arpack_storage_t *s, igraph_int_t maxn, igraph_int_t maxncv, igraph_int_t maxldv, igraph_bool_t symm);
    attach_function :igraph_arpack_storage_init, %i[pointer long_long long_long long_long bool], :int

    # void igraph_arpack_storage_destroy(igraph_arpack_storage_t *s);
    attach_function :igraph_arpack_storage_destroy, [:pointer], :void

    # igraph_error_t igraph_arpack_rssolve(igraph_arpack_function_t *fun, void *extra, igraph_arpack_options_t *options, igraph_arpack_storage_t *storage, igraph_vector_t *values, igraph_matrix_t *vectors);
    attach_function :igraph_arpack_rssolve, %i[pointer pointer pointer pointer pointer pointer], :int

    # igraph_error_t igraph_arpack_rnsolve(igraph_arpack_function_t *fun, void *extra, igraph_arpack_options_t *options, igraph_arpack_storage_t *storage, igraph_matrix_t *values, igraph_matrix_t *vectors);
    attach_function :igraph_arpack_rnsolve, %i[pointer pointer pointer pointer pointer pointer], :int

    # igraph_error_t igraph_arpack_unpack_complex(igraph_matrix_t *vectors, igraph_matrix_t *values, igraph_int_t nev);
    attach_function :igraph_arpack_unpack_complex, %i[pointer pointer long_long], :int
  end
end