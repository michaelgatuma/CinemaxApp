import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>with TickerProviderStateMixin {
  TabController _tabController;

  bool _isLoaded = false;

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
          tabs: < Widget > [
            Tab(text: "Em exibição"),
            Tab(text: "Extreias"),
            Tab(text: "Kandengue"),
            Tab(text: "Esquebra"),
          ],
          isScrollable: true,
        ),
        actions: < Widget > [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              setState(() {
                _isLoaded = !_isLoaded;
              });
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
        children: < Widget > [
          Center(
            child: _isLoaded ? CircularProgressIndicator() : Tab(text: "Em exibição"), ),
          Center(
            child: Text("Extreias"), ),
          Center(
            child: Text("Kandengue"), ),
          Center(
            child: Text("Esquebra"), )
        ],
      ),
    );
  }
}
