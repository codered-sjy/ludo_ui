import 'package:flutter/material.dart';
import 'package:ludo_ui/corner_widget.dart';
import 'package:ludo_ui/inner_triangle_widget.dart';
import 'package:ludo_ui/inner_square_widget.dart';
import 'package:ludo_ui/horizontal_movement_widget.dart';
import 'package:ludo_ui/vertical_movement_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ludo UI',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Ludo UI'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
          child: AspectRatio(
        aspectRatio: 1.0,
        child: Column(
          children: [
            Row(
              children: const [
                CornerWidget(color: Colors.green, flex: 2),
                VerticalMovementSquareWidget(position: VerticalPosition.top, color: Colors.yellow),
                CornerWidget(color: Colors.yellow, flex: 2)
              ],
            ),
            Row(
              children: [
                const HorizontalMovementSquareWidget(
                    position: HorizontalPosition.left, color: Colors.green),
                Expanded(
                    child: Stack(
                  children: [
                    InnerTriangleWidget(clipper: TriangleBaseTopClipper(), color: Colors.yellow),
                    InnerTriangleWidget(clipper: TriangleBaseRightClipper(), color: Colors.blue),
                    InnerTriangleWidget(clipper: TriangleBaseBottomClipper(), color: Colors.red),
                    InnerTriangleWidget(clipper: TriangleBaseLeftClipper(), color: Colors.green)
                  ],
                )),
                const HorizontalMovementSquareWidget(
                    position: HorizontalPosition.right, color: Colors.blue),
              ],
            ),
            Row(
              children: const [
                CornerWidget(color: Colors.red, flex: 2),
                VerticalMovementSquareWidget(position: VerticalPosition.bottom, color: Colors.red),
                CornerWidget(color: Colors.blue, flex: 2)
              ],
            )
          ],
        ),
      )),
    );
  }
}

class TriangleBaseTopClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path()
      ..lineTo(0.0, 0.0)
      ..lineTo(size.width / 2, size.height / 2)
      ..lineTo(size.width, 0.0)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class TriangleBaseBottomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path()
      ..moveTo(0, size.height)
      ..lineTo(size.width / 2, size.height / 2)
      ..lineTo(size.width,size.height)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class TriangleBaseLeftClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path()
      ..lineTo(size.width / 2, size.height / 2)
      ..lineTo(0 ,size.height)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}


class TriangleBaseRightClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path()
    ..moveTo(size.width, 0)
      ..lineTo(size.width / 2, size.height / 2)
      ..lineTo(size.width, size.height)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}