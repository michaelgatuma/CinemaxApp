import 'package:cinemax_app/src/ui/movies.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  TabController _tabController;

  var tabBarViewChildrens = <Widget> [
    MovieList(movieSessionCategory: 'em-exibicao'),
    MovieList(),
    MovieList(movieSessionCategory: 'kandengue'),
    MovieList(movieSessionCategory: 'esquebra')
  ];

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
        children: tabBarViewChildrens,
      ),
    );
  }
}
