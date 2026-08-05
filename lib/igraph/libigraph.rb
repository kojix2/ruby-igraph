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
      warn e.message if $DEBUG
    end

    # IGRAPH_EXPORT void IGraphconst char **version_string,
    #                                   int *major,
    #                                   int *minor,
    #                                   int *subminor);
    attach_function :igraph_version, %i[pointer pointer pointer pointer], :void
  end
end

# Load all binding modules
require_relative "libigraph/constants"
require_relative "libigraph/error"
require_relative "libigraph/datatype"
require_relative "libigraph/vector"
require_relative "libigraph/vector_ptr"
require_relative "libigraph/matrix"
require_relative "libigraph/bitset"
require_relative "libigraph/strvector"
require_relative "libigraph/complex"
require_relative "libigraph/constructors"
require_relative "libigraph/interface"
require_relative "libigraph/iterators"
require_relative "libigraph/games"
require_relative "libigraph/structural"
require_relative "libigraph/paths"
require_relative "libigraph/centrality"
require_relative "libigraph/bipartite"
require_relative "libigraph/operators"
require_relative "libigraph/transitivity"
require_relative "libigraph/adjlist"
require_relative "libigraph/community"
require_relative "libigraph/layout"
require_relative "libigraph/cliques"
require_relative "libigraph/isomorphism"
require_relative "libigraph/flow"
require_relative "libigraph/components"
require_relative "libigraph/motifs"
require_relative "libigraph/cycles"
require_relative "libigraph/coloring"
require_relative "libigraph/cohesive_blocks"
require_relative "libigraph/foreign"
require_relative "libigraph/random"
require_relative "libigraph/cocitation"
require_relative "libigraph/hrg"
require_relative "libigraph/matching"
require_relative "libigraph/neighborhood"
require_relative "libigraph/reachability"
require_relative "libigraph/graphicality"
require_relative "libigraph/scan"
require_relative "libigraph/nongraph"
require_relative "libigraph/epidemics"
require_relative "libigraph/lsap"
require_relative "libigraph/mixing"
require_relative "libigraph/embedding"
require_relative "libigraph/eigen"
require_relative "libigraph/sparsemat"
require_relative "libigraph/conversion"
require_relative "libigraph/blas"
require_relative "libigraph/lapack"
require_relative "libigraph/arpack"
require_relative "libigraph/spatial"
require_relative "libigraph/attributes"
require_relative "libigraph/statusbar"
require_relative "libigraph/progress"
require_relative "libigraph/interrupt"
