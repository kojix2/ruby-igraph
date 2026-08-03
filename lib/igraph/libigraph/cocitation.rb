require "ffi"
require_relative "datatype"
require_relative "vector"

module IGraph
  module LibIGraph
    # igraph_error_t igraph_cocitation(const igraph_t *graph, igraph_matrix_t *res, igraph_vs_t vids);
    attach_function :igraph_cocitation, %i[pointer pointer pointer], :int

    # igraph_error_t igraph_bibcoupling(const igraph_t *graph, igraph_matrix_t *res, igraph_vs_t vids);
    attach_function :igraph_bibcoupling, %i[pointer pointer pointer], :int

    # igraph_error_t igraph_similarity_jaccard(const igraph_t *graph, igraph_matrix_t *res, igraph_vs_t vit_from, igraph_vs_t vit_to, igraph_neimode_t mode, igraph_bool_t loops);
    attach_function :igraph_similarity_jaccard, %i[pointer pointer pointer pointer int bool], :int

    # igraph_error_t igraph_similarity_jaccard_pairs(const igraph_t *graph, igraph_vector_t *res, const igraph_vector_int_t *pairs, igraph_neimode_t mode, igraph_bool_t loops);
    attach_function :igraph_similarity_jaccard_pairs, %i[pointer pointer pointer int bool], :int

    # igraph_error_t igraph_similarity_jaccard_es(const igraph_t *graph, igraph_vector_t *res, igraph_es_t es, igraph_neimode_t mode, igraph_bool_t loops);
    attach_function :igraph_similarity_jaccard_es, %i[pointer pointer pointer int bool], :int

    # igraph_error_t igraph_similarity_dice(const igraph_t *graph, igraph_matrix_t *res, igraph_vs_t vit_from, igraph_vs_t vit_to, igraph_neimode_t mode, igraph_bool_t loops);
    attach_function :igraph_similarity_dice, %i[pointer pointer pointer pointer int bool], :int

    # igraph_error_t igraph_similarity_dice_pairs(const igraph_t *graph, igraph_vector_t *res, const igraph_vector_int_t *pairs, igraph_neimode_t mode, igraph_bool_t loops);
    attach_function :igraph_similarity_dice_pairs, %i[pointer pointer pointer int bool], :int

    # igraph_error_t igraph_similarity_dice_es(const igraph_t *graph, igraph_vector_t *res, igraph_es_t es, igraph_neimode_t mode, igraph_bool_t loops);
    attach_function :igraph_similarity_dice_es, %i[pointer pointer pointer int bool], :int

    # igraph_error_t igraph_similarity_inverse_log_weighted(const igraph_t *graph, igraph_matrix_t *res, igraph_vs_t vids, igraph_neimode_t mode);
    attach_function :igraph_similarity_inverse_log_weighted, %i[pointer pointer pointer int], :int
  end
end
