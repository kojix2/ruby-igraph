require "test_helper"

class VectorDoubleTest < Test::Unit::TestCase
  test "vector double operations" do
    vector = IGraph::LibIGraph::VectorStruct.new

    # Initialize vector with size 3
    result = IGraph::LibIGraph.igraph_vector_init(vector.pointer, 3)
    assert_equal IGraph::LibIGraph::IGRAPH_SUCCESS, result

    # Check size
    size = IGraph::LibIGraph.igraph_vector_size(vector.pointer)
    assert_equal 3, size

    # Set values
    IGraph::LibIGraph.igraph_vector_set(vector.pointer, 0, 1.5)
    IGraph::LibIGraph.igraph_vector_set(vector.pointer, 1, 2.7)
    IGraph::LibIGraph.igraph_vector_set(vector.pointer, 2, 3.14)

    # Get values
    val0 = IGraph::LibIGraph.igraph_vector_get(vector.pointer, 0)
    val1 = IGraph::LibIGraph.igraph_vector_get(vector.pointer, 1)
    val2 = IGraph::LibIGraph.igraph_vector_get(vector.pointer, 2)

    assert_equal 1.5, val0
    assert_equal 2.7, val1
    assert_equal 3.14, val2

    # Destroy vector
    IGraph::LibIGraph.igraph_vector_destroy(vector.pointer)
  end
end
