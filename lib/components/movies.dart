import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'package:cinemax_app/models/movie.dart';
import 'package:cinemax_app/components/movie.dart';
import 'package:cinemax_app/graphql/movies.dart';

class MoviesWidget extends StatefulWidget {
  @override
  _MoviesWidgetState createState() => _MoviesWidgetState();
}

class _MoviesWidgetState extends State<MoviesWidget> {
  @override
  Widget build(BuildContext context) {
    return Query(
      builder: (QueryResult result, { VoidCallback refetch }) {
        if (result.errors != null) {
          return Center(child: Text(result.errors.toString()));
        }

        if (result.loading) {
          return Center(child: CircularProgressIndicator());
        }

        List _movies = result.data['moviesFeaturingToday'];

        return StaggeredGridView.countBuilder(
          crossAxisCount: 2,
          itemCount: _movies.length,
          physics: AlwaysScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            final _movie = _movies[index];

            final _movieModel = Movie(
              id: _movie['id'],
              name:_movies[index]['name'],
              coverUrl: _movies[index]['picture']['thumb']['url']
            );

            return MovieWidget(movie: _movieModel);
          },
          staggeredTileBuilder: (int index) {
            return StaggeredTile.fit(1);
          },
          mainAxisSpacing: 15.0,
          crossAxisSpacing: 15.0,
          padding: EdgeInsets.all(15.0),
        );
      },
      options: QueryOptions(document: MOVIES_QUERY)
    );
  }
}
