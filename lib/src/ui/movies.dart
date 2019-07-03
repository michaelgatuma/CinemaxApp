import 'package:cinemax_app/graphql/movies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class MovieList extends StatefulWidget {
  final sessionCategory;

  MovieList({ this.sessionCategory });

  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  @override
  Widget build(BuildContext context) {
    final sessionCategory = widget.sessionCategory;

    return Query(
      builder: (QueryResult result, { VoidCallback refetch }) {
        if (result.errors != null) {
          return Center(child: Text(result.errors.toString()));
        }

        if (result.loading) {
          return Center(child: CircularProgressIndicator());
        }

        List _movies = result.data['moviesFeaturingToday'];

        if (_movies.length == 0) {
          return Center(child: Text('Não há filmes em exibição nesta sessão'));
        }

        return StaggeredGridView.countBuilder(
          crossAxisCount: 2,
          itemCount: _movies.length,
          physics: AlwaysScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            /* final _movie = _movies[index];

            final _movieModel = MovieFactory.makeFromJson(_movie);

            return Movie(movie: _movieModel); */
          },
          staggeredTileBuilder: (int index) {
            return StaggeredTile.fit(1);
          },
          mainAxisSpacing: 15.0,
          crossAxisSpacing: 15.0,
          padding: EdgeInsets.all(15.0),
        );
      },
      options: QueryOptions(
        document: MOVIES_QUERY,
        variables: {
          'sessionCategory': sessionCategory
        }
      )
    );
  }
}
