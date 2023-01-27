import 'package:flutter/material.dart';

class InnerWidget extends StatelessWidget {

  final double aspectRatio;
  final int flex;
  final Color color;

  const InnerWidget({Key? key, this.aspectRatio = 0.5, this.flex = 1, this.color = Colors.white}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AspectRatio(
          aspectRatio: aspectRatio,
          child: Container(
              decoration: BoxDecoration(
                  color: color,
                  border: Border.all(color: Colors.black, width: 0.5)))),
      flex: flex,
    );
  }
}

