require "test_helper"

class HighLevelMatrixTest < Test::Unit::TestCase
  test "create matrix" do
    m = IGraph::Matrix.new(3, 4)
    assert_equal 3, m.nrow
    assert_equal 4, m.ncol
  end

  test "get and set" do
    m = IGraph::Matrix.new(2, 2)
    m.set(0, 0, 1.0)
    m.set(0, 1, 2.0)
    m.set(1, 0, 3.0)
    m.set(1, 1, 4.0)
    assert_equal 1.0, m.get(0, 0)
    assert_equal 4.0, m.get(1, 1)
  end

  test "to_a" do
    m = IGraph::Matrix.new(2, 2)
    m.set(0, 0, 1.0)
    m.set(0, 1, 2.0)
    m.set(1, 0, 3.0)
    m.set(1, 1, 4.0)
    arr = m.to_a
    assert_equal [[1.0, 2.0], [3.0, 4.0]], arr
  end

  test "null!" do
    m = IGraph::Matrix.new(2, 2)
    m.set(0, 0, 99.0)
    m.null!
    assert_equal 0.0, m.get(0, 0)
  end

  test "fill!" do
    m = IGraph::Matrix.new(2, 2)
    m.fill!(7.0)
    assert_equal 7.0, m.get(0, 0)
    assert_equal 7.0, m.get(1, 1)
  end

  test "inspect" do
    m = IGraph::Matrix.new(3, 4)
    assert_match(/IGraph::Matrix/, m.inspect)
    assert_match(/nrow=3/, m.inspect)
  end
end
