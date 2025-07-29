require "test_helper"

class MatrixTest < Test::Unit::TestCase
  test "matrix operations" do
    matrix = IGraph::LibIGraph::Matrix.new

    # Initialize matrix with 2x3 dimensions
    result = IGraph::LibIGraph.igraph_matrix_init(matrix.pointer, 2, 3)
    assert_equal IGraph::LibIGraph::IGRAPH_SUCCESS, result

    # Check dimensions
    nrow = IGraph::LibIGraph.igraph_matrix_nrow(matrix.pointer)
    ncol = IGraph::LibIGraph.igraph_matrix_ncol(matrix.pointer)
    assert_equal 2, nrow
    assert_equal 3, ncol

    # Set values
    IGraph::LibIGraph.igraph_matrix_set(matrix.pointer, 0, 0, 1.0)
    IGraph::LibIGraph.igraph_matrix_set(matrix.pointer, 0, 1, 2.0)
    IGraph::LibIGraph.igraph_matrix_set(matrix.pointer, 0, 2, 3.0)
    IGraph::LibIGraph.igraph_matrix_set(matrix.pointer, 1, 0, 4.0)
    IGraph::LibIGraph.igraph_matrix_set(matrix.pointer, 1, 1, 5.0)
    IGraph::LibIGraph.igraph_matrix_set(matrix.pointer, 1, 2, 6.0)

    # Get values
    val00 = IGraph::LibIGraph.igraph_matrix_get(matrix.pointer, 0, 0)
    val01 = IGraph::LibIGraph.igraph_matrix_get(matrix.pointer, 0, 1)
    val02 = IGraph::LibIGraph.igraph_matrix_get(matrix.pointer, 0, 2)
    val10 = IGraph::LibIGraph.igraph_matrix_get(matrix.pointer, 1, 0)
    val11 = IGraph::LibIGraph.igraph_matrix_get(matrix.pointer, 1, 1)
    val12 = IGraph::LibIGraph.igraph_matrix_get(matrix.pointer, 1, 2)

    assert_equal 1.0, val00
    assert_equal 2.0, val01
    assert_equal 3.0, val02
    assert_equal 4.0, val10
    assert_equal 5.0, val11
    assert_equal 6.0, val12

    # Fill with constant value
    IGraph::LibIGraph.igraph_matrix_fill(matrix.pointer, 9.0)
    filled_val = IGraph::LibIGraph.igraph_matrix_get(matrix.pointer, 0, 0)
    assert_equal 9.0, filled_val

    # Destroy matrix
    IGraph::LibIGraph.igraph_matrix_destroy(matrix.pointer)
  end
end
