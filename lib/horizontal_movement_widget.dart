import 'package:flutter/material.dart';
import 'package:ludo_ui/inner_square_widget.dart';

class HorizontalMovementSquareWidget extends StatelessWidget {
  final HorizontalPosition position;
  final Color color;

  const HorizontalMovementSquareWidget({Key? key, required this.position, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AspectRatio(
          aspectRatio: 2,
          child: Column(
              children: List.generate(
                  3,
                  (columnIndex) => Row(
                          children: List.generate(6, (rowIndex) {
                        if (position == HorizontalPosition.left) {
                          if ((columnIndex == 0 && rowIndex == 1) ||
                              (columnIndex == 1 && rowIndex > 0)) {
                            return InnerWidget(
                              aspectRatio: 1,
                              flex: 1,
                              color: color,
                            );
                          }
                          return const InnerWidget(aspectRatio: 1, flex: 1);
                        } else {
                          if ((columnIndex == 2 && rowIndex == 4) ||
                              (columnIndex == 1 && rowIndex < 5)) {
                            return InnerWidget(
                              aspectRatio: 1,
                              flex: 1,
                              color: color,
                            );
                          }
                          return const InnerWidget(aspectRatio: 1, flex: 1);
                        }
                      }))))),
      flex: 2,
    );
  }
}

enum HorizontalPosition { left, right }
