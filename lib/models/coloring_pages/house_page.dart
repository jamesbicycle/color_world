import 'package:flutter/material.dart';
import '../coloring_page.dart';

ColoringPage createHousePage() {
  return ColoringPage(
    name: 'Cozy House',
    description: 'A lovely house with a garden!',
    difficulty: 'Medium',
    width: 350,
    height: 300,
    paths: [
      // House base
      Path()..addRect(const Rect.fromLTWH(125, 120, 100, 100)),
      // Roof
      Path()
        ..moveTo(100, 120)
        ..lineTo(175, 80)
        ..lineTo(250, 120)
        ..close(),
      // Door
      Path()..addRect(const Rect.fromLTWH(160, 170, 30, 50)),
      // Windows
      Path()..addRect(const Rect.fromLTWH(135, 140, 20, 20)),
      Path()..addRect(const Rect.fromLTWH(195, 140, 20, 20)),
      // Chimney
      Path()..addRect(const Rect.fromLTWH(200, 70, 15, 30)),
      // Tree
      Path()..addOval(
        Rect.fromCenter(center: const Offset(80, 130), width: 40, height: 50),
      ),
      Path()..addRect(const Rect.fromLTWH(78, 155, 4, 25)),
      // Sun
      Path()..addOval(
        Rect.fromCenter(center: const Offset(280, 60), width: 30, height: 30),
      ),
      // Clouds
      Path()..addOval(
        Rect.fromCenter(center: const Offset(60, 50), width: 25, height: 15),
      ),
      Path()..addOval(
        Rect.fromCenter(center: const Offset(75, 45), width: 20, height: 12),
      ),
      // Garden flowers
      Path()..addOval(
        Rect.fromCenter(center: const Offset(100, 200), width: 8, height: 8),
      ),
      Path()..addOval(
        Rect.fromCenter(center: const Offset(120, 210), width: 8, height: 8),
      ),
      Path()..addOval(
        Rect.fromCenter(center: const Offset(260, 200), width: 8, height: 8),
      ),
    ],
  );
}
