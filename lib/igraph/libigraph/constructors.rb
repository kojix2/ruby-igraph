require "ffi"
require_relative "datatype"
require_relative "vector"

module IGraph
  module LibIGraph
    # igraph_error_t igraph_create(igraph_t *graph, const igraph_vector_int_t *edges, igraph_integer_t n, igraph_bool_t directed);
    attach_function :igraph_create, %i[pointer pointer long_long bool], :int

    # igraph_error_t igraph_full(igraph_t *graph, igraph_integer_t n, igraph_bool_t directed, igraph_bool_t loops);
    attach_function :igraph_full, %i[pointer long_long bool bool], :int

    # igraph_error_t igraph_star(igraph_t *graph, igraph_integer_t n, igraph_star_mode_t mode, igraph_integer_t center);
    attach_function :igraph_star, %i[pointer long_long int long_long], :int

    # igraph_error_t igraph_ring(igraph_t *graph, igraph_integer_t n, igraph_bool_t directed, igraph_bool_t mutual, igraph_bool_t circular);
    attach_function :igraph_ring, %i[pointer long_long bool bool bool], :int
  end
end
