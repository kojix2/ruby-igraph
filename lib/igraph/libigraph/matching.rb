require "ffi"
require_relative "datatype"
require_relative "vector"

module IGraph
  module LibIGraph
    # igraph_error_t igraph_is_matching(const igraph_t* graph, const igraph_vector_bool_t* types, const igraph_vector_int_t* matching, igraph_bool_t* result);
    attach_function :igraph_is_matching, %i[pointer pointer pointer pointer], :int

    # igraph_error_t igraph_is_maximal_matching(const igraph_t* graph, const igraph_vector_bool_t* types, const igraph_vector_int_t* matching, igraph_bool_t* result);
    attach_function :igraph_is_maximal_matching, %i[pointer pointer pointer pointer], :int
  end
end
