module IGraph
  module LibIGraph
    # Error codes
    IGRAPH_SUCCESS = 0
    IGRAPH_FAILURE = 1
    IGRAPH_ENOMEM = 2
    IGRAPH_PARSEERROR = 3
    IGRAPH_EINVAL = 4
    IGRAPH_EXISTS = 5
    IGRAPH_EINVEVECTOR = 6
    IGRAPH_EINVVID = 7
    IGRAPH_NONSQUARE = 8
    IGRAPH_EINVMODE = 9
    IGRAPH_EFILE = 10
    IGRAPH_UNIMPLEMENTED = 12
    IGRAPH_INTERRUPTED = 13
    IGRAPH_DIVERGED = 14
    IGRAPH_ENEGLOOP = 37
    IGRAPH_EINTERNAL = 38
    IGRAPH_EDIVZERO = 42
    IGRAPH_EOVERFLOW = 55
    IGRAPH_EUNDERFLOW = 58
    IGRAPH_ERWSTUCK = 59
    IGRAPH_STOP = 60
    IGRAPH_ERANGE = 61
    IGRAPH_ENOSOL = 62

    # const char *igraph_strerror(const igraph_error_t igraph_errno);
    attach_function :igraph_strerror, [:int], :string

    # igraph_error_t igraph_error(const char *reason, const char *file, int line, igraph_error_t igraph_errno);
    attach_function :igraph_error, %i[string string int int], :int
  end
end
