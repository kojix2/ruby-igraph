# frozen_string_literal: true

module IGraph
  # I/O module (high-level)
  #
  # Provides reading and writing of various graph formats
  # such as GraphML, GML, Pajek, edgelist, etc.
  module IO
    # List of supported formats
    FORMATS = %i[graphml gml pajek edgelist lgl dl leda dot ncol].freeze

    # Read a graph from a file
    # @param path [String] File path
    # @param format [Symbol] Format (detected from extension if omitted)
    # @return [IGraph::Graph]
    # @raise [NotImplementedError] File I/O is not implemented yet
    def self.read(path, format: nil)
      format ||= detect_format(path)
      raise NotImplementedError, "IGraph::IO.read is not implemented yet (format: #{format})"
    end

    # Write a graph to a file
    # @param graph [IGraph::Graph]
    # @param path [String] File path
    # @param format [Symbol] Format (detected from extension if omitted)
    # @raise [NotImplementedError] File I/O is not implemented yet
    def self.write(graph, path, format: nil)
      format ||= detect_format(path)
      raise NotImplementedError, "IGraph::IO.write is not implemented yet (format: #{format})"
    end

    # Detect the format from the file extension
    # @param path [String]
    # @return [Symbol]
    def self.detect_format(path)
      case File.extname(path).downcase
      when ".graphml", ".xml" then :graphml
      when ".gml"             then :gml
      when ".net"             then :pajek
      when ".txt", ".tsv"     then :edgelist
      when ".lgl"             then :lgl
      when ".dl"              then :dl
      when ".leda"            then :leda
      when ".dot", ".gv"      then :dot
      when ".ncol"            then :ncol
      else
        raise IGraph::ArgumentError, "Cannot detect format from extension: #{File.extname(path)}"
      end
    end
  end
end
