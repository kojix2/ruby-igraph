require "ffi"

require_relative "igraph/version"

module IGraph
  class Error < StandardError; end

  class << self
    attr_accessor :lib_path

    def search_igraph(name = nil)
      name ||= "libigraph.#{FFI::Platform::LIBSUFFIX}"
      lib_path = if ENV["IGRAPHDIR"]
                   File.expand_path(name, ENV["IGRAPHDIR"])
                 else
                   File.expand_path("../vendor/#{name}", __dir__)
                 end
      return lib_path if File.exist?(lib_path)

      begin
        require "pkg-config"
        lib_dir = PKGConfig.variable("igraph", "libdir")
        lib_path = File.expand_path(name, lib_dir)
      rescue PackageConfig::NotFoundError
        warn "igraph.pc was not found in the pkg-config search path."
      end
      return lib_path if File.exist?(lib_path)

      warn "igraph shared library '#{name}' not found."
    end

    def search_igraph_windows
      ENV["IGRAPHDIR"] ||= [
        RubyInstaller::Runtime.msys2_installation.msys_path,
        RubyInstaller::Runtime.msys2_installation.mingwarch
      ].join(File::ALT_SEPARATOR)
      path = File.expand_path("bin/igraph.dll", ENV["IGRAPHDIR"])
      RubyInstaller::Runtime.add_dll_directory(File.dirname(path))
      path
    end
  end

  self.lib_path = if Object.const_defined?(:RubyInstaller)
                    search_igraph_windows
                  else
                    search_igraph
                  end

  autoload :LibIGraph, "igraph/libigraph"
end
