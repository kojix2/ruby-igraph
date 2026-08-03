require "ffi"
require_relative "datatype"
require_relative "vector"
require_relative "matrix"

module IGraph
  module LibIGraph
    # igraph_error_t igraph_blas_dgemv(igraph_bool_t transpose, igraph_real_t alpha, const igraph_matrix_t* a, const igraph_vector_t* x, igraph_real_t beta, igraph_vector_t* y);
    attach_function :igraph_blas_dgemv, %i[bool double pointer pointer double pointer], :int

    # igraph_error_t igraph_blas_dgemm(igraph_bool_t transpose_a, igraph_bool_t transpose_b, igraph_real_t alpha, const igraph_matrix_t* a, const igraph_matrix_t* b, igraph_real_t beta, igraph_matrix_t* c);
    attach_function :igraph_blas_dgemm, %i[bool bool double pointer pointer double pointer], :int

    # igraph_error_t igraph_blas_dgemv_array(igraph_bool_t transpose, igraph_real_t alpha, const igraph_matrix_t* a, const igraph_real_t* x, igraph_real_t beta, igraph_real_t* y);
    attach_function :igraph_blas_dgemv_array, %i[bool double pointer pointer double pointer], :int

    # igraph_real_t igraph_blas_dnrm2(const igraph_vector_t *v);
    attach_function :igraph_blas_dnrm2, [:pointer], :double

    # igraph_error_t igraph_blas_ddot(const igraph_vector_t *v1, const igraph_vector_t *v2, igraph_real_t *res);
    attach_function :igraph_blas_ddot, %i[pointer pointer pointer], :int
  end
end