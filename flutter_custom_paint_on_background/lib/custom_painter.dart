import 'package:flutter/material.dart';

class BackgroundPainter extends CustomPainter {
  final Offset offset;
  BackgroundPainter({
    required this.offset,
  });
  List<Color> gradientColors = [
    Color.fromRGBO(171, 79, 228, 0.435),
    Colors.transparent,
  ];

  @override
  void paint(Canvas canvas, Size size) {
    var x = offset.dx / size.width;
    var y = offset.dy / size.height;
    var gradient = RadialGradient(
      colors: gradientColors,
      tileMode: TileMode.clamp,
      radius: 0.7,
      center: Alignment(x * 2 - 1, y * 2 - 1),
      stops: const [0.01, 1.0],
    );
    var rect = Rect.fromLTWH(0, 0, size.width, size.height);
    var paint = Paint()..shader = gradient.createShader(rect);
    canvas.drawRect(rect, Paint()..color = const Color.fromRGBO(15, 23, 42, 1));
    canvas.drawRect(rect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
