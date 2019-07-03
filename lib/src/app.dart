import 'package:cinemax_app/src/routes.dart';
import 'package:flutter/material.dart';

class CinemaxApp extends StatelessWidget {
  CinemaxApp({ Key key }): super(key: key);

  final _appTitle = "Cinemax";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _appTitle,
      theme: ThemeData(
        accentColor: Color(0xffff9800),
        primaryColor: Colors.black,
        brightness: Brightness.dark
      ),
      initialRoute: '/',
      routes: routes,
      debugShowCheckedModeBanner: false,
    );
  }
}
