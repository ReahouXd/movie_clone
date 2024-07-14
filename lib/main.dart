import 'package:flutter/material.dart';
import 'package:flutter_2020_level_1/Widget/listview_builder_page.dart';
// import 'package:flutter_2020_level_1/Widget/banner_page.dart';
// import 'package:flutter_2020_level_1/Widget/main_page.dart';
// import 'package:flutter_2020_level_1/Widget/login_page.dart';
// import 'package:flutter_2020_level_1/Widget/my_stateful.dart';
// import 'package:flutter_2020_level_1/Widget/widget.dart';




void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // home: Home(),
      // home: LoginPage(),
      // home: MyStateful(),
      // home: MainPage(),
      home: ListviewBuilderPage(),
      // home: BannerPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}


