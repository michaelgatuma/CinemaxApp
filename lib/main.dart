import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import './services/graphql.dart';

import './pages/home.dart';

void main() => runApp(CinemaxApp());

class CinemaxApp extends StatelessWidget {
  CinemaxApp({ Key key }): super(key: key);

  final _appTitle = "Cinemax";

  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: client,
      child: MaterialApp(
        title: _appTitle,
        theme: ThemeData(
          accentColor: Colors.orange[900],
          primaryColor: Color(0xffff9800),
          brightness: Brightness.dark
        ),
        home: HomePage(),
        debugShowCheckedModeBanner: false,
      )
    );
  }
}
