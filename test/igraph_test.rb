require "test_helper"

class IGraphTest < Test::Unit::TestCase
  test "VERSION" do
    assert do
      ::IGraph.const_defined?(:VERSION)
    end
  end

  test "get igraph version" do
    str_p = FFI::MemoryPointer.new(:pointer)
    major = FFI::MemoryPointer.new(:int)
    minor = FFI::MemoryPointer.new(:int)
    patch = FFI::MemoryPointer.new(:int)

    IGraph::LibIGraph.igraph_version(
      str_p,
      major,
      minor,
      patch
    )

    version_str = str_p.read_pointer.read_string
    major_val, minor_val, patch_val = version_str.split(".").map(&:to_i)
    assert_equal major_val, major.read_int
    assert_equal minor_val, minor.read_int
    assert_equal patch_val, patch.read_int
  end

  test "create empty graph" do
    graph = IGraph::LibIGraph::Graph.new

    # Create empty graph with 5 vertices, undirected
    result = IGraph::LibIGraph.igraph_empty(graph.pointer, 5, false)
    assert_equal 0, result # IGRAPH_SUCCESS

    # Check vertex count
    vcount = IGraph::LibIGraph.igraph_vcount(graph.pointer)
    assert_equal 5, vcount

    # Check edge count
    ecount = IGraph::LibIGraph.igraph_ecount(graph.pointer)
    assert_equal 0, ecount

    # Check if directed
    directed = IGraph::LibIGraph.igraph_is_directed(graph.pointer)
    assert_equal false, directed # false (undirected)

    # Destroy graph
    IGraph::LibIGraph.igraph_destroy(graph.pointer)
  end

  test "vector operations" do
    vector = IGraph::LibIGraph::VectorInt.new

    # Initialize vector with size 3
    result = IGraph::LibIGraph.igraph_vector_int_init(vector.pointer, 3)
    assert_equal 0, result # IGRAPH_SUCCESS

    # Check size
    size = IGraph::LibIGraph.igraph_vector_int_size(vector.pointer)
    assert_equal 3, size

    # Set values
    IGraph::LibIGraph.igraph_vector_int_set(vector.pointer, 0, 10)
    IGraph::LibIGraph.igraph_vector_int_set(vector.pointer, 1, 20)
    IGraph::LibIGraph.igraph_vector_int_set(vector.pointer, 2, 30)

    # Get values
    val0 = IGraph::LibIGraph.igraph_vector_int_get(vector.pointer, 0)
    val1 = IGraph::LibIGraph.igraph_vector_int_get(vector.pointer, 1)
    val2 = IGraph::LibIGraph.igraph_vector_int_get(vector.pointer, 2)

    assert_equal 10, val0
    assert_equal 20, val1
    assert_equal 30, val2

    # Destroy vector
    IGraph::LibIGraph.igraph_vector_int_destroy(vector.pointer)
  end
end
