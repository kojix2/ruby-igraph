require "test_helper"

class GraphAlgorithmsTest < Test::Unit::TestCase
  test "neighbors function" do
    graph = IGraph::LibIGraph::Graph.new

    # Create a simple graph: 0-1-2
    edges = IGraph::LibIGraph::VectorIntStruct.new
    result = IGraph::LibIGraph.igraph_vector_int_init(edges.pointer, 4)
    assert_equal IGraph::LibIGraph::IGRAPH_SUCCESS, result

    # Set edges: 0->1, 1->2
    IGraph::LibIGraph.igraph_vector_int_set(edges.pointer, 0, 0)
    IGraph::LibIGraph.igraph_vector_int_set(edges.pointer, 1, 1)
    IGraph::LibIGraph.igraph_vector_int_set(edges.pointer, 2, 1)
    IGraph::LibIGraph.igraph_vector_int_set(edges.pointer, 3, 2)

    # Create graph
    result = IGraph::LibIGraph.igraph_create(graph.pointer, edges.pointer, 3, false)
    assert_equal IGraph::LibIGraph::IGRAPH_SUCCESS, result

    # Get neighbors of vertex 1
    neighbors = IGraph::LibIGraph::VectorIntStruct.new
    result = IGraph::LibIGraph.igraph_vector_int_init(neighbors.pointer, 0)
    assert_equal IGraph::LibIGraph::IGRAPH_SUCCESS, result

    result = IGraph::LibIGraph.igraph_neighbors(graph.pointer, neighbors.pointer, 1, IGraph::LibIGraph::IGRAPH_ALL)
    assert_equal IGraph::LibIGraph::IGRAPH_SUCCESS, result

    # Vertex 1 should have 2 neighbors: 0 and 2
    size = IGraph::LibIGraph.igraph_vector_int_size(neighbors.pointer)
    assert_equal 2, size

    # Clean up
    IGraph::LibIGraph.igraph_vector_int_destroy(neighbors.pointer)
    IGraph::LibIGraph.igraph_vector_int_destroy(edges.pointer)
    IGraph::LibIGraph.igraph_destroy(graph.pointer)
  end

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
end
