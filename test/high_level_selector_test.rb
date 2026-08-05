require "test_helper"

class HighLevelSelectorTest < Test::Unit::TestCase
  # ---------------------------------------------------------------
  # VertexSelector
  # ---------------------------------------------------------------

  test "VertexSelector.resolve with Integer" do
    vs = IGraph::VertexSelector.resolve(0)
    begin
      assert_kind_of IGraph::LibIGraph::VertexSelector, vs
    ensure
      IGraph::VertexSelector.destroy(vs)
    end
  end

  test "VertexSelector.resolve with Range" do
    vs = IGraph::VertexSelector.resolve(0..2)
    begin
      assert_kind_of IGraph::LibIGraph::VertexSelector, vs
    ensure
      IGraph::VertexSelector.destroy(vs)
    end
  end

  test "VertexSelector Range preserves Ruby endpoint semantics" do
    inclusive = IGraph::Graph.new(n: 4)
    inclusive.delete_vertices(1..2)
    assert_equal 2, inclusive.vcount

    exclusive = IGraph::Graph.new(n: 4)
    exclusive.delete_vertices(1...2)
    assert_equal 3, exclusive.vcount
  end

  test "VertexSelector rejects unbounded Range" do
    assert_raise(IGraph::ArgumentError) { IGraph::VertexSelector.resolve(1..) }
    assert_raise(IGraph::ArgumentError) { IGraph::VertexSelector.resolve(..2) }
  end

  test "VertexSelector.resolve with :all" do
    vs = IGraph::VertexSelector.resolve(:all)
    begin
      assert_kind_of IGraph::LibIGraph::VertexSelector, vs
    ensure
      IGraph::VertexSelector.destroy(vs)
    end
  end

  test "VertexSelector.resolve with :none" do
    vs = IGraph::VertexSelector.resolve(:none)
    begin
      assert_kind_of IGraph::LibIGraph::VertexSelector, vs
    ensure
      IGraph::VertexSelector.destroy(vs)
    end
  end

  test "VertexSelector.resolve with unsupported value" do
    assert_raise(IGraph::ArgumentError) { IGraph::VertexSelector.resolve("foo") }
  end

  test "Array vertex selector owns its data after GC" do
    g = IGraph::Graph.new(edges: [[0, 1], [1, 2], [2, 3]])
    3.times do
      vs = IGraph::VertexSelector.resolve([1, 2])
      GC.start
      begin
        IGraph.check_error IGraph::LibIGraph.igraph_delete_vertices(g.instance_variable_get(:@struct).pointer, vs)
      ensure
        IGraph::VertexSelector.destroy(vs)
      end
      assert_equal 2, g.vcount
      g.add_vertices(2)
      g.add_edges([[1, 2], [2, 3]])
    end
  end

  # ---------------------------------------------------------------
  # EdgeSelector
  # ---------------------------------------------------------------

  test "EdgeSelector.resolve with Integer" do
    es = IGraph::EdgeSelector.resolve(0)
    begin
      assert_kind_of IGraph::LibIGraph::EdgeSelector, es
    ensure
      IGraph::EdgeSelector.destroy(es)
    end
  end

  test "EdgeSelector Range preserves Ruby endpoint semantics" do
    inclusive = IGraph::Graph.new(edges: [[0, 1], [1, 2], [2, 3], [3, 4]])
    inclusive.delete_edges(1..2)
    assert_equal 2, inclusive.ecount

    exclusive = IGraph::Graph.new(edges: [[0, 1], [1, 2], [2, 3], [3, 4]])
    exclusive.delete_edges(1...2)
    assert_equal 3, exclusive.ecount
  end

  test "EdgeSelector rejects unbounded Range" do
    assert_raise(IGraph::ArgumentError) { IGraph::EdgeSelector.resolve(1..) }
    assert_raise(IGraph::ArgumentError) { IGraph::EdgeSelector.resolve(..2) }
  end

  test "EdgeSelector.resolve with :all" do
    es = IGraph::EdgeSelector.resolve(:all)
    begin
      assert_kind_of IGraph::LibIGraph::EdgeSelector, es
    ensure
      IGraph::EdgeSelector.destroy(es)
    end
  end

  test "EdgeSelector.resolve with :none" do
    es = IGraph::EdgeSelector.resolve(:none)
    begin
      assert_kind_of IGraph::LibIGraph::EdgeSelector, es
    ensure
      IGraph::EdgeSelector.destroy(es)
    end
  end

  test "EdgeSelector.resolve with unsupported value" do
    assert_raise(IGraph::ArgumentError) { IGraph::EdgeSelector.resolve("foo") }
  end

  test "Array edge selector owns its data after GC" do
    g = IGraph::Graph.new(edges: [[0, 1], [1, 2], [2, 3]])
    es = IGraph::EdgeSelector.resolve([0, 1])
    GC.start
    begin
      IGraph.check_error IGraph::LibIGraph.igraph_delete_edges(g.instance_variable_get(:@struct).pointer, es)
    ensure
      IGraph::EdgeSelector.destroy(es)
    end
    assert_equal 1, g.ecount
  end

  # ---------------------------------------------------------------
  # Resource cleanup on failure
  # ---------------------------------------------------------------

  test "graph remains reusable after repeated add_edges failures" do
    g = IGraph::Graph.new(n: 1)
    10.times do
      assert_raise(IGraph::ArgumentError) { g.add_edges([[0, 2]]) }
    end
    assert_equal 1, g.vcount
    g.add_edges([[0, 0]])
    assert_equal 1, g.ecount
  end

  test "graph remains reusable after repeated delete_vertices failures" do
    g = IGraph::Graph.new(n: 2)
    10.times do
      assert_raise(IGraph::ArgumentError) { g.delete_vertices([5]) }
    end
    assert_equal 2, g.vcount
  end

  test "graph remains reusable after repeated delete_edges failures" do
    g = IGraph::Graph.new(edges: [[0, 1]])
    10.times do
      assert_raise(IGraph::RuntimeError) { g.delete_edges([7]) }
    end
    assert_equal 1, g.ecount
  end

  test "each_neighbor failure leaves the graph usable" do
    g = IGraph::Graph.new(n: 2)
    assert_raise(IGraph::ArgumentError) { g.each_neighbor(9) }
    assert_equal 2, g.vcount
  end
end
