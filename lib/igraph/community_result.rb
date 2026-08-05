# frozen_string_literal: true

module IGraph
  # Class that holds community detection results
  #
  # @example
  #   result = graph.community_leiden
  #   result.membership  # => [0, 0, 1, 1, 2]
  #   result.modularity   # => 0.42
  #   result.count        # => 3
  class CommunityResult
    # @return [Array<Integer>] Community membership for each vertex
    attr_reader :membership

    # @return [Float, nil] Modularity value
    attr_reader :modularity

    # @return [Array<Array<Integer>>, nil] Vertex lists grouped by community
    attr_reader :communities

    # @param membership [Array<Integer>]
    # @param modularity [Float, nil]
    # @param communities [Array<Array<Integer>>, nil]
    def initialize(membership:, modularity: nil, communities: nil)
      @membership = membership.freeze
      @modularity = modularity
      @communities = communities&.map(&:freeze)&.freeze
    end

    # @return [Integer] Number of communities
    def count
      @membership.uniq.size
    end
    alias size count

    # @return [Hash{Integer => Array<Integer>}] Community ID => vertex list
    def to_h
      @membership.each_with_object({}) do |(vid, comm), h|
        (h[comm] ||= []) << vid
      end
    end

    # @return [String]
    def inspect
      "#<IGraph::CommunityResult count=#{count} modularity=#{modularity}>"
    end
    alias to_s inspect
  end
end
