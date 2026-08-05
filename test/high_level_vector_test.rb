require "test_helper"

class HighLevelVectorTest < Test::Unit::TestCase
  test "create empty vector" do
    v = IGraph::Vector.new
    assert_equal 0, v.size
    assert_equal true, v.empty?
  end

  test "create vector with size" do
    v = IGraph::Vector.new(5)
    assert_equal 5, v.size
  end

  test "create vector from array" do
    v = IGraph::Vector.new([10, 20, 30])
    assert_equal 3, v.size
    assert_equal [10, 20, 30], v.to_a
  end

  test "from_a" do
    v = IGraph::Vector.from_a([1, 2, 3])
    assert_equal [1, 2, 3], v.to_a
  end

  test "get and set" do
    v = IGraph::Vector.new(3)
    v.set(0, 100)
    v.set(1, 200)
    assert_equal 100, v.get(0)
    assert_equal 200, v.get(1)
  end

  test "each" do
    v = IGraph::Vector.new([1, 2, 3])
    result = []
    v.each { |x| result << x }
    assert_equal [1, 2, 3], result
  end

  test "enumerable" do
    v = IGraph::Vector.new([1, 2, 3])
    assert_equal 6, v.sum
    assert_equal [2, 4, 6], v.map { |x| x * 2 }
  end

  test "length alias" do
    v = IGraph::Vector.new([1, 2])
    assert_equal 2, v.length
  end

  test "inspect" do
    v = IGraph::Vector.new([1, 2, 3])
    assert_match(/IGraph::Vector/, v.inspect)
  end
end
