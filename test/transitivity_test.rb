require "test_helper"

class TransitivityTest < Test::Unit::TestCase
  def test_transitivity_functions_callable
    graph = IGraph::LibIGraph::Graph.new

    # Create a simple triangle graph for testing transitivity
    IGraph::LibIGraph.igraph_full(graph.pointer, 3, false, false)

    # Test igraph_transitivity_undirected can be called
    result_ptr = FFI::MemoryPointer.new(:double)
    result = IGraph::LibIGraph.igraph_transitivity_undirected(graph.pointer, result_ptr, 0)
    assert_equal IGraph::LibIGraph::IGRAPH_SUCCESS, result

    # Clean up
    IGraph::LibIGraph.igraph_destroy(graph.pointer)
  end
end
