require "ffi"
require_relative "datatype"
require_relative "vector"

module IGraph
  module LibIGraph
    # igraph_error_t igraph_cohesive_blocks(const igraph_t *graph, igraph_vector_int_list_t *blocks, igraph_vector_int_t *cohesion, igraph_vector_int_t *parent, igraph_t *block_tree);
    attach_function :igraph_cohesive_blocks, %i[pointer pointer pointer pointer pointer], :int
  end
end
