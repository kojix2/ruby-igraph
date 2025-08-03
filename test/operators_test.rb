require "test_helper"

class OperatorsTest < Test::Unit::TestCase
  def test_operators_functions_available
    # Test that operator functions are available
    assert_respond_to IGraph::LibIGraph, :igraph_union
    assert_respond_to IGraph::LibIGraph, :igraph_intersection
    assert_respond_to IGraph::LibIGraph, :igraph_difference
    assert_respond_to IGraph::LibIGraph, :igraph_complementer
    assert_respond_to IGraph::LibIGraph, :igraph_disjoint_union
  end
end
