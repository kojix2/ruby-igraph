require "ffi"

module IGraph
  module LibIGraph
    # igraph_error_t igraph_status(const char *message, void *data);
    attach_function :igraph_status, %i[string pointer], :int

    # igraph_error_t igraph_statusf(const char *message, void *data, ...);
    attach_function :igraph_statusf, %i[string pointer varargs], :int
  end
end