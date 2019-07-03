import 'package:cinemax_app/src/blocs/movie_block.dart';
import 'package:cinemax_app/src/models/movie.dart';
import 'package:cinemax_app/src/ui/movie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class MovieList extends StatelessWidget {
  final String movieSessionCategory;

  MovieList({ this.movieSessionCategory });

  @override
  Widget build(BuildContext context) {
    moviesBlock.fetchMoviesfeaturingToday(movieSessionCategory: movieSessionCategory);

    return StreamBuilder(
      stream: moviesBlock.moviesfeaturingToday,
      builder: (BuildContext context, AsyncSnapshot<List<MovieModel>> _moviesList) {
        if (_moviesList.hasData) {
          if (_moviesList.data.length == 0) {
            return Center(child: Text('Não há filmes em exibição nesta sessão'));
          }

          return StaggeredGridView.countBuilder(
            crossAxisCount: 2,
            itemCount: _moviesList.data.length,
            physics: AlwaysScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              final _movie = _moviesList.data[index];

              return Movie(movie: _movie);
            },
            staggeredTileBuilder: (int index) {
              return StaggeredTile.fit(1);
            },
            mainAxisSpacing: 15.0,
            crossAxisSpacing: 15.0,
            padding: EdgeInsets.all(15.0),
          );
        }

        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
