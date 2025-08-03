require "test_helper"

class GraphTheoryTest < Test::Unit::TestCase
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

  test "topological sorting" do
    graph = IGraph::LibIGraph::Graph.new

    # Create a simple DAG: 0->1->2
    edges = IGraph::LibIGraph::VectorIntStruct.new
    result = IGraph::LibIGraph.igraph_vector_int_init(edges.pointer, 4)
    assert_equal IGraph::LibIGraph::IGRAPH_SUCCESS, result

    # Set edges: 0->1, 1->2
    IGraph::LibIGraph.igraph_vector_int_set(edges.pointer, 0, 0)
    IGraph::LibIGraph.igraph_vector_int_set(edges.pointer, 1, 1)
    IGraph::LibIGraph.igraph_vector_int_set(edges.pointer, 2, 1)
    IGraph::LibIGraph.igraph_vector_int_set(edges.pointer, 3, 2)

    # Create directed graph
    result = IGraph::LibIGraph.igraph_create(graph.pointer, edges.pointer, 3, true)
    assert_equal IGraph::LibIGraph::IGRAPH_SUCCESS, result

    # Perform topological sorting
    topo_order = IGraph::LibIGraph::VectorIntStruct.new
    result = IGraph::LibIGraph.igraph_vector_int_init(topo_order.pointer, 0)
    assert_equal IGraph::LibIGraph::IGRAPH_SUCCESS, result

    result = IGraph::LibIGraph.igraph_topological_sorting(graph.pointer, topo_order.pointer, IGraph::LibIGraph::IGRAPH_OUT)
    assert_equal IGraph::LibIGraph::IGRAPH_SUCCESS, result

    # Check that we got a valid topological order
    size = IGraph::LibIGraph.igraph_vector_int_size(topo_order.pointer)
    assert_equal 3, size

    # Clean up
    IGraph::LibIGraph.igraph_vector_int_destroy(topo_order.pointer)
    IGraph::LibIGraph.igraph_vector_int_destroy(edges.pointer)
    IGraph::LibIGraph.igraph_destroy(graph.pointer)
  end
end
