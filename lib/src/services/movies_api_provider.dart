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

  Future<List<MovieModel>> fetchMoviesFeaturingToday({ String movieSessionCategory }) async {
    final res = await _client.query(
      QueryOptions(
        document: MOVIES_QUERY,
        variables: {
          'sessionCategory': movieSessionCategory
        }
      )
    );

    List<MovieModel> _movieList = List<MovieModel>();

    final jsonMovies = res.data['moviesFeaturingToday'];

    for (final _movie in jsonMovies) {
      final _movieModel = MovieFactory.makeFromJson(_movie);

      _movieList.add((_movieModel));
    }

    return _movieList;
  }
}
