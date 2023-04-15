import 'package:flutter/material.dart';
import 'package:kangsudal_mini/screens/bookmark_screen.dart';

class DetailScreen extends StatelessWidget {
  Stock stock;

  DetailScreen({
    required this.stock,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: ListView(
        children: [],
      ),
    );
  }
}
