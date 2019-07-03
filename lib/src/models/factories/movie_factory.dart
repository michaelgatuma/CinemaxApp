import 'package:cinemax_app/src/models/movie.dart';

class MovieFactory
{
  static makeFromJson(_movie)
  {
    return MovieModel(
      id: _movie['id'],
      name: _movie['name'],
      coverUrl: _movie['picture']['thumb']['url'],
      genres: _movie['genres']
    );
  }
}
