require "test_helper"

class HighLevelErrorTest < Test::Unit::TestCase
  test "error handler is set up" do
    # Just verify the module methods exist
    assert_respond_to IGraph, :setup_error_handler
    assert_respond_to IGraph, :check_error
  end

  test "check_error passes on success" do
    # IGRAPH_SUCCESS = 0
    assert_nothing_raised do
      IGraph.check_error(0)
    end
  end

  test "check_error raises on failure" do
    assert_raise(IGraph::RuntimeError) do
      IGraph.check_error(1) # IGRAPH_FAILURE
    end
  end

  test "error subclasses exist" do
    assert_equal true, IGraph::RuntimeError < IGraph::Error
    assert_equal true, IGraph::ArgumentError < IGraph::Error
    assert_equal true, IGraph::NoMemoryError < IGraph::Error
    assert_equal true, IGraph::IOError < IGraph::Error
  end
end
