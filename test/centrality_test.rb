require "test_helper"

class CentralityTest < Test::Unit::TestCase
  def test_centrality_functions_available
    # Test that centrality functions are available
    assert_respond_to IGraph::LibIGraph, :igraph_betweenness
    assert_respond_to IGraph::LibIGraph, :igraph_closeness
    assert_respond_to IGraph::LibIGraph, :igraph_eigenvector_centrality
    assert_respond_to IGraph::LibIGraph, :igraph_harmonic_centrality
    assert_respond_to IGraph::LibIGraph, :igraph_hub_score
    assert_respond_to IGraph::LibIGraph, :igraph_authority_score
  end

  def test_pagerank_available
    # Test that pagerank function is available
    assert_respond_to IGraph::LibIGraph, :igraph_pagerank
  end
end
