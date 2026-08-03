require "ffi"
require_relative "datatype"
require_relative "vector"

module IGraph
  module LibIGraph
    # igraph_error_t igraph_reachability(const igraph_t *graph, igraph_vector_int_t *membership, igraph_vector_int_t *csize, igraph_int_t *no_of_components, igraph_bitset_list_t *reach, igraph_neimode_t mode);
    attach_function :igraph_reachability, %i[pointer pointer pointer pointer pointer int], :int

    # igraph_error_t igraph_count_reachable(const igraph_t *graph, igraph_vector_int_t *counts, igraph_neimode_t mode);
    attach_function :igraph_count_reachable, %i[pointer pointer int], :int

    # igraph_error_t igraph_transitive_closure(const igraph_t *graph, igraph_t* closure);
    attach_function :igraph_transitive_closure, %i[pointer pointer], :int
  end
end
