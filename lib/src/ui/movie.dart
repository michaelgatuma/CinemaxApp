import 'package:cinemax_app/src/models/movie.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Movie extends StatelessWidget {
  final MovieModel movie;

  const Movie({Key key, this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(3.0),
            child: CachedNetworkImage(
              imageUrl: movie.coverUrl,
              /* placeholder: (context, url) => Center(
                child: CircularProgressIndicator()
              ) */
            ),
          ),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                blurRadius: 5.0,
                offset: Offset.fromDirection(-5.0, 5.0)
              )
            ]
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 15.0)
        ),
        Text(
          movie.name,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 8.0)
        ),
        Text(
          'Acção, Ficção científica',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 10.0,
            color: Colors.white.withOpacity(0.6)
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 15.0)
        ),
    ]);
  }
}
