require "ffi"
require_relative "datatype"
require_relative "vector"

module IGraph
  module LibIGraph
    # igraph_error_t igraph_solve_lsap(const igraph_matrix_t *c, igraph_int_t n, igraph_vector_int_t *p);
    attach_function :igraph_solve_lsap, %i[pointer long_long pointer], :int
  end
end
