require "ffi"

module IGraph
  module LibIGraph
    # igraph_error_t igraph_set_interruption_handler(igraph_interruption_handler_t *new_handler);
    attach_function :igraph_set_interruption_handler, [:pointer], :int

    # void igraph_allow_interruption(void *data);
    attach_function :igraph_allow_interruption, [:pointer], :void

    # igraph_bool_t igraph_interrupted(void);
    attach_function :igraph_interrupted, [], :bool
  end
end