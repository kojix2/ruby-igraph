# frozen_string_literal: true

module IGraph
  # High-level Matrix wrapper
  #
  # Wraps igraph_matrix_t to provide Array-of-Arrays-like operations.
  # Memory management is handled via GC, eliminating the need for explicit destroy calls.
  class Matrix
    # @param nrow [Integer] Number of rows
    # @param ncol [Integer] Number of columns
    def initialize(nrow = 0, ncol = 0)
      @struct = LibIGraph::Matrix.new
      IGraph.check_error LibIGraph.igraph_matrix_init(@struct.pointer, nrow, ncol)
      ObjectSpace.define_finalizer(self, self.class._destroy(@struct.pointer))
    end

    # @return [Array<Array<Float>>] Convert to a 2D array
    def to_a
      nr = nrow
      nc = ncol
      Array.new(nr) do |r|
        Array.new(nc) { |c| get(r, c) }
      end
    end

    # @return [Integer] Number of rows
    def nrow
      LibIGraph.igraph_matrix_nrow(@struct.pointer)
    end

    # @return [Integer] Number of columns
    def ncol
      LibIGraph.igraph_matrix_ncol(@struct.pointer)
    end

    # @param row [Integer]
    # @param col [Integer]
    # @return [Float]
    def get(row, col)
      LibIGraph.igraph_matrix_get(@struct.pointer, row, col)
    end

    # @param row [Integer]
    # @param col [Integer]
    # @param value [Numeric]
    def set(row, col, value)
      LibIGraph.igraph_matrix_set(@struct.pointer, row, col, value.to_f)
    end

    # Set all elements to zero
    def null!
      LibIGraph.igraph_matrix_null(@struct.pointer)
      self
    end

    # Fill all elements with the given value
    def fill!(value)
      LibIGraph.igraph_matrix_fill(@struct.pointer, value.to_f)
      self
    end

    # @return [String]
    def inspect
      "#<IGraph::Matrix nrow=#{nrow} ncol=#{ncol}>"
    end
    alias to_s inspect

    # Accessor for the FFI pointer (low-level use)
    def to_ptr
      @struct.pointer
    end

    # GC finalizer helper
    def self._destroy(ptr)
      proc { LibIGraph.igraph_matrix_destroy(ptr) }
    end
  end
end
