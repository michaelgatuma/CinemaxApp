import 'package:cinemax_app/src/models/movie.dart';
import 'package:cinemax_app/src/services/movies_api_provider.dart';

class MoviesRepository {
  MoviesApiProvider _moviesApiProvider;

  MoviesRepository() {
    _moviesApiProvider = MoviesApiProvider();
  }

  Future<List<MovieModel>> fetchMoviesFeaturingToday(movieSessionCategory) {
    return _moviesApiProvider.fetchMoviesFeaturingToday(movieSessionCategory);
  }
}
