require "ffi"

module IGraph
  module LibIGraph
    # Progress handlers - treated as opaque pointers
    # igraph_error_t igraph_progress(const char *message, igraph_real_t percent, void *data);
    attach_function :igraph_progress, %i[string double pointer], :int

    # igraph_error_t igraph_progressf(const char *message, igraph_real_t percent, void *data, ...);
    attach_function :igraph_progressf, %i[string double pointer varargs], :int
  end
end