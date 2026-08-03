require "ffi"
require_relative "datatype"
require_relative "vector"

module IGraph
  module LibIGraph
    # igraph_error_t igraph_mixing(const igraph_t *graph, const igraph_vector_int_t *types, igraph_matrix_t *m, igraph_bool_t directed);
    attach_function :igraph_mixing, %i[pointer pointer pointer bool], :int

    # igraph_error_t igraph_mixing_lambda(const igraph_t *graph, const igraph_vector_int_t *types, igraph_real_t *value, igraph_bool_t directed);
    attach_function :igraph_mixing_lambda, %i[pointer pointer pointer bool], :int

    # igraph_error_t igraph_mixing_els(const igraph_t *graph, const igraph_vector_int_t *types, igraph_vector_t *e, igraph_vector_t *a, const igraph_vector_t *weights, igraph_bool_t directed);
    attach_function :igraph_mixing_els, %i[pointer pointer pointer pointer pointer bool], :int

    # igraph_error_t igraph_assortativity_nominal(const igraph_t *graph, const igraph_vector_int_t *types, igraph_real_t *values, igraph_bool_t directed);
    attach_function :igraph_assortativity_nominal, %i[pointer pointer pointer bool], :int

    # igraph_error_t igraph_assortativity(const igraph_t *graph, const igraph_vector_t *values1, const igraph_vector_t *values2, igraph_real_t *value, igraph_bool_t directed);
    attach_function :igraph_assortativity, %i[pointer pointer pointer pointer bool], :int

    # igraph_error_t igraph_assortativity_degree(const igraph_t *graph, igraph_real_t *value, igraph_bool_t directed);
    attach_function :igraph_assortativity_degree, %i[pointer pointer bool], :int

    # igraph_error_t igraph_joint_degree_matrix(const igraph_t *graph, const igraph_vector_t *weights, igraph_matrix_t *p, igraph_int_t max_degree, igraph_neimode_t from_mode, igraph_neimode_t to_mode, igraph_bool_t directed_neighbors, igraph_bool_t normalized, igraph_int_t max_from_degree, igraph_int_t max_to_degree);
    attach_function :igraph_joint_degree_matrix, %i[pointer pointer pointer long_long int int bool bool long_long long_long], :int

    # igraph_error_t igraph_joint_type_distribution(const igraph_t *graph, const igraph_vector_t *weights, igraph_matrix_t *p, const igraph_vector_int_t *from_types, const igraph_vector_int_t *to_types, igraph_bool_t directed, igraph_bool_t normalized);
    attach_function :igraph_joint_type_distribution, %i[pointer pointer pointer pointer pointer bool bool], :int
  end
end
