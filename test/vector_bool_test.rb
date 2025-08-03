require "test_helper"

class VectorBoolTest < Test::Unit::TestCase
  test "vector bool operations" do
    vector = IGraph::LibIGraph::VectorBoolStruct.new

    # Initialize vector with size 3
    result = IGraph::LibIGraph.igraph_vector_bool_init(vector.pointer, 3)
    assert_equal IGraph::LibIGraph::IGRAPH_SUCCESS, result

    # Check size
    size = IGraph::LibIGraph.igraph_vector_bool_size(vector.pointer)
    assert_equal 3, size

    # Set values
    IGraph::LibIGraph.igraph_vector_bool_set(vector.pointer, 0, true)
    IGraph::LibIGraph.igraph_vector_bool_set(vector.pointer, 1, false)
    IGraph::LibIGraph.igraph_vector_bool_set(vector.pointer, 2, true)

    # Get values
    val0 = IGraph::LibIGraph.igraph_vector_bool_get(vector.pointer, 0)
    val1 = IGraph::LibIGraph.igraph_vector_bool_get(vector.pointer, 1)
    val2 = IGraph::LibIGraph.igraph_vector_bool_get(vector.pointer, 2)

    assert_equal true, val0
    assert_equal false, val1
    assert_equal true, val2

    # Destroy vector
    IGraph::LibIGraph.igraph_vector_bool_destroy(vector.pointer)
  end
end
