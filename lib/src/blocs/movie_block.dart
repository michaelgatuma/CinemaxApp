import 'package:cinemax_app/src/models/movie.dart';
import 'package:cinemax_app/src/resources/movies_repository.dart';
import 'package:rxdart/rxdart.dart';

class MoviesBloc
{
  final _repository = MoviesRepository();
  final _moviesFetcher = PublishSubject<List<MovieModel>>();

  Observable<List<MovieModel>> get moviesfeaturingToday => _moviesFetcher.stream;

  fetchMoviesfeaturingToday({ String movieSessionCategory }) async {
    List<MovieModel> _moviesList = await _repository.fetchMoviesFeaturingToday(
      movieSessionCategory: movieSessionCategory
    );

    _moviesFetcher.sink.add(_moviesList);
  }

  dispose() {
    _moviesFetcher.close();
  }
}

final moviesBlock = MoviesBloc();
