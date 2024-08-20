import 'package:flutter/material.dart';
import 'package:flutter_2020_level_1/home/main_home.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      color: Colors.black,
      title: "Movie App",
      debugShowCheckedModeBanner: false,
      home: MultiPage(),
    );
  }
}
