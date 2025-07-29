require "ffi"

require_relative "vector"

module IGraph
  module LibIGraph
    class Graph < FFI::Struct
      layout(
        :n, :long_long,           # igraph_integer_t
        :directed, :bool,         # igraph_bool_t (bool)
        :from, VectorIntStruct,   # igraph_vector_int_t (embedded)
        :to, VectorIntStruct,     # igraph_vector_int_t (embedded)
        :oi, VectorIntStruct,     # igraph_vector_int_t (embedded)
        :ii, VectorIntStruct,     # igraph_vector_int_t (embedded)
        :os, VectorIntStruct,     # igraph_vector_int_t (embedded)
        :is, VectorIntStruct,     # igraph_vector_int_t (embedded)
        :attr, :pointer,          # void*
        :cache, :pointer          # igraph_i_property_cache_t*
      )
    end
  end
end
