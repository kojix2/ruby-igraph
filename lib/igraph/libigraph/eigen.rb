require "ffi"
require_relative "datatype"
require_relative "vector"
require_relative "matrix"

module IGraph
  module LibIGraph
    # igraph_error_t igraph_eigen_matrix_symmetric(const igraph_matrix_t *A, const igraph_sparsemat_t *sA, igraph_arpack_function_t *fun, int n, void *extra, igraph_eigen_algorithm_t algorithm, const igraph_eigen_which_t *which, igraph_arpack_options_t *options, igraph_arpack_storage_t *storage, igraph_vector_t *values, igraph_matrix_t *vectors);
    attach_function :igraph_eigen_matrix_symmetric, %i[pointer pointer pointer int pointer int pointer pointer pointer pointer pointer], :int

    # igraph_error_t igraph_eigen_matrix(const igraph_matrix_t *A, const igraph_sparsemat_t *sA, igraph_arpack_function_t *fun, int n, void *extra, igraph_eigen_algorithm_t algorithm, const igraph_eigen_which_t *which, igraph_arpack_options_t *options, igraph_arpack_storage_t *storage, igraph_vector_complex_t *values, igraph_matrix_complex_t *vectors);
    attach_function :igraph_eigen_matrix, %i[pointer pointer pointer int pointer int pointer pointer pointer pointer pointer], :int

    # igraph_error_t igraph_eigen_adjacency(const igraph_t *graph, igraph_eigen_algorithm_t algorithm, const igraph_eigen_which_t *which, igraph_arpack_options_t *options, igraph_arpack_storage_t *storage, igraph_vector_t *values, igraph_matrix_t *vectors, igraph_vector_complex_t *cmplxvalues, igraph_matrix_complex_t *cmplxvectors);
    attach_function :igraph_eigen_adjacency, %i[pointer int pointer pointer pointer pointer pointer pointer pointer], :int
  end
end
