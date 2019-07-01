import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../graphql/movies.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  GraphQLClient _client;
  TabController _tabController;

  bool _isLoading = false;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(vsync: this, length: 4, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    _client = GraphQLProvider.of(context).value;

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
              _isLoading = true;

              var queryOptions = QueryOptions(document: MOVIES_QUERY);

              /**
               * No idea of how to put the result
               * data into a ListView. :(
               */
              var res = await _client.query(queryOptions);

              var data = res.data;

              json.decode(data);

              _isLoading = false;
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
          Center(child: _isLoading ? CircularProgressIndicator() : Text("Em exibição")),
          Center(child: Text("Extreias")),
          Center(child: Text("Kandengue")),
          Center(child: Text("Esquebra"))
        ],
      ),
    );
  }
}
