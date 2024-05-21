import 'package:flutter/material.dart';
//import 'package:anihub/pages/anime_page.dart';
import 'package:anihub/pages/login_page.dart';
import 'package:anihub/pages/map_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Anime CRUD',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MapPage(),
    );
  }
}
