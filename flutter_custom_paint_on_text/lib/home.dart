import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_custom_paint_on_text/custom_painter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Offset mouseOffset = Offset.zero;
  bool textHover = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(15, 23, 42, 1),
      body: MouseRegion(
        onHover: (event) {
          setState(() {
            mouseOffset = event.localPosition;
          });
        },
        child: CustomPaint(
          painter: BackgroundPainter(
            offset: mouseOffset,
            textHover: textHover,
          ),
          child: Center(
            child: MouseRegion(
              onEnter: (event) {
                setState(() {
                  textHover = true;
                });
              },
              onExit: (event) {
                setState(() {
                  textHover = false;
                });
              },
              child: Text(
                'Lorem Ipsum is simply dummy text of the printing and typesetting industry. ',
                style: TextStyle(
                  fontSize: 35,
                  foreground: Paint()
                    ..shader = ui.Gradient.radial(
                      mouseOffset,
                      50,
                      [
                        textHover ? Colors.white : Colors.transparent,
                        Colors.transparent,
                      ],
                      [0.95, 1.0],
                    ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
