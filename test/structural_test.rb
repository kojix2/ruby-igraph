require "test_helper"

class StructuralTest < Test::Unit::TestCase
  test "graph density" do
    graph = IGraph::LibIGraph::Graph.new

    # Create complete graph with 4 vertices
    result = IGraph::LibIGraph.igraph_full(graph.pointer, 4, false, false)
    assert_equal IGraph::LibIGraph::IGRAPH_SUCCESS, result

    # Calculate density
    density_ptr = FFI::MemoryPointer.new(:double)
    result = IGraph::LibIGraph.igraph_density(graph.pointer, density_ptr, false)
    assert_equal IGraph::LibIGraph::IGRAPH_SUCCESS, result

    density = density_ptr.read_double
    assert_in_delta 1.0, density, 0.001 # Complete graph has density 1.0

    IGraph::LibIGraph.igraph_destroy(graph.pointer)
  end

  test "graph properties" do
    graph = IGraph::LibIGraph::Graph.new

    # Create empty graph with 3 vertices
    result = IGraph::LibIGraph.igraph_empty(graph.pointer, 3, false)
    assert_equal IGraph::LibIGraph::IGRAPH_SUCCESS, result

    # Check if simple (no loops, no multiple edges)
    is_simple_ptr = FFI::MemoryPointer.new(:bool)
    result = IGraph::LibIGraph.igraph_is_simple(graph.pointer, is_simple_ptr)
    assert_equal IGraph::LibIGraph::IGRAPH_SUCCESS, result
    assert_equal true, is_simple_ptr.read_uchar != 0

    # Check if has loops
    has_loop_ptr = FFI::MemoryPointer.new(:bool)
    result = IGraph::LibIGraph.igraph_has_loop(graph.pointer, has_loop_ptr)
    assert_equal IGraph::LibIGraph::IGRAPH_SUCCESS, result
    assert_equal false, has_loop_ptr.read_uchar != 0

    # Check if has multiple edges
    has_multiple_ptr = FFI::MemoryPointer.new(:bool)
    result = IGraph::LibIGraph.igraph_has_multiple(graph.pointer, has_multiple_ptr)
    assert_equal IGraph::LibIGraph::IGRAPH_SUCCESS, result
    assert_equal false, has_multiple_ptr.read_uchar != 0

    IGraph::LibIGraph.igraph_destroy(graph.pointer)
  end

  test "vertex adjacency" do
    graph = IGraph::LibIGraph::Graph.new

    # Create path graph: 0-1-2
    edges = IGraph::LibIGraph::VectorInt.new
    IGraph::LibIGraph.igraph_vector_int_init(edges.pointer, 4)
    IGraph::LibIGraph.igraph_vector_int_set(edges.pointer, 0, 0)
    IGraph::LibIGraph.igraph_vector_int_set(edges.pointer, 1, 1)
    IGraph::LibIGraph.igraph_vector_int_set(edges.pointer, 2, 1)
    IGraph::LibIGraph.igraph_vector_int_set(edges.pointer, 3, 2)

    result = IGraph::LibIGraph.igraph_create(graph.pointer, edges.pointer, 3, false)
    assert_equal IGraph::LibIGraph::IGRAPH_SUCCESS, result

    # Check adjacency
    adjacent_ptr = FFI::MemoryPointer.new(:bool)

    # 0 and 1 are adjacent
    result = IGraph::LibIGraph.igraph_are_adjacent(graph.pointer, 0, 1, adjacent_ptr)
    assert_equal IGraph::LibIGraph::IGRAPH_SUCCESS, result
    assert_equal true, adjacent_ptr.read_uchar != 0

    # 0 and 2 are not adjacent
    result = IGraph::LibIGraph.igraph_are_adjacent(graph.pointer, 0, 2, adjacent_ptr)
    assert_equal IGraph::LibIGraph::IGRAPH_SUCCESS, result
    assert_equal false, adjacent_ptr.read_uchar != 0

    IGraph::LibIGraph.igraph_destroy(graph.pointer)
    IGraph::LibIGraph.igraph_vector_int_destroy(edges.pointer)
  end
end
