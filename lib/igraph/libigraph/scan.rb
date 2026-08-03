require "ffi"
require_relative "datatype"
require_relative "vector"

module IGraph
  module LibIGraph
    # igraph_error_t igraph_local_scan_0(const igraph_t *graph, igraph_vector_t *res, const igraph_vector_t *weights, igraph_neimode_t mode);
    attach_function :igraph_local_scan_0, %i[pointer pointer pointer int], :int

    # igraph_error_t igraph_local_scan_0_them(const igraph_t *us, const igraph_t *them, igraph_vector_t *res, const igraph_vector_t *weights_them, igraph_neimode_t mode);
    attach_function :igraph_local_scan_0_them, %i[pointer pointer pointer pointer int], :int

    # igraph_error_t igraph_local_scan_1_ecount(const igraph_t *graph, igraph_vector_t *res, const igraph_vector_t *weights, igraph_neimode_t mode);
    attach_function :igraph_local_scan_1_ecount, %i[pointer pointer pointer int], :int

    # igraph_error_t igraph_local_scan_1_ecount_them(const igraph_t *us, const igraph_t *them, igraph_vector_t *res, const igraph_vector_t *weights, igraph_neimode_t mode);
    attach_function :igraph_local_scan_1_ecount_them, %i[pointer pointer pointer pointer int], :int

    # igraph_error_t igraph_local_scan_k_ecount(const igraph_t *graph, igraph_int_t k, igraph_vector_t *res, const igraph_vector_t *weights, igraph_neimode_t mode);
    attach_function :igraph_local_scan_k_ecount, %i[pointer long_long pointer pointer int], :int

    # igraph_error_t igraph_local_scan_k_ecount_them(const igraph_t *us, const igraph_t *them, igraph_int_t k, igraph_vector_t *res, const igraph_vector_t *weights_them, igraph_neimode_t mode);
    attach_function :igraph_local_scan_k_ecount_them, %i[pointer pointer long_long pointer pointer int], :int

    # igraph_error_t igraph_local_scan_neighborhood_ecount(const igraph_t *graph, igraph_vector_t *res, const igraph_vector_t *weights, const igraph_vector_int_list_t *neighborhoods);
    attach_function :igraph_local_scan_neighborhood_ecount, %i[pointer pointer pointer pointer], :int

    # igraph_error_t igraph_local_scan_subset_ecount(const igraph_t *graph, igraph_vector_t *res, const igraph_vector_t *weights, const igraph_vector_int_list_t *neighborhoods);
    attach_function :igraph_local_scan_subset_ecount, %i[pointer pointer pointer pointer], :int
  end
end
