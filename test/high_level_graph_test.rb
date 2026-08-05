require "test_helper"

class HighLevelGraphTest < Test::Unit::TestCase
  test "create empty graph" do
    g = IGraph::Graph.new(n: 5, directed: false)
    assert_equal 5, g.vcount
    assert_equal 0, g.ecount
    assert_equal false, g.directed?
  end

  test "create graph with edges" do
    g = IGraph::Graph.new(edges: [[0, 1], [1, 2]], directed: false)
    assert_equal 3, g.vcount
    assert_equal 2, g.ecount
    assert_equal false, g.directed?
  end

  test "create directed graph" do
    g = IGraph::Graph.new(edges: [[0, 1], [1, 2]], directed: true)
    assert_equal true, g.directed?
  end

  test "add vertices" do
    g = IGraph::Graph.new(n: 2)
    g.add_vertices(3)
    assert_equal 5, g.vcount
  end

  test "add edges" do
    g = IGraph::Graph.new(n: 3)
    g.add_edges([[0, 1], [1, 2]])
    assert_equal 2, g.ecount
  end

  test "delete vertices" do
    g = IGraph::Graph.new(edges: [[0, 1], [1, 2], [2, 0]])
    g.delete_vertices([0])
    assert_equal 2, g.vcount
    assert_equal 1, g.ecount
  end

  test "delete edges" do
    g = IGraph::Graph.new(edges: [[0, 1], [1, 2]])
    g.delete_edges([0])
    assert_equal 1, g.ecount
  end

  test "degree" do
    g = IGraph::Graph.new(edges: [[0, 1], [0, 2]], directed: false)
    assert_equal 2, g.degree(0, mode: :all)
    assert_equal 1, g.degree(1, mode: :all)
  end

  test "adjacent?" do
    g = IGraph::Graph.new(edges: [[0, 1], [1, 2]])
    assert_equal true, g.adjacent?(0, 1)
    assert_equal false, g.adjacent?(0, 2)
  end

  test "each_vertex" do
    g = IGraph::Graph.new(n: 3)
    assert_equal [0, 1, 2], g.each_vertex.to_a
  end

  test "each_edge" do
    g = IGraph::Graph.new(edges: [[0, 1], [1, 2]])
    result = g.each_edge.to_a
    assert_equal 2, result.size
    assert_equal [0, 1], result[0]
    assert_equal [1, 2], result[1]
  end

  test "each_neighbor" do
    g = IGraph::Graph.new(edges: [[0, 1], [0, 2]])
    result = g.each_neighbor(0, mode: :all)
    assert_equal [1, 2], result.sort
  end

  test "vertices" do
    g = IGraph::Graph.new(n: 3)
    assert_equal [0, 1, 2], g.vertices
  end

  test "edges" do
    g = IGraph::Graph.new(edges: [[0, 1], [1, 2]])
    assert_equal 2, g.edges.size
  end

  test "density" do
    g = IGraph::Graph.new(edges: [[0, 1], [1, 2]], directed: false)
    d = g.density
    # Undirected graph with 3 vertices, 2 edges: 2*2/(3*2) = 2/3
    assert_in_delta 2.0 / 3.0, d, 0.01
  end

  test "simple?" do
    g = IGraph::Graph.new(edges: [[0, 1], [1, 2]])
    assert_equal true, g.simple?
  end

  test "connected?" do
    g = IGraph::Graph.new(edges: [[0, 1], [1, 2]])
    assert_equal true, g.connected?
  end

  test "tree?" do
    g = IGraph::Graph.new(edges: [[0, 1], [1, 2]])
    assert_equal true, g.tree?
  end

  test "inspect" do
    g = IGraph::Graph.new(edges: [[0, 1]], directed: false)
    assert_match(/IGraph::Graph/, g.inspect)
    assert_match(/vcount=2/, g.inspect)
  end
end
