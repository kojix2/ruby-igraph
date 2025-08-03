require "ffi"
require_relative "datatype"
require_relative "vector"

module IGraph
  module LibIGraph
    # igraph_vs_t structure for vertex selectors
    class VertexSelector < FFI::Struct
      layout(
        :type, :int, # igraph_vs_type_t
        :data, [:uint8, 24] # Union data (simplified as byte array)
      )
    end
    # igraph_error_t igraph_empty(igraph_t *graph, igraph_integer_t n, igraph_bool_t directed);
    attach_function :igraph_empty, %i[pointer long_long bool], :int

    # void igraph_destroy(igraph_t *graph);
    attach_function :igraph_destroy, [:pointer], :void

    # igraph_integer_t igraph_vcount(const igraph_t *graph);
    attach_function :igraph_vcount, [:pointer], :long_long

    # igraph_integer_t igraph_ecount(const igraph_t *graph);
    attach_function :igraph_ecount, [:pointer], :long_long

    # igraph_bool_t igraph_is_directed(const igraph_t *graph);
    attach_function :igraph_is_directed, [:pointer], :bool

    # igraph_error_t igraph_add_edges(igraph_t *graph, const igraph_vector_int_t *edges, void *attr);
    attach_function :igraph_add_edges, %i[pointer pointer pointer], :int

    # igraph_error_t igraph_add_vertices(igraph_t *graph, igraph_integer_t nv, void *attr);
    attach_function :igraph_add_vertices, %i[pointer long_long pointer], :int

    # igraph_error_t igraph_neighbors(const igraph_t *graph, igraph_vector_int_t *neis, igraph_integer_t vid, igraph_neimode_t mode);
    attach_function :igraph_neighbors, %i[pointer pointer long_long int], :int

    # Vertex selector functions
    # igraph_error_t igraph_vs_all(igraph_vs_t *vs);
    attach_function :igraph_vs_all, [:pointer], :int

    # void igraph_vs_destroy(igraph_vs_t *vs);
    attach_function :igraph_vs_destroy, [:pointer], :void

    # igraph_error_t igraph_degree(const igraph_t *graph, igraph_vector_int_t *res, const igraph_vs_t vids, igraph_neimode_t mode, igraph_bool_t loops);
    attach_function :igraph_degree, %i[pointer pointer pointer int bool], :int
  end
end
