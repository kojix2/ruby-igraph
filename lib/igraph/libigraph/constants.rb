module IGraph
  module LibIGraph
    # Graph directedness
    IGRAPH_UNDIRECTED = 0
    IGRAPH_DIRECTED = 1

    # Loop handling
    IGRAPH_NO_LOOPS = 0
    IGRAPH_LOOPS = 1
    IGRAPH_LOOPS_TWICE = 1
    IGRAPH_LOOPS_ONCE = 2

    # Multiple edges
    IGRAPH_NO_MULTIPLE = 0
    IGRAPH_MULTIPLE = 1

    # Ordering
    IGRAPH_ASCENDING = 0
    IGRAPH_DESCENDING = 1

    # Optimization
    IGRAPH_MINIMUM = 0
    IGRAPH_MAXIMUM = 1

    # Neighbor modes
    IGRAPH_OUT = 1
    IGRAPH_IN = 2
    IGRAPH_ALL = 3

    # Connectedness
    IGRAPH_WEAK = 1
    IGRAPH_STRONG = 2

    # Adjacency matrix modes
    IGRAPH_ADJ_DIRECTED = 0
    IGRAPH_ADJ_UNDIRECTED = 1
    IGRAPH_ADJ_UPPER = 2
    IGRAPH_ADJ_LOWER = 3
    IGRAPH_ADJ_MIN = 4
    IGRAPH_ADJ_PLUS = 5
    IGRAPH_ADJ_MAX = 6

    # Star graph modes
    IGRAPH_STAR_OUT = 0
    IGRAPH_STAR_IN = 1
    IGRAPH_STAR_UNDIRECTED = 2
    IGRAPH_STAR_MUTUAL = 3

    # Tree modes
    IGRAPH_TREE_OUT = 0
    IGRAPH_TREE_IN = 1
    IGRAPH_TREE_UNDIRECTED = 2

    # Matrix storage
    IGRAPH_ROW_MAJOR = 0
    IGRAPH_COLUMN_MAJOR = 1
  end
end
