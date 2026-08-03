require "ffi"
require_relative "datatype"
require_relative "vector"
require_relative "matrix"

module IGraph
  module LibIGraph
    # igraph_error_t igraph_lapack_dgetrf(igraph_matrix_t *a, igraph_vector_int_t *ipiv, int *info);
    attach_function :igraph_lapack_dgetrf, %i[pointer pointer pointer], :int

    # igraph_error_t igraph_lapack_dgetrs(igraph_bool_t transpose, const igraph_matrix_t *a, const igraph_vector_int_t *ipiv, igraph_matrix_t *b);
    attach_function :igraph_lapack_dgetrs, %i[bool pointer pointer pointer], :int

    # igraph_error_t igraph_lapack_dgesv(igraph_matrix_t *a, igraph_vector_int_t *ipiv, igraph_matrix_t *b, int *info);
    attach_function :igraph_lapack_dgesv, %i[pointer pointer pointer pointer], :int

    # igraph_error_t igraph_lapack_dsyevr(const igraph_matrix_t *A, igraph_lapack_dsyev_which_t which, igraph_real_t vl, igraph_real_t vu, int vestimate, int il, int iu, igraph_real_t abstol, igraph_vector_t *values, igraph_matrix_t *vectors, igraph_vector_int_t *support);
    attach_function :igraph_lapack_dsyevr, %i[pointer int double double int int int double pointer pointer pointer], :int

    # igraph_error_t igraph_lapack_dgeev(const igraph_matrix_t *A, igraph_vector_t *valuesreal, igraph_vector_t *valuesimag, igraph_matrix_t *vectorsleft, igraph_matrix_t *vectorsright, int *info);
    attach_function :igraph_lapack_dgeev, %i[pointer pointer pointer pointer pointer pointer], :int

    # igraph_error_t igraph_lapack_dgeevx(igraph_lapack_dgeevx_balance_t balance, const igraph_matrix_t *A, igraph_vector_t *valuesreal, igraph_vector_t *valuesimag, igraph_matrix_t *vectorsleft, igraph_matrix_t *vectorsright, int *ilo, int *ihi, igraph_vector_t *scale, igraph_real_t *abnrm, igraph_vector_t *rconde, igraph_vector_t *rcondv, int *info);
    attach_function :igraph_lapack_dgeevx, %i[int pointer pointer pointer pointer pointer pointer pointer pointer pointer pointer pointer pointer], :int

    # igraph_error_t igraph_lapack_dgehrd(const igraph_matrix_t *A, int ilo, int ihi, igraph_matrix_t *result);
    attach_function :igraph_lapack_dgehrd, %i[pointer int int pointer], :int
  end
end