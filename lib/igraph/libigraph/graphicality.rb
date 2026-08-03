require "ffi"
require_relative "datatype"
require_relative "vector"

module IGraph
  module LibIGraph
    # igraph_error_t igraph_is_graphical(const igraph_vector_int_t *out_degrees, const igraph_vector_int_t *in_degrees, igraph_edge_type_sw_t allowed_edge_types, igraph_bool_t *res);
    attach_function :igraph_is_graphical, %i[pointer pointer int pointer], :int

    # igraph_error_t igraph_is_bigraphical(const igraph_vector_int_t *degrees1, const igraph_vector_int_t *degrees2, igraph_edge_type_sw_t allowed_edge_types, igraph_bool_t *res);
    attach_function :igraph_is_bigraphical, %i[pointer pointer int pointer], :int
  end
end
