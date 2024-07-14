import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyStateful extends StatefulWidget {
  const MyStateful({super.key});

  @override
  State<MyStateful> createState() => _MyStatefulState();
}

class _MyStatefulState extends State<MyStateful> {
  // String _title = "Stateful Example";
  // Color _clr = Colors.lime;
  bool _dark = false;
  bool _show = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Container(
        color: _dark ? Colors.white : Colors.black,
      ),
      floatingActionButton: _show ? _buildFloating() : null,
    );
  }

  _buildFloating() {
    return FloatingActionButton(
      onPressed: () {
        setState(() {
          _dark = !_dark;
        });
      },
      child: const Icon(Icons.change_circle_outlined),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.indigo,
      title: Text(
        "Stateful Example",
        style: const TextStyle(
          color: Colors.white,
          fontSize: 30,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            setState(() {});
            // print("setting clicked");
          },
          icon: const Icon(
            Icons.settings,
            color: Colors.white,
          ),
        ),
        IconButton(
          icon: const Icon(
            Icons.change_circle,
            color: Colors.white,
          ),
          onPressed: () {
            setState(() {
              // _show = !_show;
              _dark = !_dark;
            });
          },
        )
      ],
    );
  }
}
