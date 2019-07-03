import 'package:cinemax_app/src/graphql/movies.dart';
import 'package:cinemax_app/src/models/factories/movie_factory.dart';
import 'package:cinemax_app/src/models/movie.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class MoviesApiProvider {
  GraphQLClient _client;

  MoviesApiProvider() {
    final HttpLink httpLink = HttpLink(
      uri: 'https://api.cinemax.co.ao/graphql'
    );

    _client = GraphQLClient(
      cache: InMemoryCache(),
      link: httpLink as Link
    );
  }

  Future<MovieModel> fetchMovie(int movieId) async {
    final _result = await _client.query(
      QueryOptions(
        document: MOVIE_QUERY,
        variables: {
          'id': movieId
        }
      )
    );

    return MovieFactory.makeFromJson(_result.data['movie']);
  }

  Future<List<MovieModel>> fetchMoviesFeaturingToday({ String movieSessionCategory }) async {
    final res = await _client.query(
      QueryOptions(
        document: MOVIES_FEATURING_TODAY_QUERY,
        variables: {
          'sessionCategory': movieSessionCategory
        }
      )
    );

    final jsonMovies = res.data['moviesFeaturingToday'];

    return _toMovieModelList(jsonMovies);
  }

  Future<List<MovieModel>> fetchUpcomingMovies() async {
    final res = await _client.query(
      QueryOptions(document: UPCOMING_MOVIES_QUERY)
    );

    if (res.errors != null) {
      print(res.errors[0].toString());
    }

    final jsonMovies = res.data['upcomingMovies'];

    return _toMovieModelList(jsonMovies);
  }

  List<MovieModel> _toMovieModelList(jsonMovies)
  {
    List<MovieModel> _movieList = List<MovieModel>();

    for (final _movie in jsonMovies) {
      final _movieModel = MovieFactory.makeFromJson(_movie);

      _movieList.add(_movieModel);
    }

    return _movieList;
  }
}
