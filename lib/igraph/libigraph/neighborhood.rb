require "ffi"
require_relative "datatype"
require_relative "vector"

module IGraph
  module LibIGraph
    # igraph_error_t igraph_neighborhood_size(const igraph_t *graph, igraph_vector_int_t *res, igraph_vs_t vids, igraph_int_t order, igraph_neimode_t mode, igraph_int_t mindist);
    attach_function :igraph_neighborhood_size, %i[pointer pointer pointer long_long int long_long], :int

    # igraph_error_t igraph_neighborhood(const igraph_t *graph, igraph_vector_int_list_t *res, igraph_vs_t vids, igraph_int_t order, igraph_neimode_t mode, igraph_int_t mindist);
    attach_function :igraph_neighborhood, %i[pointer pointer pointer long_long int long_long], :int

    # igraph_error_t igraph_neighborhood_graphs(const igraph_t *graph, igraph_graph_list_t *res, igraph_vs_t vids, igraph_int_t order, igraph_neimode_t mode, igraph_int_t mindist);
    attach_function :igraph_neighborhood_graphs, %i[pointer pointer pointer long_long int long_long], :int
  end
end
