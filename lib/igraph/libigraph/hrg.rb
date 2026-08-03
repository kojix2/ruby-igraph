require "ffi"
require_relative "datatype"
require_relative "vector"

module IGraph
  module LibIGraph
    # igraph_error_t igraph_hrg_init(igraph_hrg_t *hrg, igraph_int_t n);
    attach_function :igraph_hrg_init, %i[pointer long_long], :int

    # void igraph_hrg_destroy(igraph_hrg_t *hrg);
    attach_function :igraph_hrg_destroy, [:pointer], :void

    # igraph_int_t igraph_hrg_size(const igraph_hrg_t *hrg);
    attach_function :igraph_hrg_size, [:pointer], :long_long

    # igraph_error_t igraph_hrg_fit(const igraph_t *graph, igraph_hrg_t *hrg, igraph_bool_t start, igraph_int_t steps);
    attach_function :igraph_hrg_fit, %i[pointer pointer bool long_long], :int

    # igraph_error_t igraph_hrg_game(igraph_t *graph, const igraph_hrg_t *hrg);
    attach_function :igraph_hrg_game, %i[pointer pointer], :int

    # igraph_error_t igraph_hrg_dendrogram(igraph_t *graph, const igraph_hrg_t *hrg);
    attach_function :igraph_hrg_dendrogram, %i[pointer pointer], :int

    # igraph_error_t igraph_hrg_consensus(const igraph_t *graph, igraph_vector_int_t *parents, igraph_vector_t *weights, igraph_hrg_t *hrg, igraph_int_t start, igraph_int_t num_samples);
    attach_function :igraph_hrg_consensus, %i[pointer pointer pointer pointer long_long long_long], :int

    # igraph_error_t igraph_hrg_predict(const igraph_t *graph, igraph_vector_int_t *edges, igraph_vector_t *prob, igraph_hrg_t *hrg, igraph_bool_t start, igraph_int_t num_samples, igraph_int_t num_bins);
    attach_function :igraph_hrg_predict, %i[pointer pointer pointer pointer bool long_long long_long], :int

    # igraph_error_t igraph_hrg_create(igraph_hrg_t *hrg, igraph_int_t n, const igraph_vector_int_t *parents, const igraph_vector_t *weights);
    attach_function :igraph_hrg_create, %i[pointer long_long pointer pointer], :int

    # igraph_int_t igraph_hrg_left(const igraph_hrg_t *hrg, igraph_int_t node);
    attach_function :igraph_hrg_left, %i[pointer long_long], :long_long

    # igraph_int_t igraph_hrg_right(const igraph_hrg_t *hrg, igraph_int_t node);
    attach_function :igraph_hrg_right, %i[pointer long_long], :long_long

    # igraph_bool_t igraph_hrg_internal(const igraph_hrg_t *hrg, igraph_int_t node);
    attach_function :igraph_hrg_internal, %i[pointer long_long], :bool

    # igraph_int_t igraph_hrg_parent(const igraph_hrg_t *hrg, igraph_int_t node);
    attach_function :igraph_hrg_parent, %i[pointer long_long], :long_long
  end
end
