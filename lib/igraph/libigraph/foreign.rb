require "ffi"
require_relative "datatype"
require_relative "vector"
require_relative "matrix"

module IGraph
  module LibIGraph
    # igraph_error_t igraph_community_to_membership 用のigraph_matrix_int_t構造体
    class MatrixIntStruct < FFI::Struct
      layout(
        :data, :pointer,        # igraph_vector (embedded) - ポインタとして扱う
        :nrow, :long_long,      # igraph_integer_t
        :ncol, :long_long       # igraph_integer_t
      )
    end

    # --- Read functions ---
    # igraph_error_t igraph_read_graph_edgelist(igraph_t *graph, FILE *instream, igraph_int_t n, igraph_bool_t directed);
    attach_function :igraph_read_graph_edgelist, %i[pointer pointer long_long bool], :int

    # igraph_error_t igraph_read_graph_ncol(igraph_t *graph, FILE *instream, const igraph_strvector_t *predefnames, igraph_bool_t names, igraph_add_weights_t weights, igraph_bool_t directed);
    attach_function :igraph_read_graph_ncol, %i[pointer pointer pointer bool int bool], :int

    # igraph_error_t igraph_read_graph_lgl(igraph_t *graph, FILE *instream, igraph_bool_t names, igraph_add_weights_t weights, igraph_bool_t directed);
    attach_function :igraph_read_graph_lgl, %i[pointer pointer bool int bool], :int

    # igraph_error_t igraph_read_graph_pajek(igraph_t *graph, FILE *instream);
    attach_function :igraph_read_graph_pajek, %i[pointer pointer], :int

    # igraph_error_t igraph_read_graph_graphml(igraph_t *graph, FILE *instream, igraph_int_t index);
    attach_function :igraph_read_graph_graphml, %i[pointer pointer long_long], :int

    # igraph_error_t igraph_read_graph_dimacs_flow(igraph_t *graph, FILE *instream, igraph_strvector_t *problem, igraph_vector_int_t *label, igraph_int_t *source, igraph_int_t *target, igraph_vector_t *capacity, igraph_bool_t directed);
    attach_function :igraph_read_graph_dimacs_flow, %i[pointer pointer pointer pointer pointer pointer pointer bool], :int

    # igraph_error_t igraph_read_graph_graphdb(igraph_t *graph, FILE *instream, igraph_bool_t directed);
    attach_function :igraph_read_graph_graphdb, %i[pointer pointer bool], :int

    # igraph_error_t igraph_read_graph_gml(igraph_t *graph, FILE *instream);
    attach_function :igraph_read_graph_gml, %i[pointer pointer], :int

    # igraph_error_t igraph_read_graph_dl(igraph_t *graph, FILE *instream, igraph_bool_t directed);
    attach_function :igraph_read_graph_dl, %i[pointer pointer bool], :int

    # --- Write functions ---
    # igraph_error_t igraph_write_graph_edgelist(const igraph_t *graph, FILE *outstream);
    attach_function :igraph_write_graph_edgelist, %i[pointer pointer], :int

    # igraph_error_t igraph_write_graph_ncol(const igraph_t *graph, FILE *outstream, const char *names, const char *weights);
    attach_function :igraph_write_graph_ncol, %i[pointer pointer string string], :int

    # igraph_error_t igraph_write_graph_lgl(const igraph_t *graph, FILE *outstream, const char *names, const char *weights, igraph_bool_t isolates);
    attach_function :igraph_write_graph_lgl, %i[pointer pointer string string bool], :int

    # igraph_error_t igraph_write_graph_graphml(const igraph_t *graph, FILE *outstream, igraph_bool_t prefixattr);
    attach_function :igraph_write_graph_graphml, %i[pointer pointer bool], :int

    # igraph_error_t igraph_write_graph_pajek(const igraph_t *graph, FILE *outstream);
    attach_function :igraph_write_graph_pajek, %i[pointer pointer], :int

    # igraph_error_t igraph_write_graph_dimacs_flow(const igraph_t *graph, FILE *outstream, igraph_int_t source, igraph_int_t target, const igraph_vector_t *capacity);
    attach_function :igraph_write_graph_dimacs_flow, %i[pointer pointer long_long long_long pointer], :int

    # igraph_error_t igraph_write_graph_gml(const igraph_t *graph, FILE *outstream, igraph_write_gml_sw_t options, const igraph_vector_t *id, const char *creator);
    attach_function :igraph_write_graph_gml, %i[pointer pointer int pointer string], :int

    # igraph_error_t igraph_write_graph_dot(const igraph_t *graph, FILE *outstream);
    attach_function :igraph_write_graph_dot, %i[pointer pointer], :int

    # igraph_error_t igraph_write_graph_leda(const igraph_t *graph, FILE *outstream, const char* vertex_attr_name, const char* edge_attr_name);
    attach_function :igraph_write_graph_leda, %i[pointer pointer string string], :int

    # igraph_error_t igraph_enter_safelocale(igraph_safelocale_t *loc);
    # 未対応 (内部用)
    # attach_function :igraph_enter_safelocale, [:pointer], :int
  end
end
