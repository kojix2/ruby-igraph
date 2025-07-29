require "test_helper"

class VersionTest < Test::Unit::TestCase
  test "VERSION" do
    assert do
      ::IGraph.const_defined?(:VERSION)
    end
  end

  test "get igraph version" do
    str_p = FFI::MemoryPointer.new(:pointer)
    major = FFI::MemoryPointer.new(:int)
    minor = FFI::MemoryPointer.new(:int)
    patch = FFI::MemoryPointer.new(:int)

    IGraph::LibIGraph.igraph_version(
      str_p,
      major,
      minor,
      patch
    )

    version_str = str_p.read_pointer.read_string
    major_val, minor_val, patch_val = version_str.split(".").map(&:to_i)
    assert_equal major_val, major.read_int
    assert_equal minor_val, minor.read_int
    assert_equal patch_val, patch.read_int
  end
end
