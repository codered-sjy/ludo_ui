import 'package:flutter/material.dart';

class InnerTriangleWidget extends StatelessWidget {

  final CustomClipper<Path> clipper;
  final Color color;

  const InnerTriangleWidget({Key? key, required this.clipper, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: clipper,
      child: AspectRatio(
          aspectRatio: 1,
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black), color: color),
          )),
    );
  }
}
