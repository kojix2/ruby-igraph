require "ffi"
require_relative "datatype"
require_relative "vector"

module IGraph
  module LibIGraph
    # igraph_error_t igraph_dyad_census(const igraph_t *graph, igraph_int_t *mut, igraph_int_t *asym, igraph_int_t *null);
    attach_function :igraph_dyad_census, %i[pointer pointer pointer pointer], :int

    # igraph_error_t igraph_triad_census(const igraph_t *graph, igraph_vector_t *res);
    attach_function :igraph_triad_census, %i[pointer pointer], :int

    # igraph_error_t igraph_triad_census_24(const igraph_t *graph, igraph_vector_t *res);
    attach_function :igraph_triad_census_24, %i[pointer pointer], :int

    # igraph_error_t igraph_motifs_randesu(const igraph_t *graph, igraph_vector_t *hist, igraph_int_t size, const igraph_vector_t *cut_prob);
    attach_function :igraph_motifs_randesu, %i[pointer pointer long_long pointer], :int

    # igraph_error_t igraph_motifs_randesu_estimate(const igraph_t *graph, igraph_int_t *est, igraph_int_t size, const igraph_vector_t *cut_prob, igraph_int_t sample_size, const igraph_vector_int_t *sample);
    attach_function :igraph_motifs_randesu_estimate, %i[pointer pointer long_long pointer long_long pointer], :int

    # igraph_error_t igraph_motifs_randesu_no(const igraph_t *graph, igraph_int_t *no, igraph_int_t size, const igraph_vector_t *cut_prob);
    attach_function :igraph_motifs_randesu_no, %i[pointer pointer long_long pointer], :int

    # igraph_error_t igraph_motifs_randesu_callback(const igraph_t *graph, igraph_int_t size, const igraph_vector_t *cut_prob, igraph_motifs_handler_t *callback, void *extra);
    attach_function :igraph_motifs_randesu_callback, %i[pointer long_long pointer pointer pointer], :int

    # igraph_error_t igraph_graphlets(const igraph_t *graph, const igraph_vector_t *weights, igraph_vector_int_list_t *cliques, igraph_vector_t *Mu, igraph_int_t niter);
    attach_function :igraph_graphlets, %i[pointer pointer pointer pointer long_long], :int

    # igraph_error_t igraph_graphlets_candidate_basis(const igraph_t *graph, const igraph_vector_t *weights, igraph_vector_int_list_t *cliques, igraph_vector_t *thresholds);
    attach_function :igraph_graphlets_candidate_basis, %i[pointer pointer pointer pointer], :int

    # igraph_error_t igraph_graphlets_project(const igraph_t *graph, const igraph_vector_t *weights, const igraph_vector_int_list_t *cliques, igraph_vector_t *Mu, igraph_bool_t startMu, igraph_int_t niter);
    attach_function :igraph_graphlets_project, %i[pointer pointer pointer pointer bool long_long], :int
  end
end
