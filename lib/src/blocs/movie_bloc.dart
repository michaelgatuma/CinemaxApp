import 'package:cinemax_app/src/models/movie.dart';
import 'package:cinemax_app/src/resources/movies_repository.dart';
import 'package:rxdart/rxdart.dart';

class MovieBloc
{
  final _movieRepository = MoviesRepository();

  final _movieFetcher = PublishSubject<MovieModel>();

  Observable<MovieModel> get movie => _movieFetcher.stream;

  fetchMovie(int movieId) async {
    final _movie = await _movieRepository.fetchMovie(movieId);

    _movieFetcher.sink.add(_movie);
  }

  dispose() {
    _movieFetcher.close();
  }
}

final movieBloc = MovieBloc();
