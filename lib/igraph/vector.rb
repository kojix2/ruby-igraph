# frozen_string_literal: true

module IGraph
  # High-level Vector wrapper
  #
  # Wraps igraph_vector_int_t to provide Array-like operations.
  # Memory management is handled via GC, eliminating the need for explicit destroy calls.
  class Vector
    include Enumerable

    # @param size_or_array [Integer, Array] Size or initial value array
    def initialize(size_or_array = 0)
      @struct = LibIGraph::VectorIntStruct.new
      case size_or_array
      when Integer
        IGraph.check_error LibIGraph.igraph_vector_int_init(@struct.pointer, size_or_array)
      when Array
        IGraph.check_error LibIGraph.igraph_vector_int_init(@struct.pointer, size_or_array.size)
        size_or_array.each_with_index do |v, i|
          LibIGraph.igraph_vector_int_set(@struct.pointer, i, v)
        end
      end
      ObjectSpace.define_finalizer(self, self.class._destroy(@struct.pointer))
    end

    # @return [Array<Integer>] Convert to a Ruby array
    def to_a
      s = size
      Array.new(s) { |i| get(i) }
    end

    # Create a Vector from a Ruby array
    # @param array [Array<Integer>]
    # @return [Vector]
    def self.from_a(array)
      new(array)
    end

    # @return [Integer] Number of elements
    def size
      LibIGraph.igraph_vector_int_size(@struct.pointer)
    end
    alias length size

    # @return [Boolean] Whether the vector is empty
    def empty?
      size == 0
    end

    def each(&block)
      return to_enum(:each) unless block_given?
      s = size
      s.times { |i| yield get(i) }
    end

    # @param index [Integer]
    # @return [Integer]
    def get(index)
      LibIGraph.igraph_vector_int_get(@struct.pointer, index)
    end

    # @param index [Integer]
    # @param value [Integer]
    def set(index, value)
      LibIGraph.igraph_vector_int_set(@struct.pointer, index, value)
    end

    # @return [String]
    def inspect
      "#<IGraph::Vector size=#{size} #{to_a.inspect}>"
    end
    alias to_s inspect

    # Accessor for the FFI pointer (low-level use)
    def to_ptr
      @struct.pointer
    end

    # GC finalizer helper
    def self._destroy(ptr)
      proc { LibIGraph.igraph_vector_int_destroy(ptr) }
    end
  end
end
