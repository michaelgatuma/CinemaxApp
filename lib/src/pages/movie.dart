import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cinemax_app/src/blocs/movie_bloc.dart';
import 'package:cinemax_app/src/models/movie.dart';
import 'package:flutter/material.dart';

class MoviePage extends StatelessWidget {
  final int movieId;

  MoviePage({ this.movieId });

  @override
  Widget build(BuildContext context) {
    movieBloc.fetchMovie(movieId);

    return Scaffold(
      appBar: AppBar(
        title: Text('Filme')
      ),
      body: StreamBuilder(
        stream: movieBloc.movie,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            final _movie = snapshot.data as MovieModel;

            return Container(
              child: Column(
                children: <Widget>[
                  Stack(children: <Widget>[
                    Expanded(
                      child: CachedNetworkImage(
                        imageUrl: _movie.coverUrl,
                        fit: BoxFit.fill,
                      )
                    ),
                    BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                      child: Container(
                        color: Colors.black.withOpacity(0.3)
                      ),
                    ),
                  ]),
                  Text(_movie.name)
                ]
              )
            );
          }

          return Center(child: CircularProgressIndicator());
        },
      )
    );
  }
}
