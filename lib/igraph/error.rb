# frozen_string_literal: true

module IGraph
  # Set up the C error handler when the module is loaded
  def self.setup_error_handler
    return if @error_handler_setup
    @error_handler_setup = true

    handler = FFI::Function.new(:void, %i[string string int int]) do |reason, _file, _line, _errno|
      @last_c_error = reason
    end
    LibIGraph.igraph_set_error_handler(handler)
    @error_handler_func = handler # Prevent GC
  end

  def self.last_c_error
    @last_c_error
  end

  def self.clear_last_c_error
    @last_c_error = nil
  end

  # Check the return value from the C API and raise an exception on error
  def self.check_error(result)
    return result if result == LibIGraph::IGRAPH_SUCCESS

    msg = LibIGraph.igraph_strerror(result) || "Unknown igraph error (code=#{result})"
    msg = last_c_error || msg
    clear_last_c_error

    case result
    when LibIGraph::IGRAPH_ENOMEM
      raise IGraph::NoMemoryError, msg
    when LibIGraph::IGRAPH_EINVAL
      raise IGraph::ArgumentError, msg
    when LibIGraph::IGRAPH_EINVVID, LibIGraph::IGRAPH_EINVEVECTOR, LibIGraph::IGRAPH_EINVMODE
      raise IGraph::ArgumentError, msg
    when LibIGraph::IGRAPH_EFILE, LibIGraph::IGRAPH_PARSEERROR
      raise IGraph::IOError, msg
    else
      raise IGraph::RuntimeError, msg
    end
  end

  # Base error class (already defined in igraph.rb, reopened here for subclass hierarchy)
  # class Error < StandardError; end

  # Exception for igraph C API error codes
  class RuntimeError < Error; end

  # Exception for invalid arguments
  class ArgumentError < Error; end

  # Exception for invalid object state
  class StateError < Error; end

  # Exception for memory allocation failures
  class NoMemoryError < Error; end

  # Exception for file I/O errors
  class IOError < Error; end

  # Exception for unknown error codes
  class UnknownError < Error; end
end
