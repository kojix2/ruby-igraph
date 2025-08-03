require "test_helper"

class TopologyTest < Test::Unit::TestCase
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

  test "topological sorting of star graph" do
    graph = IGraph::LibIGraph::Graph.new

    # Create a directed star graph (DAG)
    result = IGraph::LibIGraph.igraph_star(graph.pointer, 4, IGraph::LibIGraph::IGRAPH_STAR_OUT, 0)
    assert_equal IGraph::LibIGraph::IGRAPH_SUCCESS, result

    # Perform topological sorting
    topo_order = IGraph::LibIGraph::VectorIntStruct.new
    result = IGraph::LibIGraph.igraph_vector_int_init(topo_order.pointer, 0)
    assert_equal IGraph::LibIGraph::IGRAPH_SUCCESS, result

    result = IGraph::LibIGraph.igraph_topological_sorting(graph.pointer, topo_order.pointer, IGraph::LibIGraph::IGRAPH_OUT)
    assert_equal IGraph::LibIGraph::IGRAPH_SUCCESS, result

    # Check that we got a valid topological order
    size = IGraph::LibIGraph.igraph_vector_int_size(topo_order.pointer)
    assert_equal 4, size

    # Clean up
    IGraph::LibIGraph.igraph_vector_int_destroy(topo_order.pointer)
    IGraph::LibIGraph.igraph_destroy(graph.pointer)
  end

  test "graph isomorphism - identical graphs" do
    graph1 = IGraph::LibIGraph::Graph.new
    graph2 = IGraph::LibIGraph::Graph.new

    # Create two identical star graphs
    result1 = IGraph::LibIGraph.igraph_star(graph1.pointer, 4, IGraph::LibIGraph::IGRAPH_STAR_UNDIRECTED, 0)
    assert_equal IGraph::LibIGraph::IGRAPH_SUCCESS, result1

    result2 = IGraph::LibIGraph.igraph_star(graph2.pointer, 4, IGraph::LibIGraph::IGRAPH_STAR_UNDIRECTED, 0)
    assert_equal IGraph::LibIGraph::IGRAPH_SUCCESS, result2

    # Test isomorphism
    iso = FFI::MemoryPointer.new(:bool)
    result = IGraph::LibIGraph.igraph_isomorphic(graph1.pointer, graph2.pointer, iso)
    assert_equal IGraph::LibIGraph::IGRAPH_SUCCESS, result
    assert_equal true, iso.read_uchar != 0

    # Clean up
    IGraph::LibIGraph.igraph_destroy(graph1.pointer)
    IGraph::LibIGraph.igraph_destroy(graph2.pointer)
  end

  test "graph isomorphism - different graphs" do
    graph1 = IGraph::LibIGraph::Graph.new
    graph2 = IGraph::LibIGraph::Graph.new

    # Create different graphs: star vs ring
    result1 = IGraph::LibIGraph.igraph_star(graph1.pointer, 4, IGraph::LibIGraph::IGRAPH_STAR_UNDIRECTED, 0)
    assert_equal IGraph::LibIGraph::IGRAPH_SUCCESS, result1

    result2 = IGraph::LibIGraph.igraph_ring(graph2.pointer, 4, false, false, true)
    assert_equal IGraph::LibIGraph::IGRAPH_SUCCESS, result2

    # Test isomorphism (should be false)
    iso = FFI::MemoryPointer.new(:bool)
    result = IGraph::LibIGraph.igraph_isomorphic(graph1.pointer, graph2.pointer, iso)
    assert_equal IGraph::LibIGraph::IGRAPH_SUCCESS, result
    assert_equal false, iso.read_uchar != 0

    # Clean up
    IGraph::LibIGraph.igraph_destroy(graph1.pointer)
    IGraph::LibIGraph.igraph_destroy(graph2.pointer)
  end

  test "graph isomorphism - different sizes" do
    graph1 = IGraph::LibIGraph::Graph.new
    graph2 = IGraph::LibIGraph::Graph.new

    # Create graphs with different sizes
    result1 = IGraph::LibIGraph.igraph_star(graph1.pointer, 4, IGraph::LibIGraph::IGRAPH_STAR_UNDIRECTED, 0)
    assert_equal IGraph::LibIGraph::IGRAPH_SUCCESS, result1

    result2 = IGraph::LibIGraph.igraph_star(graph2.pointer, 5, IGraph::LibIGraph::IGRAPH_STAR_UNDIRECTED, 0)
    assert_equal IGraph::LibIGraph::IGRAPH_SUCCESS, result2

    # Test isomorphism (should be false)
    iso = FFI::MemoryPointer.new(:bool)
    result = IGraph::LibIGraph.igraph_isomorphic(graph1.pointer, graph2.pointer, iso)
    assert_equal IGraph::LibIGraph::IGRAPH_SUCCESS, result
    assert_equal false, iso.read_uchar != 0

    # Clean up
    IGraph::LibIGraph.igraph_destroy(graph1.pointer)
    IGraph::LibIGraph.igraph_destroy(graph2.pointer)
  end
end
