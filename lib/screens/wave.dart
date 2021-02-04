import 'package:clippers_demo/widgets/wave_header.dart';
import 'package:flutter/material.dart';

class WaveScreen extends StatefulWidget {
  @override
  _WaveScreenState createState() => _WaveScreenState();
}

class _WaveScreenState extends State<WaveScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [WaveHeader()],
        ),
      ),
    );
  }
}
