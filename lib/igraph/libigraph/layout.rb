require "ffi"
require_relative "datatype"
require_relative "vector"
require_relative "matrix"

module IGraph
  module LibIGraph
    # igraph_error_t igraph_layout_random(const igraph_t *graph, igraph_matrix_t *res);
    attach_function :igraph_layout_random, %i[pointer pointer], :int

    # igraph_error_t igraph_layout_circle(const igraph_t *graph, igraph_matrix_t *res, igraph_vs_t order);
    attach_function :igraph_layout_circle, %i[pointer pointer pointer], :int

    # igraph_error_t igraph_layout_star(const igraph_t *graph, igraph_matrix_t *res, igraph_int_t center, const igraph_vector_int_t *order);
    attach_function :igraph_layout_star, %i[pointer pointer long_long pointer], :int

    # igraph_error_t igraph_layout_grid(const igraph_t *graph, igraph_matrix_t *res, igraph_int_t width);
    attach_function :igraph_layout_grid, %i[pointer pointer long_long], :int

    # igraph_error_t igraph_layout_grid_3d(const igraph_t *graph, igraph_matrix_t *res, igraph_int_t width, igraph_int_t height);
    attach_function :igraph_layout_grid_3d, %i[pointer pointer long_long long_long], :int

    # igraph_error_t igraph_layout_fruchterman_reingold(const igraph_t *graph, igraph_matrix_t *res, igraph_bool_t use_seed, igraph_int_t niter, igraph_real_t start_temp, igraph_layout_gridmode_t grid, const igraph_vector_t *weights, const igraph_vector_t *minx, const igraph_vector_t *maxx, const igraph_vector_t *miny, const igraph_vector_t *maxy);
    attach_function :igraph_layout_fruchterman_reingold, %i[pointer pointer bool long_long double int pointer pointer pointer pointer pointer], :int

    # igraph_error_t igraph_layout_fruchterman_reingold_3d(const igraph_t *graph, igraph_matrix_t *res, igraph_bool_t use_seed, igraph_int_t niter, igraph_real_t start_temp, const igraph_vector_t *weights, const igraph_vector_t *minx, const igraph_vector_t *maxx, const igraph_vector_t *miny, const igraph_vector_t *maxy, const igraph_vector_t *minz, const igraph_vector_t *maxz);
    attach_function :igraph_layout_fruchterman_reingold_3d, %i[pointer pointer bool long_long double pointer pointer pointer pointer pointer pointer pointer], :int

    # igraph_error_t igraph_layout_kamada_kawai(const igraph_t *graph, igraph_matrix_t *res, igraph_bool_t use_seed, igraph_int_t niter, igraph_real_t kkconst, const igraph_vector_t *weights, const igraph_vector_t *minx, const igraph_vector_t *maxx, const igraph_vector_t *miny, const igraph_vector_t *maxy);
    attach_function :igraph_layout_kamada_kawai, %i[pointer pointer bool long_long double pointer pointer pointer pointer pointer], :int

    # igraph_error_t igraph_layout_kamada_kawai_3d(const igraph_t *graph, igraph_matrix_t *res, igraph_bool_t use_seed, igraph_int_t niter, igraph_real_t kkconst, const igraph_vector_t *weights, const igraph_vector_t *minx, const igraph_vector_t *maxx, const igraph_vector_t *miny, const igraph_vector_t *maxy, const igraph_vector_t *minz, const igraph_vector_t *maxz);
    attach_function :igraph_layout_kamada_kawai_3d, %i[pointer pointer bool long_long double pointer pointer pointer pointer pointer pointer pointer], :int

    # igraph_error_t igraph_layout_lgl(const igraph_t *graph, igraph_matrix_t *res, igraph_int_t maxiter, igraph_real_t maxdelta, igraph_real_t area, igraph_real_t coolexp, igraph_real_t repulserad, igraph_real_t cellsize, igraph_int_t root);
    attach_function :igraph_layout_lgl, %i[pointer pointer long_long double double double double double long_long], :int

    # igraph_error_t igraph_layout_reingold_tilford(const igraph_t *graph, igraph_matrix_t *res, igraph_neimode_t mode, const igraph_vector_int_t *roots, const igraph_vector_int_t *rootlevel);
    attach_function :igraph_layout_reingold_tilford, %i[pointer pointer int pointer pointer], :int

    # igraph_error_t igraph_layout_reingold_tilford_circular(const igraph_t *graph, igraph_matrix_t *res, igraph_neimode_t mode, const igraph_vector_int_t *roots, const igraph_vector_int_t *rootlevel);
    attach_function :igraph_layout_reingold_tilford_circular, %i[pointer pointer int pointer pointer], :int

    # igraph_error_t igraph_layout_sugiyama(const igraph_t *graph, igraph_matrix_t *res, igraph_t *extd_graph, igraph_vector_int_t *extd_to_orig_eids, const igraph_vector_t *layers, igraph_real_t hgap, igraph_real_t vgap, igraph_int_t maxiter, const igraph_vector_t *weights);
    attach_function :igraph_layout_sugiyama, %i[pointer pointer pointer pointer pointer double double long_long pointer], :int

    # igraph_error_t igraph_layout_mds(const igraph_t *graph, igraph_matrix_t *res, const igraph_matrix_t *dist, igraph_int_t dim, igraph_arpack_options_t *options);
    attach_function :igraph_layout_mds, %i[pointer pointer pointer long_long pointer], :int

    # igraph_error_t igraph_layout_bipartite(const igraph_t *graph, const igraph_vector_bool_t *types, igraph_matrix_t *res, igraph_real_t hgap, igraph_real_t vgap, igraph_int_t maxiter);
    attach_function :igraph_layout_bipartite, %i[pointer pointer pointer double double long_long], :int

    # igraph_error_t igraph_layout_drl(const igraph_t *graph, igraph_matrix_t *res, igraph_bool_t use_seed, igraph_layout_drl_default_t options, const igraph_vector_t *weights, const igraph_vector_bool_t *fixed);
    attach_function :igraph_layout_drl, %i[pointer pointer bool int pointer pointer], :int

    # igraph_error_t igraph_layout_drl_3d(const igraph_t *graph, igraph_matrix_t *res, igraph_bool_t use_seed, igraph_layout_drl_default_t options, const igraph_vector_t *weights, const igraph_vector_bool_t *fixed);
    attach_function :igraph_layout_drl_3d, %i[pointer pointer bool int pointer pointer], :int

    # igraph_error_t igraph_layout_umap(const igraph_t *graph, igraph_matrix_t *res, igraph_bool_t use_seed, igraph_int_t min_dist, const igraph_vector_t *epochs, igraph_bool_t negative_sample_rate);
    attach_function :igraph_layout_umap, %i[pointer pointer bool long_long pointer bool], :int

    # igraph_error_t igraph_layout_umap_3d(const igraph_t *graph, igraph_matrix_t *res, igraph_bool_t use_seed, igraph_int_t min_dist, const igraph_vector_t *epochs, igraph_bool_t negative_sample_rate);
    attach_function :igraph_layout_umap_3d, %i[pointer pointer bool long_long pointer bool], :int

    # igraph_error_t igraph_layout_graphopt(const igraph_t *graph, igraph_matrix_t *res, igraph_int_t niter, igraph_real_t node_charge, igraph_real_t node_mass, igraph_real_t spring_length, igraph_real_t spring_constant, igraph_real_t max_sa_movement, igraph_bool_t use_seed);
    attach_function :igraph_layout_graphopt, %i[pointer pointer long_long double double double double double bool], :int
  end
end
