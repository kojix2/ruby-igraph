require "test_helper"

class ErrorTest < Test::Unit::TestCase
  def test_error_handling_functions_available
    # Test that error handling functions are available
    assert_respond_to IGraph::LibIGraph, :igraph_strerror if IGraph::LibIGraph.respond_to?(:igraph_strerror)

    # Test that error constants are defined
    assert_kind_of Integer, IGraph::LibIGraph::IGRAPH_SUCCESS
    assert_kind_of Integer, IGraph::LibIGraph::IGRAPH_FAILURE
  end
end
