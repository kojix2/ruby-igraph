require "test_helper"

class VectorTest < Test::Unit::TestCase
  test "integer vector operations" do
    vector = IGraph::LibIGraph::VectorInt.new

    # Initialize vector with size 3
    result = IGraph::LibIGraph.igraph_vector_int_init(vector.pointer, 3)
    assert_equal IGraph::LibIGraph::IGRAPH_SUCCESS, result

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

  test "double vector operations" do
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

  test "boolean vector operations" do
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
