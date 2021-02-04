import 'package:flutter/material.dart';

class WaveHeader extends StatefulWidget {
  @override
  _WaveHeaderState createState() => _WaveHeaderState();
}

class _WaveHeaderState extends State<WaveHeader> {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 12 / 10,
      child: ClipPath(
        clipper: WaveClipper(),
        child: Image.asset(
          'assets/film.jpg',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final p0 = Offset(0, size.height * 0.95);
    final p1 = Offset(size.width * 0.25, size.height * 1.05);
    final p2 = Offset(size.width * 0.5, size.height * 0.92);
    final path = Path();
    path.lineTo(p0.dx, p0.dy);
    path.quadraticBezierTo(p1.dx, p1.dy, p2.dx, p2.dy);
    final q1 = Offset(size.width * 0.75, size.height * 0.8);
    final q2 = Offset(size.width, size.height * 0.9);
    path.quadraticBezierTo(q1.dx, q1.dy, q2.dx, q2.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
