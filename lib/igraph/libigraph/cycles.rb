require "ffi"
require_relative "datatype"
require_relative "vector"

module IGraph
  module LibIGraph
    # igraph_error_t igraph_feedback_arc_set(const igraph_t *graph, igraph_vector_int_t *result, const igraph_vector_t *weights, igraph_fas_algorithm_t algo);
    attach_function :igraph_feedback_arc_set, %i[pointer pointer pointer int], :int

    # igraph_error_t igraph_feedback_arc_set_ip(const igraph_t *graph, igraph_vector_int_t *result, const igraph_vector_t *weights);
    attach_function :igraph_feedback_arc_set_ip, %i[pointer pointer pointer], :int

    # igraph_error_t igraph_find_cycle(const igraph_t *graph, igraph_vector_int_t *vertices, igraph_vector_int_t *edges, igraph_cycle_mode_t mode);
    attach_function :igraph_find_cycle, %i[pointer pointer pointer int], :int

    # igraph_error_t igraph_girth(const igraph_t *graph, igraph_real_t *girth, igraph_vector_int_t *circle);
    attach_function :igraph_girth, %i[pointer pointer pointer], :int

    # igraph_error_t igraph_has_cycle(const igraph_t *graph);
    attach_function :igraph_has_cycle, [:pointer], :int

    # igraph_error_t igraph_is_acyclic(const igraph_t *graph, igraph_bool_t *res);
    attach_function :igraph_is_acyclic, %i[pointer pointer], :int

    # igraph_error_t igraph_is_dag(const igraph_t *graph, igraph_bool_t *res);
    attach_function :igraph_is_dag, %i[pointer pointer], :int

    # igraph_error_t igraph_simplify_and_colorize(const igraph_t *graph, igraph_t *res, igraph_vector_t *vertex_color, igraph_vector_t *edge_color);
    attach_function :igraph_simplify_and_colorize, %i[pointer pointer pointer pointer], :int

    # igraph_error_t igraph_topological_sorting(const igraph_t *graph, igraph_vector_int_t *res, igraph_neimode_t mode);
    attach_function :igraph_topological_sorting, %i[pointer pointer int], :int

    # igraph_error_t igraph_dag_longest_path(const igraph_t *graph, igraph_vector_t *weights, igraph_vector_int_t *res);
    attach_function :igraph_dag_longest_path, %i[pointer pointer pointer], :int
  end
end
