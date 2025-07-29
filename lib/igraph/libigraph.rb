module IGraph
  module LibIGraph
    extend FFI::Library

    begin
      ffi_lib IGraph.lib_path
    rescue LoadError => e
      raise LoadError, "#{e}\nCould not find #{IGraph.lib_path}"
    end

    # @!macro attach_function
    #   @!scope class
    #   @!method $1(${2--2})
    #   @return [${-1}] the return value of $0
    def self.attach_function(*)
      super
    rescue FFI::NotFoundError => e
      warn e.message if $VERBOSE
    end

    # IGRAPH_EXPORT void IGraphconst char **version_string,
    #                                   int *major,
    #                                   int *minor,
    #                                   int *subminor);
    attach_function :igraph_version, %i[pointer pointer pointer pointer], :void
  end
end
