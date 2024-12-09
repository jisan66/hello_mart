import 'package:flutter/material.dart';

class CustomWavePainter extends CustomPainter {
  double waveHeight;
  CustomWavePainter({required this.waveHeight});
  // Path path;
  // CustomWavePainter({required this.path});
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Colors.blue;

    Path path = Path();
    path.lineTo(0, size.height * 0.75);

    // First wave
    // path.quadraticBezierTo(
    //   size.width * 0.25, size.height, // Control point
    //   size.width * 0.5, size.height * 0.75, // End point
    // );

    // Second wave
    path.quadraticBezierTo(
      size.width * 0.5, size.height * waveHeight, // Control point
      size.width , size.height * 0.75,       // End point
    );

    path.lineTo(size.width, 0);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}