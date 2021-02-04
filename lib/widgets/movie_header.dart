import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MovieHeader extends StatefulWidget {
  @override
  _MovieHeaderState createState() => _MovieHeaderState();
}

class _MovieHeaderState extends State<MovieHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AspectRatio(
              aspectRatio: 16 / 11,
              child: ClipPath(
                clipper: BezierClipper(),
                child: Container(
                  width: double.infinity,
                  color: Colors.blueAccent,
                  child: Image.asset(
                    'assets/film.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Transform.translate(
              offset: Offset(0, -30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CupertinoButton(
                    child: Icon(
                      Icons.add,
                      color: Colors.black,
                    ),
                    onPressed: () {},
                  ),
                  CupertinoButton(
                    pressedOpacity: 0.8,
                    padding: EdgeInsets.zero,
                    child: Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black45,
                              blurRadius: 5,
                              offset: Offset(0, 2),
                            )
                          ],
                        ),
                        child: Icon(
                          Icons.play_arrow,
                          color: Colors.redAccent,
                        )),
                    onPressed: () {},
                  ),
                  CupertinoButton(
                    child: Icon(
                      Icons.share,
                      color: Colors.black,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}

class BezierClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final p0 = Offset(0, size.height * 0.9);
    final p1 = Offset(size.width / 2, size.height * 1.09);
    final p2 = Offset(size.width, size.height * 0.9);
    final path = Path();
    path.lineTo(p0.dx, p0.dy);
    path.quadraticBezierTo(p1.dx, p1.dy, p2.dx, p2.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
