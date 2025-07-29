require "test_helper"

class VectorTest < Test::Unit::TestCase
  test "vector operations" do
    vector = IGraph::LibIGraph::VectorInt.new

    # Initialize vector with size 3
    result = IGraph::LibIGraph.igraph_vector_int_init(vector.pointer, 3)
    assert_equal 0, result # IGRAPH_SUCCESS

    # Check size
    size = IGraph::LibIGraph.igraph_vector_int_size(vector.pointer)
    assert_equal 3, size

    # Set values
    IGraph::LibIGraph.igraph_vector_int_set(vector.pointer, 0, 10)
    IGraph::LibIGraph.igraph_vector_int_set(vector.pointer, 1, 20)
    IGraph::LibIGraph.igraph_vector_int_set(vector.pointer, 2, 30)

    # Get values
    val0 = IGraph::LibIGraph.igraph_vector_int_get(vector.pointer, 0)
    val1 = IGraph::LibIGraph.igraph_vector_int_get(vector.pointer, 1)
    val2 = IGraph::LibIGraph.igraph_vector_int_get(vector.pointer, 2)

    assert_equal 10, val0
    assert_equal 20, val1
    assert_equal 30, val2

    # Destroy vector
    IGraph::LibIGraph.igraph_vector_int_destroy(vector.pointer)
  end
end
