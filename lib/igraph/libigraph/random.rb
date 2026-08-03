require "ffi"
require_relative "datatype"
require_relative "vector"
require_relative "matrix"

module IGraph
  module LibIGraph
    # igraph_error_t igraph_random_sample(igraph_vector_int_t *res, igraph_int_t l, igraph_int_t h, igraph_int_t length);
    attach_function :igraph_random_sample, %i[pointer long_long long_long long_long], :int

    # igraph_error_t igraph_random_walk(const igraph_t *graph, igraph_vector_int_t *walk, igraph_int_t start, igraph_neimode_t mode, igraph_int_t steps, igraph_random_walk_stuck_t stuck);
    attach_function :igraph_random_walk, %i[pointer pointer long_long int long_long int], :int

    # igraph_error_t igraph_rng_get_integer(igraph_rng_t *rng, igraph_int_t lo, igraph_int_t hi, igraph_int_t *result);
    attach_function :igraph_rng_get_integer, %i[pointer long_long long_long pointer], :int

    # igraph_error_t igraph_rng_get_normal(igraph_rng_t *rng, igraph_int_t m, igraph_real_t s, igraph_vector_t *result);
    attach_function :igraph_rng_get_normal, %i[pointer long_long double pointer], :int

    # igraph_rng_t *igraph_rng_default(void);
    attach_function :igraph_rng_default, [], :pointer

    # void igraph_rng_seed(igraph_rng_t *rng, unsigned long seed);
    attach_function :igraph_rng_seed, %i[pointer ulong], :void

    # igraph_real_t igraph_rng_get_unif01(igraph_rng_t *rng);
    attach_function :igraph_rng_get_unif01, [:pointer], :double

    # igraph_real_t igraph_rng_get_unif(igraph_rng_t *rng, igraph_real_t lo, igraph_real_t hi);
    attach_function :igraph_rng_get_unif, %i[pointer double double], :double

    # igraph_rng_t *igraph_rng_init(igraph_rng_t *rng, const igraph_rng_type_t *type);
    attach_function :igraph_rng_init, %i[pointer pointer], :pointer

    # void igraph_rng_destroy(igraph_rng_t *rng);
    attach_function :igraph_rng_destroy, [:pointer], :void

    # igraph_error_t igraph_rng_get_geom(igraph_rng_t *rng, igraph_real_t p, igraph_vector_int_t *result);
    attach_function :igraph_rng_get_geom, %i[pointer double pointer], :int

    # igraph_error_t igraph_rng_get_binom(igraph_rng_t *rng, igraph_int_t n, igraph_real_t p, igraph_vector_int_t *result);
    attach_function :igraph_rng_get_binom, %i[pointer long_long double pointer], :int

    # igraph_error_t igraph_rng_sample_sphere_surface(igraph_rng_t* rng, igraph_int_t dim, igraph_int_t n, igraph_real_t radius, igraph_bool_t positive, igraph_matrix_t *res);
    attach_function :igraph_rng_sample_sphere_surface, %i[pointer long_long long_long double bool pointer], :int

    # igraph_error_t igraph_rng_sample_sphere_volume(igraph_rng_t* rng, igraph_int_t dim, igraph_int_t n, igraph_real_t radius, igraph_bool_t positive, igraph_matrix_t *res);
    attach_function :igraph_rng_sample_sphere_volume, %i[pointer long_long long_long double bool pointer], :int

    # igraph_error_t igraph_rng_sample_dirichlet(igraph_rng_t* rng, igraph_int_t n, const igraph_vector_t *alpha, igraph_matrix_t *res);
    attach_function :igraph_rng_sample_dirichlet, %i[pointer long_long pointer pointer], :int
  end
end
