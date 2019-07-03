import 'package:cinemax_app/src/models/movie.dart';
import 'package:cinemax_app/src/resources/movies_repository.dart';
import 'package:rxdart/rxdart.dart';

class MoviesBloc
{
  final _repository = MoviesRepository();
  final _moviesFetcher = PublishSubject<List<MovieModel>>();

  Observable<List<MovieModel>> get moviesfeaturingToday => _moviesFetcher.stream;

  fetchMoviesfeaturingToday() async {
    List<MovieModel> _moviesList = await _repository.fetchMoviesFeaturingToday('em-exibicao');

    _moviesFetcher.sink.add(_moviesList);
  }

  dispose() {
    _moviesFetcher.close();
  }
}

final moviesBlock = MoviesBloc();
