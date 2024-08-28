import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class BackgroundPainter extends CustomPainter {
  final Offset offset;
  final bool textHover;
  BackgroundPainter({
    required this.offset,
    required this.textHover,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (!textHover) {
      return;
    }

    var rect = Rect.fromLTWH(0, 0, size.width, size.height);
    canvas.drawRect(
      rect,
      Paint()
        ..shader = ui.Gradient.radial(
          offset,
          50,
          [
            Colors.orange,
            Colors.transparent,
          ],
          [0.95, 1.0],
        ),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
