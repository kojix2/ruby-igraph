require "ffi"
require_relative "datatype"
require_relative "vector"

module IGraph
  module LibIGraph
    # igraph_error_t igraph_create(igraph_t *graph, const igraph_vector_int_t *edges, igraph_integer_t n, igraph_bool_t directed);
    attach_function :igraph_create, %i[pointer pointer long_long bool], :int
  end
end
