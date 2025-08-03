require "test_helper"

class ConstantsTest < Test::Unit::TestCase
  def test_basic_constants_defined
    # Test that basic igraph constants are defined
    assert_kind_of Integer, IGraph::LibIGraph::IGRAPH_SUCCESS
    assert_kind_of Integer, IGraph::LibIGraph::IGRAPH_FAILURE
    assert_kind_of Integer, IGraph::LibIGraph::IGRAPH_ALL
    assert_kind_of Integer, IGraph::LibIGraph::IGRAPH_OUT
    assert_kind_of Integer, IGraph::LibIGraph::IGRAPH_IN
  end

  def test_graph_type_constants
    # Test graph type constants
    assert_kind_of Integer, IGraph::LibIGraph::IGRAPH_UNDIRECTED
    assert_kind_of Integer, IGraph::LibIGraph::IGRAPH_DIRECTED
  end
end
