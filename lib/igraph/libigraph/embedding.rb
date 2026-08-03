require "ffi"
require_relative "datatype"
require_relative "vector"
require_relative "matrix"

module IGraph
  module LibIGraph
    # igraph_error_t igraph_adjacency_spectral_embedding(const igraph_t *graph, igraph_int_t no, const igraph_vector_t *weights, igraph_eigen_which_position_t which, igraph_bool_t scaled, igraph_matrix_t *X, igraph_matrix_t *Y, igraph_vector_t *D, const igraph_vector_t *cvec, igraph_arpack_options_t *options);
    attach_function :igraph_adjacency_spectral_embedding, %i[pointer long_long pointer int bool pointer pointer pointer pointer pointer], :int

    # igraph_error_t igraph_laplacian_spectral_embedding(const igraph_t *graph, igraph_int_t no, const igraph_vector_t *weights, igraph_eigen_which_position_t which, igraph_laplacian_spectral_embedding_type_t type, igraph_bool_t scaled, igraph_matrix_t *X, igraph_matrix_t *Y, igraph_vector_t *D, igraph_arpack_options_t *options);
    attach_function :igraph_laplacian_spectral_embedding, %i[pointer long_long pointer int int bool pointer pointer pointer pointer], :int

    # igraph_error_t igraph_dim_select(const igraph_vector_t *sv, igraph_int_t *dim);
    attach_function :igraph_dim_select, %i[pointer pointer], :int
  end
end
