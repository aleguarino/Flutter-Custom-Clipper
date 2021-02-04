import 'package:clippers_demo/screens/arc_to.dart';
import 'package:clippers_demo/screens/arc_to_point.dart';
import 'package:clippers_demo/screens/basic.dart';
import 'package:clippers_demo/screens/bezier.dart';
import 'package:clippers_demo/screens/cubic_to.dart';
import 'package:clippers_demo/screens/wave.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BezierScreen(),
    );
  }
}
