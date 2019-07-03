import 'package:cinemax_app/src/models/movie.dart';
import 'package:cinemax_app/src/resources/movies_repository.dart';
import 'package:rxdart/rxdart.dart';

class MoviesBloc
{
  final _repository = MoviesRepository();

  final _moviesFeaturingTodayFetcher = PublishSubject<List<MovieModel>>();
  final _upcomingMoviesFetcher       = PublishSubject<List<MovieModel>>();

  Observable<List<MovieModel>> get moviesfeaturingToday => _moviesFeaturingTodayFetcher.stream;
  Observable<List<MovieModel>> get upcomingMovies       => _upcomingMoviesFetcher.stream;

  fetchMoviesfeaturingToday({ String movieSessionCategory }) async {
    List<MovieModel> _moviesList = await _repository.fetchMoviesFeaturingToday(
      movieSessionCategory: movieSessionCategory
    );

    _moviesFeaturingTodayFetcher.sink.add(_moviesList);
  }

  fetchUpcomingMovies() async {
    List<MovieModel> _moviesList = await _repository.fetchUpcomingMovies();

    _upcomingMoviesFetcher.sink.add(_moviesList);
  }

  dispose() {
    _moviesFeaturingTodayFetcher.close();
    _upcomingMoviesFetcher.close();
  }
}

final moviesBloc = MoviesBloc();
