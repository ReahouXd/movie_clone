import 'package:flutter/material.dart';
import 'package:flutter_2020_level_1/Widget/listview_builder_page.dart';

class DetailPage extends StatefulWidget {
  final Movie movie;

  const DetailPage({super.key, required this.movie});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late Movie _movie;
  @override
  Widget build(BuildContext context) {
    _movie = widget.movie;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text(_movie.title),
      ),
      body: Container(
        height: 500,
        width: 430,
        child: Image.asset(_movie.img, fit: BoxFit.cover,),
        
        
      ),
    );
  }
}
