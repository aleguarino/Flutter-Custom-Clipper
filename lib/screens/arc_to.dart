import 'package:flutter/material.dart';
import 'dart:math' as math;

class ArcToScreen extends StatefulWidget {
  @override
  _ArcToScreenState createState() => _ArcToScreenState();
}

class _ArcToScreenState extends State<ArcToScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _startAngle;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );
    _startAngle = Tween<double>(
      begin: 0.0,
      end: 360.0,
    ).animate(_controller);
    _startAngle.addListener(() {
      setState(() {});
    });
    _controller.repeat();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AspectRatio(
          aspectRatio: 1,
          child: Container(
            color: Colors.black12,
            child: AnimatedBuilder(
              animation: _startAngle,
              child: Container(
                color: Colors.redAccent,
                child: Image.asset('assets/flutter.jpg', fit: BoxFit.cover),
              ),
              builder: (context, child) {
                return ClipPath(
                  clipper: MyArcToClipper(
                      startAngle: _startAngle.value, sweepAngle: 90),
                  child: child,
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class MyArcToClipper extends CustomClipper<Path> {
  final double startAngle, sweepAngle;

  MyArcToClipper({
    @required this.startAngle,
    @required this.sweepAngle,
  });
  double toRadians(double degrees) {
    return degrees * math.pi / 180;
  }

  @override
  Path getClip(Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final Path path = Path();
    final rectFromCenter =
        Rect.fromCenter(center: center, height: size.height, width: size.width);
    final rectFromCircle = Rect.fromCircle(center: center, radius: 100);
    final rectFromLTWH = Rect.fromLTWH(0, 0, size.width, size.height);
    final double startAngle = toRadians(this.startAngle);
    final double sweepAngle = toRadians(this.sweepAngle);
    path.arcTo(rectFromLTWH, startAngle, sweepAngle, true);
    path.lineTo(center.dx, center.dy);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
