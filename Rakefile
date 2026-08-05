require "bundler/gem_tasks"
require "rake/testtask"

IGRAPH_BUILD_DIR = File.expand_path("igraph/build/src", __dir__)
IGRAPH_SUBMODULE_DIR = File.expand_path("igraph", __dir__)
IGRAPH_CMAKE_BUILD_DIR = File.expand_path("igraph/build", __dir__)

# Auto-detect igraph: prefer submodule build, fall back to system library
require "ffi"
if File.exist?(File.join(IGRAPH_BUILD_DIR, "libigraph.#{FFI::Platform::LIBSUFFIX}"))
  ENV["IGRAPHDIR"] = IGRAPH_BUILD_DIR
end

# ---------------------------------------------------------------------------
# Test
# ---------------------------------------------------------------------------

Rake::TestTask.new(:test) do |t|
  t.libs << "test"
  t.libs << "lib"
  t.test_files = FileList["test/**/*_test.rb"]
end

# Run a single test file: rake test_file[test/graph_test.rb]
desc "Run a single test file (e.g. rake test_file[test/graph_test.rb])"
task :test_file, [:file] do |_t, args|
  abort "Usage: rake test_file[test/foo_test.rb]" unless args[:file]
  sh "bundle exec ruby -Ilib -Itest #{args[:file]}"
end

# ---------------------------------------------------------------------------
# Build igraph C library from submodule
# ---------------------------------------------------------------------------

namespace :igraph do
  desc "Configure igraph C library (cmake)"
  task :configure do
    mkdir_p IGRAPH_CMAKE_BUILD_DIR unless File.directory?(IGRAPH_CMAKE_BUILD_DIR)
    cd IGRAPH_CMAKE_BUILD_DIR do
      sh "cmake .. -DBUILD_SHARED_LIBS=ON -DCMAKE_BUILD_TYPE=Release"
    end
  end

  desc "Build igraph C library"
  task build: :configure do
    cd IGRAPH_CMAKE_BUILD_DIR do
      sh "cmake --build . --parallel"
    end
  end

  desc "Remove igraph build artifacts"
  task :clean do
    rm_rf IGRAPH_CMAKE_BUILD_DIR
  end

  desc "Rebuild igraph C library from scratch"
  task rebuild: [:clean, :build]
end

# ---------------------------------------------------------------------------
# Console
# ---------------------------------------------------------------------------

desc "Start an IRB session with igraph loaded"
task :console do
  sh "bundle exec irb -r igraph"
end

# ---------------------------------------------------------------------------
# Default
# ---------------------------------------------------------------------------

task default: :test
