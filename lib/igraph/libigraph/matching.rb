require "ffi"
require_relative "datatype"
require_relative "vector"

module IGraph
  module LibIGraph
    # igraph_error_t igraph_is_matching(const igraph_t* graph, const igraph_vector_bool_t* types, const igraph_vector_int_t* matching, igraph_bool_t* result);
    attach_function :igraph_is_matching, %i[pointer pointer pointer pointer], :int

    # igraph_error_t igraph_is_maximal_matching(const igraph_t* graph, const igraph_vector_bool_t* types, const igraph_vector_int_t* matching, igraph_bool_t* result);
    attach_function :igraph_is_maximal_matching, %i[pointer pointer pointer pointer], :int

    # igraph_error_t igraph_maximum_bipartite_matching(const igraph_t* graph, const igraph_vector_bool_t* types, igraph_int_t* matching_size, igraph_real_t* matching_weight, igraph_vector_int_t* matching, const igraph_vector_t* weights, igraph_real_t eps);
    attach_function :igraph_maximum_bipartite_matching, %i[pointer pointer pointer pointer pointer pointer double], :int
  end
end
