import 'package:flutter/material.dart';
import 'package:ludo_ui/inner_square_widget.dart';

class VerticalMovementSquareWidget extends StatelessWidget {
  final VerticalPosition position;
  final Color color;

  const VerticalMovementSquareWidget({Key? key, required this.position, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AspectRatio(
          aspectRatio: 0.5,
          child: Column(
            children: List.generate(
              6,
              (columnIndex) => Row(
                  children: List.generate(
                3,
                (rowIndex) {
                  if(position == VerticalPosition.top) {
                    if ((columnIndex == 1 && rowIndex == 2) || (columnIndex > 0 && rowIndex == 1)) {
                      return InnerWidget(aspectRatio: 1, flex: 1, color: color);
                    }
                  } else {
                    if ((columnIndex == 4 && rowIndex == 0) || (columnIndex < 5 && rowIndex == 1)) {
                      return InnerWidget(aspectRatio: 1, flex: 1, color: color);
                    }
                  }
                  return const InnerWidget(aspectRatio: 1, flex: 1);
                },
              )),
            ),
          )),
      flex: 1,
    );
  }
}

enum VerticalPosition { top, bottom }
