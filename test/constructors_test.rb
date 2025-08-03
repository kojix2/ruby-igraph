require "test_helper"

class ConstructorsTest < Test::Unit::TestCase
  test "star graph creation" do
    graph = IGraph::LibIGraph::Graph.new

    # Create a star graph with 5 vertices (center + 4 leaves)
    result = IGraph::LibIGraph.igraph_star(graph.pointer, 5, IGraph::LibIGraph::IGRAPH_STAR_UNDIRECTED, 0)
    assert_equal IGraph::LibIGraph::IGRAPH_SUCCESS, result

    # Check vertex count
    vcount = IGraph::LibIGraph.igraph_vcount(graph.pointer)
    assert_equal 5, vcount

    # Check edge count (should be 4 for a star with 5 vertices)
    ecount = IGraph::LibIGraph.igraph_ecount(graph.pointer)
    assert_equal 4, ecount

    # Clean up
    IGraph::LibIGraph.igraph_destroy(graph.pointer)
  end

  test "ring graph creation" do
    graph = IGraph::LibIGraph::Graph.new

    # Create a ring graph with 4 vertices
    result = IGraph::LibIGraph.igraph_ring(graph.pointer, 4, false, false, true)
    assert_equal IGraph::LibIGraph::IGRAPH_SUCCESS, result

    # Check vertex count
    vcount = IGraph::LibIGraph.igraph_vcount(graph.pointer)
    assert_equal 4, vcount

    # Check edge count (should be 4 for a ring with 4 vertices)
    ecount = IGraph::LibIGraph.igraph_ecount(graph.pointer)
    assert_equal 4, ecount

    # Clean up
    IGraph::LibIGraph.igraph_destroy(graph.pointer)
  end

  test "full graph creation" do
    graph = IGraph::LibIGraph::Graph.new

    # Create a complete graph with 4 vertices
    result = IGraph::LibIGraph.igraph_full(graph.pointer, 4, false, false)
    assert_equal IGraph::LibIGraph::IGRAPH_SUCCESS, result

    # Check vertex count
    vcount = IGraph::LibIGraph.igraph_vcount(graph.pointer)
    assert_equal 4, vcount

    # Check edge count (should be 6 for a complete graph with 4 vertices: C(4,2) = 6)
    ecount = IGraph::LibIGraph.igraph_ecount(graph.pointer)
    assert_equal 6, ecount

    # Clean up
    IGraph::LibIGraph.igraph_destroy(graph.pointer)
  end

  test "directed star graph creation" do
    graph = IGraph::LibIGraph::Graph.new

    # Create a directed star graph with 3 vertices
    result = IGraph::LibIGraph.igraph_star(graph.pointer, 3, IGraph::LibIGraph::IGRAPH_STAR_OUT, 0)
    assert_equal IGraph::LibIGraph::IGRAPH_SUCCESS, result

    # Check vertex count
    vcount = IGraph::LibIGraph.igraph_vcount(graph.pointer)
    assert_equal 3, vcount

    # Check edge count (should be 2 for a star with 3 vertices)
    ecount = IGraph::LibIGraph.igraph_ecount(graph.pointer)
    assert_equal 2, ecount

    # Check if graph is directed
    directed = IGraph::LibIGraph.igraph_is_directed(graph.pointer)
    assert_equal true, directed

    # Clean up
    IGraph::LibIGraph.igraph_destroy(graph.pointer)
  end

  test "path graph creation" do
    graph = IGraph::LibIGraph::Graph.new

    # Create a path graph (ring without closing edge)
    result = IGraph::LibIGraph.igraph_ring(graph.pointer, 4, false, false, false)
    assert_equal IGraph::LibIGraph::IGRAPH_SUCCESS, result

    # Check vertex count
    vcount = IGraph::LibIGraph.igraph_vcount(graph.pointer)
    assert_equal 4, vcount

    # Check edge count (should be 3 for a path with 4 vertices)
    ecount = IGraph::LibIGraph.igraph_ecount(graph.pointer)
    assert_equal 3, ecount

    # Clean up
    IGraph::LibIGraph.igraph_destroy(graph.pointer)
  end
end
