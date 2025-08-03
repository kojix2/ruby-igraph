require "test_helper"

class OperatorsTest < Test::Unit::TestCase
  def test_operators_functions_callable
    graph1 = IGraph::LibIGraph::Graph.new
    graph2 = IGraph::LibIGraph::Graph.new
    result_graph = IGraph::LibIGraph::Graph.new

    # Create simple graphs for testing
    IGraph::LibIGraph.igraph_empty(graph1.pointer, 2, false)
    IGraph::LibIGraph.igraph_empty(graph2.pointer, 2, false)

    # Test igraph_union can be called
    result = IGraph::LibIGraph.igraph_union(result_graph.pointer, graph1.pointer, graph2.pointer, nil, nil)
    assert_equal IGraph::LibIGraph::IGRAPH_SUCCESS, result

    # Clean up
    IGraph::LibIGraph.igraph_destroy(graph1.pointer)
    IGraph::LibIGraph.igraph_destroy(graph2.pointer)
    IGraph::LibIGraph.igraph_destroy(result_graph.pointer)
  end
end
