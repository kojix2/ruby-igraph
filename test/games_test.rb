require "test_helper"

class GamesTest < Test::Unit::TestCase
  test "erdos renyi game gnp" do
    graph = IGraph::LibIGraph::Graph.new

    # Create Erdős–Rényi random graph with 10 vertices, p=0.3, undirected, no loops
    result = IGraph::LibIGraph.igraph_erdos_renyi_game_gnp(graph.pointer, 10, 0.3, false, false)
    assert_equal IGraph::LibIGraph::IGRAPH_SUCCESS, result

    # Check vertex count
    vcount = IGraph::LibIGraph.igraph_vcount(graph.pointer)
    assert_equal 10, vcount

    # Check if undirected
    directed = IGraph::LibIGraph.igraph_is_directed(graph.pointer)
    assert_equal false, directed

    # Destroy graph
    IGraph::LibIGraph.igraph_destroy(graph.pointer)
  end

  test "erdos renyi game gnm" do
    graph = IGraph::LibIGraph::Graph.new

    # Create Erdős–Rényi random graph with 8 vertices, 12 edges, undirected, no loops
    result = IGraph::LibIGraph.igraph_erdos_renyi_game_gnm(graph.pointer, 8, 12, false, false)
    assert_equal IGraph::LibIGraph::IGRAPH_SUCCESS, result

    # Check vertex count
    vcount = IGraph::LibIGraph.igraph_vcount(graph.pointer)
    assert_equal 8, vcount

    # Check edge count
    ecount = IGraph::LibIGraph.igraph_ecount(graph.pointer)
    assert_equal 12, ecount

    # Destroy graph
    IGraph::LibIGraph.igraph_destroy(graph.pointer)
  end

  test "k regular game" do
    graph = IGraph::LibIGraph::Graph.new

    # Create 3-regular graph with 6 vertices, undirected, no multiple edges
    result = IGraph::LibIGraph.igraph_k_regular_game(graph.pointer, 6, 3, false, false)
    assert_equal IGraph::LibIGraph::IGRAPH_SUCCESS, result

    # Check vertex count
    vcount = IGraph::LibIGraph.igraph_vcount(graph.pointer)
    assert_equal 6, vcount

    # Check edge count (6 vertices * 3 degree / 2 for undirected)
    ecount = IGraph::LibIGraph.igraph_ecount(graph.pointer)
    assert_equal 9, ecount

    # Destroy graph
    IGraph::LibIGraph.igraph_destroy(graph.pointer)
  end
end
