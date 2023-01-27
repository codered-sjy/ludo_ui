import 'package:flutter/material.dart';

class CornerWidget extends StatelessWidget {
  final Color color;
  final int? flex;

  const CornerWidget({Key? key, required this.color, this.flex = 1}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: AspectRatio(
            aspectRatio: 1.0,
            child: Container(
              child: Container(
                margin: const EdgeInsets.all(20),
                child: GridView.count(
                    crossAxisCount: 2,
                    children: List.generate(
                      4,
                      (index) => Container(
                        margin: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: color,
                              border: Border.all(color: Colors.black))),
                    )),
                decoration: BoxDecoration(
                    color: Colors.white, border: Border.all(color: Colors.black, width: 0.8)),
              ),
              decoration:
                  BoxDecoration(color: color, border: Border.all(color: Colors.black, width: 0.5)),
            )),
        flex: flex!);
  }
}
