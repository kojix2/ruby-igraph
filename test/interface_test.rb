require "test_helper"

class InterfaceTest < Test::Unit::TestCase
  test "empty graph creation" do
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

  test "graph creation from edge list" do
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

    # Check vertex count
    vcount = IGraph::LibIGraph.igraph_vcount(graph.pointer)
    assert_equal 3, vcount

    # Check edge count
    ecount = IGraph::LibIGraph.igraph_ecount(graph.pointer)
    assert_equal 2, ecount

    # Clean up
    IGraph::LibIGraph.igraph_vector_int_destroy(edges.pointer)
    IGraph::LibIGraph.igraph_destroy(graph.pointer)
  end

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

  test "degree calculation" do
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

    # Calculate degrees for all vertices
    degrees = IGraph::LibIGraph::VectorIntStruct.new
    result = IGraph::LibIGraph.igraph_vector_int_init(degrees.pointer, 0)
    assert_equal IGraph::LibIGraph::IGRAPH_SUCCESS, result

    # Create vertex selector for all vertices
    vs_all = IGraph::LibIGraph::VertexSelector.new
    result = IGraph::LibIGraph.igraph_vs_all(vs_all.pointer)
    assert_equal IGraph::LibIGraph::IGRAPH_SUCCESS, result

    result = IGraph::LibIGraph.igraph_degree(graph.pointer, degrees.pointer, vs_all,
                                             IGraph::LibIGraph::IGRAPH_ALL, false)
    assert_equal IGraph::LibIGraph::IGRAPH_SUCCESS, result

    # Check degrees: vertex 0 and 2 should have degree 1, vertex 1 should have degree 2
    size = IGraph::LibIGraph.igraph_vector_int_size(degrees.pointer)
    assert_equal 3, size

    # Clean up
    IGraph::LibIGraph.igraph_vs_destroy(vs_all.pointer)
    IGraph::LibIGraph.igraph_vector_int_destroy(degrees.pointer)
    IGraph::LibIGraph.igraph_vector_int_destroy(edges.pointer)
    IGraph::LibIGraph.igraph_destroy(graph.pointer)
  end

  test "new interface functions callable" do
    graph = IGraph::LibIGraph::Graph.new

    # Create a simple graph with edges
    edges = IGraph::LibIGraph::VectorIntStruct.new
    IGraph::LibIGraph.igraph_vector_int_init(edges.pointer, 4)
    IGraph::LibIGraph.igraph_vector_int_set(edges.pointer, 0, 0)
    IGraph::LibIGraph.igraph_vector_int_set(edges.pointer, 1, 1)
    IGraph::LibIGraph.igraph_vector_int_set(edges.pointer, 2, 1)
    IGraph::LibIGraph.igraph_vector_int_set(edges.pointer, 3, 2)
    IGraph::LibIGraph.igraph_create(graph.pointer, edges.pointer, 3, false)

    # Test igraph_get_eid can be called
    eid_ptr = FFI::MemoryPointer.new(:int)
    result = IGraph::LibIGraph.igraph_get_eid(graph.pointer, eid_ptr, 0, 1, false, false)
    assert_equal IGraph::LibIGraph::IGRAPH_SUCCESS, result

    # Clean up
    IGraph::LibIGraph.igraph_vector_int_destroy(edges.pointer)
    IGraph::LibIGraph.igraph_destroy(graph.pointer)
  end
end
