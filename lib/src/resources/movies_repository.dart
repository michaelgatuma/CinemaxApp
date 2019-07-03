import 'package:cinemax_app/src/models/movie.dart';
import 'package:cinemax_app/src/services/movies_api_provider.dart';

class MoviesRepository {
  MoviesApiProvider _moviesApiProvider;

  MoviesRepository() {
    _moviesApiProvider = MoviesApiProvider();
  }

  Future<MovieModel> fetchMovie(int movieId) {
    return _moviesApiProvider.fetchMovie(movieId);
  }

  Future<List<MovieModel>> fetchMoviesFeaturingToday({ String movieSessionCategory }) {
    return _moviesApiProvider.fetchMoviesFeaturingToday(
      movieSessionCategory: movieSessionCategory
    );
  }

  Future<List<MovieModel>> fetchUpcomingMovies() {
    return _moviesApiProvider.fetchUpcomingMovies();
  }
}
