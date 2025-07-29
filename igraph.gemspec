require_relative "lib/igraph/version"

Gem::Specification.new do |spec|
  spec.name    = "ruby-igraph"
  spec.version = IGraph::VERSION
  spec.summary = "Library for the analysis of networks"
  spec.license = "MIT"

  spec.authors = ["kojix2"]
  spec.email   = ["2xijok@gmail.com"]

  spec.files   = Dir["*.{md, txt}" "lib/**/*"]
  spec.require_paths = ["lib"]

  spec.required_ruby_version = ">= 3.2.0"
end
