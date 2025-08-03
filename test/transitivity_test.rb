require "test_helper"

class TransitivityTest < Test::Unit::TestCase
  def test_transitivity_functions_available
    # Test that transitivity functions are available
    assert_respond_to IGraph::LibIGraph, :igraph_transitivity_undirected
    assert_respond_to IGraph::LibIGraph, :igraph_transitivity_local_undirected
    assert_respond_to IGraph::LibIGraph, :igraph_transitivity_avglocal_undirected
    assert_respond_to IGraph::LibIGraph, :igraph_transitivity_barrat
  end
end
