require "test_helper"

class StructuralTest < Test::Unit::TestCase
  test "tree and forest properties" do
    graph = IGraph::LibIGraph::Graph.new

    # Create a tree (star graph with 4 vertices)
    result = IGraph::LibIGraph.igraph_star(graph.pointer, 4, IGraph::LibIGraph::IGRAPH_STAR_UNDIRECTED, 0)
    assert_equal IGraph::LibIGraph::IGRAPH_SUCCESS, result

    # Test if it's a tree
    is_tree = FFI::MemoryPointer.new(:bool)
    root = FFI::MemoryPointer.new(:long_long)
    result = IGraph::LibIGraph.igraph_is_tree(graph.pointer, is_tree, root, IGraph::LibIGraph::IGRAPH_ALL)
    assert_equal IGraph::LibIGraph::IGRAPH_SUCCESS, result
    assert_equal true, is_tree.read_uchar != 0

    # Test if it's a forest
    is_forest = FFI::MemoryPointer.new(:bool)
    result = IGraph::LibIGraph.igraph_is_forest(graph.pointer, is_forest, nil, IGraph::LibIGraph::IGRAPH_ALL)
    assert_equal IGraph::LibIGraph::IGRAPH_SUCCESS, result
    assert_equal true, is_forest.read_uchar != 0

    # Test if it's acyclic
    is_acyclic = FFI::MemoryPointer.new(:bool)
    result = IGraph::LibIGraph.igraph_is_acyclic(graph.pointer, is_acyclic)
    assert_equal IGraph::LibIGraph::IGRAPH_SUCCESS, result
    assert_equal true, is_acyclic.read_uchar != 0

    # Clean up
    IGraph::LibIGraph.igraph_destroy(graph.pointer)
  end

  test "simple graph properties" do
    graph = IGraph::LibIGraph::Graph.new

    # Create a simple ring graph
    result = IGraph::LibIGraph.igraph_ring(graph.pointer, 4, false, false, true)
    assert_equal IGraph::LibIGraph::IGRAPH_SUCCESS, result

    # Test if it's simple (no loops or multiple edges)
    is_simple = FFI::MemoryPointer.new(:bool)
    result = IGraph::LibIGraph.igraph_is_simple(graph.pointer, is_simple)
    assert_equal IGraph::LibIGraph::IGRAPH_SUCCESS, result
    assert_equal true, is_simple.read_uchar != 0

    # Clean up
    IGraph::LibIGraph.igraph_destroy(graph.pointer)
  end

  test "graph measurements" do
    graph = IGraph::LibIGraph::Graph.new

    # Create a simple ring graph (which has cycles)
    result = IGraph::LibIGraph.igraph_ring(graph.pointer, 4, false, false, true)
    assert_equal IGraph::LibIGraph::IGRAPH_SUCCESS, result

    # Test girth (should be 4 for a 4-cycle)
    girth = FFI::MemoryPointer.new(:double)
    result = IGraph::LibIGraph.igraph_girth(graph.pointer, girth, nil)
    assert_equal IGraph::LibIGraph::IGRAPH_SUCCESS, result
    assert_equal 4.0, girth.read_double # 4-cycle has girth 4

    # Clean up
    IGraph::LibIGraph.igraph_destroy(graph.pointer)
  end

  test "graph connectivity" do
    graph = IGraph::LibIGraph::Graph.new

    # Create a connected graph (ring)
    result = IGraph::LibIGraph.igraph_ring(graph.pointer, 3, false, false, true)
    assert_equal IGraph::LibIGraph::IGRAPH_SUCCESS, result

    # Check if connected
    connected = FFI::MemoryPointer.new(:bool)
    result = IGraph::LibIGraph.igraph_is_connected(graph.pointer, connected, IGraph::LibIGraph::IGRAPH_WEAK)
    assert_equal IGraph::LibIGraph::IGRAPH_SUCCESS, result
    assert_equal true, connected.read_uchar != 0

    # Clean up
    IGraph::LibIGraph.igraph_destroy(graph.pointer)
  end

  test "complete graph properties" do
    graph = IGraph::LibIGraph::Graph.new

    # Create a complete graph
    result = IGraph::LibIGraph.igraph_full(graph.pointer, 4, false, false)
    assert_equal IGraph::LibIGraph::IGRAPH_SUCCESS, result

    # Test if it's complete
    is_complete = FFI::MemoryPointer.new(:bool)
    result = IGraph::LibIGraph.igraph_is_complete(graph.pointer, is_complete)
    assert_equal IGraph::LibIGraph::IGRAPH_SUCCESS, result
    assert_equal true, is_complete.read_uchar != 0

    # Test if it's simple
    is_simple = FFI::MemoryPointer.new(:bool)
    result = IGraph::LibIGraph.igraph_is_simple(graph.pointer, is_simple)
    assert_equal IGraph::LibIGraph::IGRAPH_SUCCESS, result
    assert_equal true, is_simple.read_uchar != 0

    # Clean up
    IGraph::LibIGraph.igraph_destroy(graph.pointer)
  end

  test "graph density calculation" do
    graph = IGraph::LibIGraph::Graph.new

    # Create a complete graph with 4 vertices
    result = IGraph::LibIGraph.igraph_full(graph.pointer, 4, false, false)
    assert_equal IGraph::LibIGraph::IGRAPH_SUCCESS, result

    # Calculate density (should be 1.0 for complete graph)
    density = FFI::MemoryPointer.new(:double)
    result = IGraph::LibIGraph.igraph_density(graph.pointer, density, false)
    assert_equal IGraph::LibIGraph::IGRAPH_SUCCESS, result
    assert_equal 1.0, density.read_double

    # Clean up
    IGraph::LibIGraph.igraph_destroy(graph.pointer)
  end
end
