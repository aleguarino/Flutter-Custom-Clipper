import 'package:flutter/material.dart';

class ArcToPointScreen extends StatefulWidget {
  @override
  _ArcToPointScreenState createState() => _ArcToPointScreenState();
}

class _ArcToPointScreenState extends State<ArcToPointScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              ClipPath(
                clipper: ArcToPointClipper(),
                child: Container(
                  color: Colors.blue,
                  height: 200,
                  width: double.infinity,
                  alignment: Alignment.topLeft,
                  child: SafeArea(
                    child: Row(
                      children: [
                        FlatButton(
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            onPressed: () {},
                            minWidth: 0,
                            child: Icon(
                              Icons.menu,
                              color: Colors.white,
                              size: 30,
                            ))
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}

class ArcToPointClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();

    path.lineTo(0, 110);
    path.lineTo(size.width * 0.5 - 80 - 30, 120);

    path.arcToPoint(Offset(size.width * 0.5 - 70, 150),
        radius: Radius.circular(60));

    path.arcToPoint(Offset(size.width * 0.5 - 70 + 140, 150),
        radius: Radius.circular(80), clockwise: false);

    path.arcToPoint(Offset(size.width * 0.5 - 70 + 140 + 40, 120),
        radius: Radius.circular(60));

    path.lineTo(size.width, 110);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

class TmpCipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    final rect = Rect.fromLTWH(0, 0, size.width / 2, size.height);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Rect> oldClipper) {
    return true;
  }
}
