require "ffi"
require_relative "datatype"
require_relative "vector"

module IGraph
  module LibIGraph
    # igraph_error_t igraph_erdos_renyi_game_gnp(igraph_t *graph, igraph_integer_t n, igraph_real_t p, igraph_bool_t directed, igraph_bool_t loops);
    attach_function :igraph_erdos_renyi_game_gnp, %i[pointer long_long double bool bool], :int

    # igraph_error_t igraph_erdos_renyi_game_gnm(igraph_t *graph, igraph_integer_t n, igraph_integer_t m, igraph_bool_t directed, igraph_bool_t loops);
    attach_function :igraph_erdos_renyi_game_gnm, %i[pointer long_long long_long bool bool], :int

    # igraph_error_t igraph_barabasi_game(igraph_t *graph, igraph_integer_t n, igraph_real_t power, igraph_integer_t m, const igraph_vector_int_t *outseq, igraph_bool_t outpref, igraph_real_t A, igraph_bool_t directed, igraph_barabasi_algorithm_t algo, const igraph_t *start_from);
    attach_function :igraph_barabasi_game,
                    %i[pointer long_long double long_long pointer bool double bool int pointer], :int

    # igraph_error_t igraph_watts_strogatz_game(igraph_t *graph, igraph_integer_t dim, igraph_integer_t size, igraph_integer_t nei, igraph_real_t p, igraph_bool_t loops, igraph_bool_t multiple);
    attach_function :igraph_watts_strogatz_game, %i[pointer long_long long_long long_long double bool bool],
                    :int

    # igraph_error_t igraph_k_regular_game(igraph_t *graph, igraph_integer_t no_of_nodes, igraph_integer_t k, igraph_bool_t directed, igraph_bool_t multiple);
    attach_function :igraph_k_regular_game, %i[pointer long_long long_long bool bool], :int

    # igraph_error_t igraph_growing_random_game(igraph_t *graph, igraph_integer_t n, igraph_integer_t m, igraph_bool_t directed, igraph_bool_t citation);
    attach_function :igraph_growing_random_game, %i[pointer long_long long_long bool bool], :int

    # igraph_error_t igraph_tree_game(igraph_t *graph, igraph_integer_t n, igraph_bool_t directed, igraph_random_tree_t method);
    attach_function :igraph_tree_game, %i[pointer long_long bool int], :int
  end
end
