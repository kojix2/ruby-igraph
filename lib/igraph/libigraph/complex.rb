require "ffi"
require_relative "datatype"
require_relative "vector"
require_relative "matrix"

module IGraph
  module LibIGraph
    # igraph_error_t igraph_vector_complex_real(const igraph_vector_complex_t *v, igraph_vector_t *real);
    attach_function :igraph_vector_complex_real, %i[pointer pointer], :int

    # igraph_error_t igraph_vector_complex_imag(const igraph_vector_complex_t *v, igraph_vector_t *imag);
    attach_function :igraph_vector_complex_imag, %i[pointer pointer], :int

    # igraph_error_t igraph_vector_complex_realimag(const igraph_vector_complex_t *v, igraph_vector_t *real, igraph_vector_t *imag);
    attach_function :igraph_vector_complex_realimag, %i[pointer pointer pointer], :int

    # igraph_error_t igraph_vector_complex_create(igraph_vector_complex_t *v, const igraph_vector_t *real, const igraph_vector_t *imag);
    attach_function :igraph_vector_complex_create, %i[pointer pointer pointer], :int

    # igraph_error_t igraph_vector_complex_create_polar(igraph_vector_complex_t *v, const igraph_vector_t *r, const igraph_vector_t *theta);
    attach_function :igraph_vector_complex_create_polar, %i[pointer pointer pointer], :int
  end
end