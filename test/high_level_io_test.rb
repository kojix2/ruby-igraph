require "test_helper"

class HighLevelIOTest < Test::Unit::TestCase
  test "detect_format from extension" do
    assert_equal :graphml,  IGraph::IO.detect_format("a.graphml")
    assert_equal :graphml,  IGraph::IO.detect_format("a.xml")
    assert_equal :gml,      IGraph::IO.detect_format("a.gml")
    assert_equal :pajek,    IGraph::IO.detect_format("a.net")
    assert_equal :edgelist, IGraph::IO.detect_format("a.txt")
    assert_equal :lgl,      IGraph::IO.detect_format("a.lgl")
    assert_equal :dl,       IGraph::IO.detect_format("a.dl")
    assert_equal :leda,     IGraph::IO.detect_format("a.leda")
    assert_equal :dot,      IGraph::IO.detect_format("a.dot")
    assert_equal :ncol,     IGraph::IO.detect_format("a.ncol")
  end

  test "detect_format raises on unknown extension" do
    assert_raise(IGraph::ArgumentError) { IGraph::IO.detect_format("a.xyz") }
  end

  test "read raises NotImplementedError instead of returning a format symbol" do
    assert_raise(NotImplementedError) { IGraph::IO.read("missing.graphml") }
  end

  test "read with explicit format raises NotImplementedError" do
    assert_raise(NotImplementedError) { IGraph::IO.read("missing.bin", format: :graphml) }
  end

  test "write raises NotImplementedError instead of returning a format symbol" do
    g = IGraph::Graph.new(n: 2)
    assert_raise(NotImplementedError) { IGraph::IO.write(g, "out.graphml") }
    assert_false File.exist?("out.graphml")
  end

  test "write with explicit format raises NotImplementedError" do
    g = IGraph::Graph.new(n: 2)
    assert_raise(NotImplementedError) { IGraph::IO.write(g, "out.bin", format: :gml) }
  end

  test "FORMATS is frozen" do
    assert_predicate IGraph::IO::FORMATS, :frozen?
  end
end
