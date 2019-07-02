import 'package:cinemax_app/models/movie.dart';

class MovieFactory
{
  static make(_movie)
  {
    return Movie(
      id: _movie['id'],
      name: _movie['name'],
      coverUrl: _movie['picture']['thumb']['url']
    );
  }
}
