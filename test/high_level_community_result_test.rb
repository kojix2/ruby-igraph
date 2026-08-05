require "test_helper"

class HighLevelCommunityResultTest < Test::Unit::TestCase
  test "membership and modularity" do
    result = IGraph::CommunityResult.new(membership: [0, 0, 1, 1], modularity: 0.42)
    assert_equal [0, 0, 1, 1], result.membership
    assert_equal 0.42, result.modularity
  end

  test "to_h groups vertices by community ID" do
    result = IGraph::CommunityResult.new(membership: [0, 0, 1, 1])
    assert_equal({ 0 => [0, 1], 1 => [2, 3] }, result.to_h)
  end

  test "to_h with non-contiguous community IDs" do
    result = IGraph::CommunityResult.new(membership: [2, 5, 2, 5])
    assert_equal({ 2 => [0, 2], 5 => [1, 3] }, result.to_h)
  end

  test "to_h with empty membership" do
    result = IGraph::CommunityResult.new(membership: [])
    assert_equal({}, result.to_h)
  end

  test "to_h with a single community" do
    result = IGraph::CommunityResult.new(membership: [7, 7, 7])
    assert_equal({ 7 => [0, 1, 2] }, result.to_h)
  end

  test "count" do
    result = IGraph::CommunityResult.new(membership: [0, 0, 1, 1, 2])
    assert_equal 3, result.count
    assert_equal 3, result.size
  end

  test "count with empty membership" do
    result = IGraph::CommunityResult.new(membership: [])
    assert_equal 0, result.count
  end

  test "communities are frozen" do
    result = IGraph::CommunityResult.new(membership: [0], communities: [[0]])
    assert_predicate result.communities, :frozen?
    assert_predicate result.communities.first, :frozen?
  end

  test "inspect" do
    result = IGraph::CommunityResult.new(membership: [0, 1], modularity: 0.5)
    assert_match(/count=2/, result.inspect)
  end
end
