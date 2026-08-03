require "ffi"
require_relative "datatype"
require_relative "vector"

module IGraph
  module LibIGraph
    # igraph_error_t igraph_to_directed(igraph_t *graph, igraph_to_directed_t mode);
    attach_function :igraph_to_directed, %i[pointer int], :int

    # igraph_error_t igraph_to_undirected(igraph_t *graph, igraph_to_undirected_t mode, const igraph_attribute_combination_t *edge_comb);
    attach_function :igraph_to_undirected, %i[pointer int pointer], :int

    # igraph_error_t igraph_get_adjacency(const igraph_t *graph, igraph_matrix_t *res, igraph_get_adjacency_t type, igraph_loops_t loops);
    attach_function :igraph_get_adjacency, %i[pointer pointer int int], :int

    # igraph_error_t igraph_get_adjacency_sparse(const igraph_t *graph, igraph_sparsemat_t *sparsemat, igraph_get_adjacency_t type, igraph_loops_t loops);
    attach_function :igraph_get_adjacency_sparse, %i[pointer pointer int int], :int
  end
end
