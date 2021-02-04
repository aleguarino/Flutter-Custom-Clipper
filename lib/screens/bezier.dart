import 'package:clippers_demo/widgets/movie_header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BezierScreen extends StatefulWidget {
  @override
  _BezierScreenState createState() => _BezierScreenState();
}

class _BezierScreenState extends State<BezierScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [MovieHeader()],
          )),
    );
  }
}
