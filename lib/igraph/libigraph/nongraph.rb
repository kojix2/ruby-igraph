require "ffi"
require_relative "datatype"
require_relative "vector"

module IGraph
  module LibIGraph
    # igraph_error_t igraph_running_mean(const igraph_vector_t *data, igraph_vector_t *res, igraph_int_t binwidth);
    attach_function :igraph_running_mean, %i[pointer pointer long_long], :int

    # igraph_error_t igraph_power_law_fit(const igraph_vector_t* vector, igraph_plfit_result_t* result, igraph_real_t xmin, igraph_bool_t force_continuous);
    attach_function :igraph_power_law_fit, %i[pointer pointer double bool], :int

    # igraph_error_t igraph_plfit_result_calculate_p_value(const igraph_plfit_result_t* model, igraph_real_t* result, igraph_real_t precision);
    attach_function :igraph_plfit_result_calculate_p_value, %i[pointer pointer double], :int
  end
end
