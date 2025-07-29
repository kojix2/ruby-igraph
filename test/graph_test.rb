require "test_helper"

class GraphTest < Test::Unit::TestCase
  test "create empty graph" do
    graph = IGraph::LibIGraph::Graph.new

    # Create empty graph with 5 vertices, undirected
    result = IGraph::LibIGraph.igraph_empty(graph.pointer, 5, false)
    assert_equal IGraph::LibIGraph::IGRAPH_SUCCESS, result

    # Check vertex count
    vcount = IGraph::LibIGraph.igraph_vcount(graph.pointer)
    assert_equal 5, vcount

    # Check edge count
    ecount = IGraph::LibIGraph.igraph_ecount(graph.pointer)
    assert_equal 0, ecount

    # Check if directed
    directed = IGraph::LibIGraph.igraph_is_directed(graph.pointer)
    assert_equal false, directed # false (undirected)

    # Destroy graph
    IGraph::LibIGraph.igraph_destroy(graph.pointer)
  end
end
