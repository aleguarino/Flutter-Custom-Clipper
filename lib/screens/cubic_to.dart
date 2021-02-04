import 'package:flutter/material.dart';

class CubicToScreen extends StatefulWidget {
  @override
  _CubicToScreenState createState() => _CubicToScreenState();
}

class _CubicToScreenState extends State<CubicToScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ClipPath(
          clipper: CubicToClipper(),
          child: Container(
            width: double.infinity,
            height: 300,
            color: Colors.redAccent,
          ),
        ),
      ),
    );
  }
}

class CubicToClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    final n1 = Offset(size.width * 0.25, 0);
    final n2 = Offset(size.width * 0.7, size.height * 1.25);
    path.lineTo(0, size.height);
    // Generate bezier curves online
    // https://www.desmos.com/calculator/cahqdxeshd?lang=es
    path.cubicTo(n1.dx, n1.dy, n2.dx, n2.dy, size.width, size.height * 0.7);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
