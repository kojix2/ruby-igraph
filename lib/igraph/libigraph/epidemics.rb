require "ffi"
require_relative "datatype"
require_relative "vector"

module IGraph
  module LibIGraph
    # igraph_error_t igraph_sir_init(igraph_sir_t *sir);
    attach_function :igraph_sir_init, [:pointer], :int

    # void igraph_sir_destroy(igraph_sir_t *sir);
    attach_function :igraph_sir_destroy, [:pointer], :void

    # igraph_error_t igraph_sir(const igraph_t *graph, igraph_real_t beta, igraph_real_t gamma, igraph_int_t no_sim, igraph_vector_ptr_t *result);
    attach_function :igraph_sir, %i[pointer double double long_long pointer], :int
  end
end
