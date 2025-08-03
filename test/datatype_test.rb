require "test_helper"

class DatatypeTest < Test::Unit::TestCase
  def test_vector_int_operations
    vector = IGraph::LibIGraph::VectorIntStruct.new

    # Initialize vector with size 3
    result = IGraph::LibIGraph.igraph_vector_int_init(vector.pointer, 3)
    assert_equal IGraph::LibIGraph::IGRAPH_SUCCESS, result

    # Set values
    IGraph::LibIGraph.igraph_vector_int_set(vector.pointer, 0, 10)
    IGraph::LibIGraph.igraph_vector_int_set(vector.pointer, 1, 20)
    IGraph::LibIGraph.igraph_vector_int_set(vector.pointer, 2, 30)

    # Get values
    assert_equal 10, IGraph::LibIGraph.igraph_vector_int_get(vector.pointer, 0)
    assert_equal 20, IGraph::LibIGraph.igraph_vector_int_get(vector.pointer, 1)
    assert_equal 30, IGraph::LibIGraph.igraph_vector_int_get(vector.pointer, 2)

    # Check size
    assert_equal 3, IGraph::LibIGraph.igraph_vector_int_size(vector.pointer)

    # Clean up
    IGraph::LibIGraph.igraph_vector_int_destroy(vector.pointer)
  end

  def test_vector_double_operations
    vector = IGraph::LibIGraph::VectorStruct.new

    # Initialize vector with size 2
    result = IGraph::LibIGraph.igraph_vector_init(vector.pointer, 2)
    assert_equal IGraph::LibIGraph::IGRAPH_SUCCESS, result

    # Set values
    IGraph::LibIGraph.igraph_vector_set(vector.pointer, 0, 1.5)
    IGraph::LibIGraph.igraph_vector_set(vector.pointer, 1, 2.5)

    # Get values
    assert_in_delta 1.5, IGraph::LibIGraph.igraph_vector_get(vector.pointer, 0), 0.001
    assert_in_delta 2.5, IGraph::LibIGraph.igraph_vector_get(vector.pointer, 1), 0.001

    # Check size
    assert_equal 2, IGraph::LibIGraph.igraph_vector_size(vector.pointer)

    # Clean up
    IGraph::LibIGraph.igraph_vector_destroy(vector.pointer)
  end

  def test_vertex_selector_operations
    vs = IGraph::LibIGraph::VertexSelector.new

    # Create selector for all vertices
    result = IGraph::LibIGraph.igraph_vs_all(vs.pointer)
    assert_equal IGraph::LibIGraph::IGRAPH_SUCCESS, result

    # Clean up
    IGraph::LibIGraph.igraph_vs_destroy(vs.pointer)
  end
end
