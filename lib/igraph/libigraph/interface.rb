require "ffi"
require_relative "datatype"
require_relative "vector"

module IGraph
  module LibIGraph
    # igraph_vs_t structure for vertex selectors
    # Simplified definition - union data treated as opaque bytes
    # Actual C structure:
    # typedef struct igraph_vs_t {
    #     igraph_vs_type_t type;
    #     union { ... } data;  // 16 bytes on 64-bit systems
    # } igraph_vs_t;
    class VertexSelector < FFI::Struct
      layout(
        :type, :int,                    # igraph_vs_type_t (4 bytes)
        :padding, [:uint8, 4],          # Padding to align to 8-byte boundary
        :data, [:uint8, 16]             # Union data (16 bytes)
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
    attach_function :igraph_degree, [:pointer, :pointer, VertexSelector.by_value, :int, :bool], :int

    # igraph_error_t igraph_delete_edges(igraph_t *graph, igraph_es_t edges);
    attach_function :igraph_delete_edges, %i[pointer int], :int

    # igraph_error_t igraph_delete_vertices(igraph_t *graph, const igraph_vs_t vertices);
    attach_function :igraph_delete_vertices, [:pointer, VertexSelector.by_value], :int

    # igraph_error_t igraph_edge(const igraph_t *graph, igraph_integer_t eid, igraph_integer_t *from, igraph_integer_t *to);
    attach_function :igraph_edge, %i[pointer long_long pointer pointer], :int

    # igraph_error_t igraph_edges(const igraph_t *graph, igraph_es_t eids, igraph_vector_int_t *edges);
    attach_function :igraph_edges, %i[pointer int pointer], :int

    # igraph_error_t igraph_get_eid(const igraph_t *graph, igraph_integer_t *eid, igraph_integer_t from, igraph_integer_t to, igraph_bool_t directed, igraph_bool_t error);
    attach_function :igraph_get_eid, %i[pointer pointer long_long long_long bool bool], :int

    # igraph_error_t igraph_incident(const igraph_t *graph, igraph_vector_int_t *eids, igraph_integer_t vid, igraph_neimode_t mode);
    attach_function :igraph_incident, %i[pointer pointer long_long int], :int
  end
end
