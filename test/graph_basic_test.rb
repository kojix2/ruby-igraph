require "test_helper"

class GraphBasicTest < Test::Unit::TestCase
  test "basic graph operations" do
    graph = IGraph::LibIGraph::Graph.new

    # Create an empty graph with 3 vertices
    result = IGraph::LibIGraph.igraph_empty(graph.pointer, 3, false)
    assert_equal IGraph::LibIGraph::IGRAPH_SUCCESS, result

    # Check vertex count
    vcount = IGraph::LibIGraph.igraph_vcount(graph.pointer)
    assert_equal 3, vcount

    # Check edge count (should be 0 for empty graph)
    ecount = IGraph::LibIGraph.igraph_ecount(graph.pointer)
    assert_equal 0, ecount

    # Check if graph is directed (should be false)
    directed = IGraph::LibIGraph.igraph_is_directed(graph.pointer)
    assert_equal false, directed

    # Destroy graph
    IGraph::LibIGraph.igraph_destroy(graph.pointer)
  end

  test "directed graph creation" do
    graph = IGraph::LibIGraph::Graph.new

    # Create an empty directed graph with 2 vertices
    result = IGraph::LibIGraph.igraph_empty(graph.pointer, 2, true)
    assert_equal IGraph::LibIGraph::IGRAPH_SUCCESS, result

    # Check if graph is directed (should be true)
    directed = IGraph::LibIGraph.igraph_is_directed(graph.pointer)
    assert_equal true, directed

    # Destroy graph
    IGraph::LibIGraph.igraph_destroy(graph.pointer)
  end
end
