require "ffi"
require_relative "datatype"
require_relative "vector"

module IGraph
  module LibIGraph
    # igraph_vs_t structure for vertex selectors
    # Actual C structure:
    # typedef struct igraph_vs_t {
    #     igraph_vs_type_t type;
    #     union {
    #         igraph_integer_t vid;               /* single vertex  */
    #         const igraph_vector_int_t *vecptr;  /* vector of vertices  */
    #         struct {
    #             igraph_integer_t vid;
    #             igraph_neimode_t mode;
    #         } adj;                              /* adjacent vertices  */
    #         struct {
    #             igraph_integer_t start;         /* first index (inclusive) */
    #             igraph_integer_t end;           /* last index (exclusive) */
    #         } range;                            /* range of vertices */
    #     } data;
    # } igraph_vs_t;

    # Nested structures for the union
    class VertexSelectorAdj < FFI::Struct
      layout(
        :vid, :long_long,               # igraph_integer_t
        :mode, :int                     # igraph_neimode_t
      )
    end

    class VertexSelectorRange < FFI::Struct
      layout(
        :start, :long_long,             # igraph_integer_t
        :end, :long_long                # igraph_integer_t
      )
    end

    # Union for the data field
    class VertexSelectorData < FFI::Union
      layout(
        :vid, :long_long,               # igraph_integer_t vid (single vertex)
        :vecptr, :pointer,              # const igraph_vector_int_t *vecptr (vector of vertices)
        :adj, VertexSelectorAdj,        # adjacent vertices struct
        :range, VertexSelectorRange     # range of vertices struct
      )
    end

    # Main structure
    class VertexSelector < FFI::Struct
      layout(
        :type, :int,                    # igraph_vs_type_t
        :data, VertexSelectorData       # Union data
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
  end
end
