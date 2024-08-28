import 'package:flutter/material.dart';
import 'package:flutter_custom_paint_on_background/custom_painter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Offset mouseOffset = Offset.zero;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MouseRegion(
        onHover: (event) {
          setState(() {
            mouseOffset = event.localPosition;
          });
        },
        child: CustomPaint(
          painter: BackgroundPainter(offset: mouseOffset),
          child: const Center(
            child: Text('Home'),
          ),
        ),
      ),
    );
  }
}
