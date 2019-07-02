import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../graphql/movies.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(vsync: this, length: 4, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cinemax"),
        bottom: TabBar(
          controller: _tabController,
          tabs: <Widget> [
            Tab(text: "Em exibição"),
            Tab(text: "Extreias"),
            Tab(text: "Kandengue"),
            Tab(text: "Esquebra"),
          ],
          isScrollable: true,
        ),
        actions: <Widget> [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () async {
              //
            },
          )
        ],
      ),
      drawer: Drawer(
        child: DrawerHeader(
          child: Text("Cinemax, é um espetáculo"),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget> [
          MoviesWidget(),
          Center(child: Text("Extreias")),
          Center(child: Text("Kandengue")),
          Center(child: Text("Esquebra"))
        ],
      ),
    );
  }
}

class MoviesWidget extends StatefulWidget {
  @override
  _MoviesWidgetState createState() => _MoviesWidgetState();
}

class _MoviesWidgetState extends State<MoviesWidget> {
  List _movies;

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

        _movies = result.data['moviesFeaturingToday'];

        return Padding(
          padding: EdgeInsets.all(15.0),
          child: StaggeredGridView.countBuilder(
            crossAxisCount: 2,
            itemCount: _movies.length,
            itemBuilder: (BuildContext context, int index) {
              final movieCoverUrl = _movies[index]['picture']['thumb']['url'];
              final movieTitle    = _movies[index]['name'];

              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(3.0),
                    child: Image.network(movieCoverUrl),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 10.0),),
                  Text(
                    movieTitle,
                    overflow: TextOverflow.ellipsis
                  )
              ]);
            },
            staggeredTileBuilder: (int index) {
              return StaggeredTile.fit(1);
            },
            mainAxisSpacing: 15.0,
            crossAxisSpacing: 15.0,
          )
        );
      },
      options: QueryOptions(document: MOVIES_QUERY)
    );
  }
}
