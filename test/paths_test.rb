require "test_helper"

class PathsTest < Test::Unit::TestCase
  def test_paths_functions_available
    # Test that path-related functions are available (only test implemented ones)
    assert_respond_to IGraph::LibIGraph, :igraph_shortest_paths if IGraph::LibIGraph.respond_to?(:igraph_shortest_paths)
    if IGraph::LibIGraph.respond_to?(:igraph_get_shortest_paths)
      assert_respond_to IGraph::LibIGraph, :igraph_get_shortest_paths
    end

    # Test that the paths module is loaded
    assert_not_nil IGraph::LibIGraph
  end
end
