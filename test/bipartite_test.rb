require "test_helper"

class BipartiteTest < Test::Unit::TestCase
  test "bipartite graph detection" do
    graph = IGraph::LibIGraph::Graph.new

    # Create a star graph (which is bipartite)
    result = IGraph::LibIGraph.igraph_star(graph.pointer, 4, IGraph::LibIGraph::IGRAPH_STAR_UNDIRECTED, 0)
    assert_equal IGraph::LibIGraph::IGRAPH_SUCCESS, result

    # Test if it's bipartite
    is_bipartite = FFI::MemoryPointer.new(:bool)
    result = IGraph::LibIGraph.igraph_is_bipartite(graph.pointer, is_bipartite, nil)
    assert_equal IGraph::LibIGraph::IGRAPH_SUCCESS, result
    assert_equal true, is_bipartite.read_uchar != 0

    # Clean up
    IGraph::LibIGraph.igraph_destroy(graph.pointer)
  end

  test "non-bipartite graph detection" do
    graph = IGraph::LibIGraph::Graph.new

    # Create a triangle (which is not bipartite)
    result = IGraph::LibIGraph.igraph_full(graph.pointer, 3, false, false)
    assert_equal IGraph::LibIGraph::IGRAPH_SUCCESS, result

    # Test if it's bipartite (should be false)
    is_bipartite = FFI::MemoryPointer.new(:bool)
    result = IGraph::LibIGraph.igraph_is_bipartite(graph.pointer, is_bipartite, nil)
    assert_equal IGraph::LibIGraph::IGRAPH_SUCCESS, result
    assert_equal false, is_bipartite.read_uchar != 0

    # Clean up
    IGraph::LibIGraph.igraph_destroy(graph.pointer)
  end

  test "path graph bipartite detection" do
    graph = IGraph::LibIGraph::Graph.new

    # Create a path graph (which is bipartite)
    result = IGraph::LibIGraph.igraph_ring(graph.pointer, 4, false, false, false)
    assert_equal IGraph::LibIGraph::IGRAPH_SUCCESS, result

    # Test if it's bipartite
    is_bipartite = FFI::MemoryPointer.new(:bool)
    result = IGraph::LibIGraph.igraph_is_bipartite(graph.pointer, is_bipartite, nil)
    assert_equal IGraph::LibIGraph::IGRAPH_SUCCESS, result
    assert_equal true, is_bipartite.read_uchar != 0

    # Clean up
    IGraph::LibIGraph.igraph_destroy(graph.pointer)
  end

  test "even cycle bipartite detection" do
    graph = IGraph::LibIGraph::Graph.new

    # Create an even cycle (which is bipartite)
    result = IGraph::LibIGraph.igraph_ring(graph.pointer, 4, false, false, true)
    assert_equal IGraph::LibIGraph::IGRAPH_SUCCESS, result

    # Test if it's bipartite
    is_bipartite = FFI::MemoryPointer.new(:bool)
    result = IGraph::LibIGraph.igraph_is_bipartite(graph.pointer, is_bipartite, nil)
    assert_equal IGraph::LibIGraph::IGRAPH_SUCCESS, result
    assert_equal true, is_bipartite.read_uchar != 0

    # Clean up
    IGraph::LibIGraph.igraph_destroy(graph.pointer)
  end

  test "odd cycle bipartite detection" do
    graph = IGraph::LibIGraph::Graph.new

    # Create an odd cycle (which is not bipartite)
    result = IGraph::LibIGraph.igraph_ring(graph.pointer, 3, false, false, true)
    assert_equal IGraph::LibIGraph::IGRAPH_SUCCESS, result

    # Test if it's bipartite (should be false)
    is_bipartite = FFI::MemoryPointer.new(:bool)
    result = IGraph::LibIGraph.igraph_is_bipartite(graph.pointer, is_bipartite, nil)
    assert_equal IGraph::LibIGraph::IGRAPH_SUCCESS, result
    assert_equal false, is_bipartite.read_uchar != 0

    # Clean up
    IGraph::LibIGraph.igraph_destroy(graph.pointer)
  end
end
