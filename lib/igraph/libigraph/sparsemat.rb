require "ffi"
require_relative "datatype"
require_relative "vector"
require_relative "matrix"

module IGraph
  module LibIGraph
    # igraph_error_t igraph_sparsemat_t structure
    # (opaque pointer - FFI handles as :pointer)

    # igraph_error_t igraph_sparsemat_init(igraph_sparsemat_t *A, igraph_int_t nrow, igraph_int_t ncol, igraph_int_t nzmax, igraph_bool_t is_triplet);
    attach_function :igraph_sparsemat_init, %i[pointer long_long long_long long_long bool], :int

    # void igraph_sparsemat_destroy(igraph_sparsemat_t *A);
    attach_function :igraph_sparsemat_destroy, [:pointer], :void

    # igraph_error_t igraph_sparsemat_copy(igraph_sparsemat_t *to, const igraph_sparsemat_t *from);
    attach_function :igraph_sparsemat_copy, %i[pointer pointer], :int

    # igraph_error_t igraph_sparsemat_compress(const igraph_sparsemat_t *A, igraph_sparsemat_t *res);
    attach_function :igraph_sparsemat_compress, %i[pointer pointer], :int

    # igraph_error_t igraph_sparsemat_entry(igraph_sparsemat_t *A, igraph_int_t row, igraph_int_t col, igraph_real_t elem);
    attach_function :igraph_sparsemat_entry, %i[pointer long_long long_long double], :int

    # igraph_error_t igraph_sparsemat_add_entry(igraph_sparsemat_t *A, igraph_int_t row, igraph_int_t col, igraph_real_t elem);
    attach_function :igraph_sparsemat_add_entry, %i[pointer long_long long_long double], :int

    # igraph_error_t igraph_sparsemat_eye(igraph_sparsemat_t *A, igraph_int_t n, igraph_int_t nzmax, igraph_real_t value, igraph_bool_t compress);
    attach_function :igraph_sparsemat_eye, %i[pointer long_long long_long double bool], :int

    # igraph_error_t igraph_sparsemat_diag(igraph_sparsemat_t *A, igraph_int_t nzmax, const igraph_vector_t *values, igraph_int_t ndiag, igraph_bool_t compress);
    attach_function :igraph_sparsemat_diag, %i[pointer long_long pointer long_long bool], :int

    # igraph_error_t igraph_sparsemat_nzmax(const igraph_sparsemat_t *A, igraph_int_t *nzmax);
    attach_function :igraph_sparsemat_nzmax, %i[pointer pointer], :int

    # igraph_error_t igraph_sparsemat_nrow(const igraph_sparsemat_t *A, igraph_int_t *nrow);
    attach_function :igraph_sparsemat_nrow, %i[pointer pointer], :int

    # igraph_error_t igraph_sparsemat_ncol(const igraph_sparsemat_t *A, igraph_int_t *ncol);
    attach_function :igraph_sparsemat_ncol, %i[pointer pointer], :int

    # igraph_error_t igraph_sparsemat_count_nonzero(const igraph_sparsemat_t *A, igraph_int_t *nz);
    attach_function :igraph_sparsemat_count_nonzero, %i[pointer pointer], :int

    # igraph_error_t igraph_sparsemat_type(const igraph_sparsemat_t *A, igraph_sparsemat_type_t *type);
    attach_function :igraph_sparsemat_type, %i[pointer pointer], :int

    # igraph_error_t igraph_sparsemat_dupl(igraph_sparsemat_t *A);
    attach_function :igraph_sparsemat_dupl, [:pointer], :int

    # igraph_error_t igraph_sparsemat_fkeep(igraph_sparsemat_t *A, igraph_integer_t (*fkeep)(igraph_integer_t, igraph_integer_t, igraph_real_t, void*), void *other);
    attach_function :igraph_sparsemat_fkeep, %i[pointer pointer pointer], :int

    # igraph_error_t igraph_sparsemat_dropzeros(igraph_sparsemat_t *A);
    attach_function :igraph_sparsemat_dropzeros, [:pointer], :int

    # igraph_error_t igraph_sparsemat_droptol(igraph_sparsemat_t *A, igraph_real_t tol);
    attach_function :igraph_sparsemat_droptol, %i[pointer double], :int

    # igraph_error_t igraph_sparsemat_transpose(const igraph_sparsemat_t *A, igraph_sparsemat_t *res, igraph_bool_t values);
    attach_function :igraph_sparsemat_transpose, %i[pointer pointer bool], :int

    # igraph_error_t igraph_sparsemat_add(const igraph_sparsemat_t *A, const igraph_sparsemat_t *B, igraph_real_t alpha, igraph_real_t beta, igraph_sparsemat_t *res);
    attach_function :igraph_sparsemat_add, %i[pointer pointer double double pointer], :int

    # igraph_error_t igraph_sparsemat_multiply(const igraph_sparsemat_t *A, const igraph_sparsemat_t *B, igraph_sparsemat_t *res);
    attach_function :igraph_sparsemat_multiply, %i[pointer pointer pointer], :int

    # igraph_error_t igraph_sparsemat_multiply_by_dense(const igraph_sparsemat_t *A, const igraph_matrix_t *B, igraph_matrix_t *res);
    attach_function :igraph_sparsemat_multiply_by_dense, %i[pointer pointer pointer], :int

    # igraph_error_t igraph_sparsemat_dense_multiply(const igraph_matrix_t *A, const igraph_sparsemat_t *B, igraph_matrix_t *res);
    attach_function :igraph_sparsemat_dense_multiply, %i[pointer pointer pointer], :int

    # igraph_error_t igraph_sparsemat_dense_multiply_vector(const igraph_sparsemat_t *A, const igraph_vector_t *v, igraph_vector_t *res);
    attach_function :igraph_sparsemat_dense_multiply_vector, %i[pointer pointer pointer], :int

    # igraph_error_t igraph_sparsemat_dense_transpose_multiply_vector(const igraph_sparsemat_t *A, const igraph_vector_t *v, igraph_vector_t *res);
    attach_function :igraph_sparsemat_dense_transpose_multiply_vector, %i[pointer pointer pointer], :int

    # igraph_error_t igraph_sparsemat_norm(const igraph_sparsemat_t *A, igraph_real_t *res);
    attach_function :igraph_sparsemat_norm, %i[pointer pointer], :int

    # igraph_error_t igraph_sparsemat_max(const igraph_sparsemat_t *A, igraph_real_t *res);
    attach_function :igraph_sparsemat_max, %i[pointer pointer], :int

    # igraph_error_t igraph_sparsemat_min(const igraph_sparsemat_t *A, igraph_real_t *res);
    attach_function :igraph_sparsemat_min, %i[pointer pointer], :int

    # igraph_error_t igraph_sparsemat_scale(igraph_sparsemat_t *A, igraph_real_t by);
    attach_function :igraph_sparsemat_scale, %i[pointer double], :int

    # igraph_error_t igraph_sparsemat_colsums(const igraph_sparsemat_t *A, igraph_vector_t *res);
    attach_function :igraph_sparsemat_colsums, %i[pointer pointer], :int

    # igraph_error_t igraph_sparsemat_rowsums(const igraph_sparsemat_t *A, igraph_vector_t *res);
    attach_function :igraph_sparsemat_rowsums, %i[pointer pointer], :int

    # igraph_error_t igraph_sparsemat_is_triplet(const igraph_sparsemat_t *A, igraph_bool_t *res);
    attach_function :igraph_sparsemat_is_triplet, %i[pointer pointer], :int

    # igraph_error_t igraph_sparsemat_is_cc(const igraph_sparsemat_t *A, igraph_bool_t *res);
    attach_function :igraph_sparsemat_is_cc, %i[pointer pointer], :int

    # igraph_error_t igraph_sparsemat_permute(const igraph_sparsemat_t *A, const igraph_vector_int_t *p, const igraph_vector_int_t *q, igraph_sparsemat_t *res);
    attach_function :igraph_sparsemat_permute, %i[pointer pointer pointer pointer], :int

    # igraph_error_t igraph_sparsemat_index(const igraph_sparsemat_t *A, const igraph_vector_int_t *p, const igraph_vector_int_t *q, igraph_sparsemat_t *res);
    attach_function :igraph_sparsemat_index, %i[pointer pointer pointer pointer], :int

    # igraph_error_t igraph_sparsemat_iterinit(const igraph_sparsemat_t *A);
    attach_function :igraph_sparsemat_iterinit, [:pointer], :int

    # igraph_error_t igraph_sparsemat_iter(const igraph_sparsemat_t *A, igraph_int_t *row, igraph_int_t *col, igraph_real_t *elem);
    attach_function :igraph_sparsemat_iter, %i[pointer pointer pointer pointer], :int

    # igraph_error_t igraph_sparsemat_iterreset(const igraph_sparsemat_t *A);
    attach_function :igraph_sparsemat_iterreset, [:pointer], :int

    # igraph_error_t igraph_sparsemat_getelements(const igraph_sparsemat_t *A, igraph_vector_int_t *i, igraph_vector_int_t *j, igraph_vector_t *x);
    attach_function :igraph_sparsemat_getelements, %i[pointer pointer pointer pointer], :int

    # igraph_error_t igraph_sparsemat_getelements_sorted(const igraph_sparsemat_t *A, igraph_vector_int_t *i, igraph_vector_int_t *j, igraph_vector_t *x);
    attach_function :igraph_sparsemat_getelements_sorted, %i[pointer pointer pointer pointer], :int

    # igraph_error_t igraph_sparsemat_scale_rows(igraph_sparsemat_t *A, const igraph_vector_t *fact);
    attach_function :igraph_sparsemat_scale_rows, %i[pointer pointer], :int

    # igraph_error_t igraph_sparsemat_scale_cols(igraph_sparsemat_t *A, const igraph_vector_t *fact);
    attach_function :igraph_sparsemat_scale_cols, %i[pointer pointer], :int

    # igraph_error_t igraph_sparsemat_symblu(igraph_real_t n, igraph_sparsemat_t *A);
    attach_function :igraph_sparsemat_symblu, %i[double pointer], :int

    # igraph_error_t igraph_sparsemat_lusol(const igraph_sparsemat_t *A, const igraph_vector_t *b, igraph_vector_t *res, igraph_int_t order, igraph_real_t tol);
    attach_function :igraph_sparsemat_lusol, %i[pointer pointer pointer long_long double], :int

    # igraph_error_t igraph_sparsemat_cholsol(const igraph_sparsemat_t *A, const igraph_vector_t *b, igraph_vector_t *res, igraph_int_t order);
    attach_function :igraph_sparsemat_cholsol, %i[pointer pointer pointer long_long], :int

    # igraph_error_t igraph_sparsemat_lusol_sp(const igraph_sparsemat_t *A, const igraph_sparsemat_t *B, igraph_sparsemat_t *res, igraph_int_t order, igraph_real_t tol);
    attach_function :igraph_sparsemat_lusol_sp, %i[pointer pointer pointer long_long double], :int

    # igraph_error_t igraph_sparsemat_cholsol_sp(const igraph_sparsemat_t *A, const igraph_sparsemat_t *B, igraph_sparsemat_t *res, igraph_int_t order);
    attach_function :igraph_sparsemat_cholsol_sp, %i[pointer pointer pointer long_long], :int

    # igraph_error_t igraph_get_stochastic(const igraph_t *graph, igraph_sparsemat_t *sparsemat, igraph_get_stochastic_t column_wise);
    attach_function :igraph_get_stochastic, %i[pointer pointer int], :int

    # igraph_error_t igraph_get_stochastic_sparsemat(const igraph_sparsemat_t *graph, igraph_sparsemat_t *sparsemat, igraph_get_stochastic_t column_wise);
    attach_function :igraph_get_stochastic_sparsemat, %i[pointer pointer int], :int

    # igraph_error_t igraph_sparsemat_stochastic_mergesort(igraph_sparsemat_t *A);
    attach_function :igraph_sparsemat_stochastic_mergesort, [:pointer], :int
  end
end
