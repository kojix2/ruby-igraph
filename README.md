# ruby-igraph

[![test](https://github.com/kojix2/ruby-igraph/actions/workflows/test.yml/badge.svg)](https://github.com/kojix2/ruby-igraph/actions/workflows/test.yml)
[![Lines of Code](https://img.shields.io/endpoint?url=https%3A%2F%2Ftokei.kojix2.net%2Fbadge%2Fgithub%2Fkojix2%2Fruby-igraph%2Flines)](https://tokei.kojix2.net/github/kojix2/ruby-igraph)

Ruby bindings for the igraph library - a collection of network analysis tools.

## Installation

Install the igraph C library first:

```bash
# macOS
brew install igraph

# Ubuntu/Debian
sudo apt-get install libigraph-dev

# Other systems: see https://igraph.org/c/doc/igraph-Installation.html
```

Then install the gem:

```bash
gem install ruby-igraph
```

## Usage

```ruby
require 'igraph'

# Create a simple graph
graph = IGraph::LibIGraph::Graph.new
IGraph::LibIGraph.igraph_empty(graph.pointer, 3, false)

# Add edges
edges = IGraph::LibIGraph::VectorIntStruct.new
IGraph::LibIGraph.igraph_vector_int_init(edges.pointer, 4)
IGraph::LibIGraph.igraph_vector_int_set(edges.pointer, 0, 0)
IGraph::LibIGraph.igraph_vector_int_set(edges.pointer, 1, 1)
IGraph::LibIGraph.igraph_vector_int_set(edges.pointer, 2, 1)
IGraph::LibIGraph.igraph_vector_int_set(edges.pointer, 3, 2)

IGraph::LibIGraph.igraph_create(graph.pointer, edges.pointer, 3, false)

# Get basic properties
vcount = IGraph::LibIGraph.igraph_vcount(graph.pointer)  # => 3
ecount = IGraph::LibIGraph.igraph_ecount(graph.pointer)  # => 2

# Clean up
IGraph::LibIGraph.igraph_vector_int_destroy(edges.pointer)
IGraph::LibIGraph.igraph_destroy(graph.pointer)
```

## Development

```bash
git clone https://github.com/kojix2/ruby-igraph
cd ruby-igraph
bundle install
rake test
```

## Contributing

Bug reports and pull requests are welcome on GitHub.

## License

This project was built with love using the vibe coding method.

[MIT License](https://opensource.org/licenses/MIT).
