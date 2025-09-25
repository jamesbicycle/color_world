import 'package:flutter/material.dart';
import '../coloring_page.dart';

ColoringPage createButterflyPage() {
  return ColoringPage(
    name: 'Happy Butterfly',
    description: 'A cheerful butterfly ready to fly!',
    difficulty: 'Easy',
    width: 300,
    height: 300,
    paths: [
      // Body
      Path()..addOval(
        Rect.fromCenter(center: const Offset(150, 150), width: 8, height: 80),
      ),
      // Head
      Path()..addOval(
        Rect.fromCenter(center: const Offset(150, 120), width: 15, height: 15),
      ),
      // Left upper wing
      Path()..addOval(
        Rect.fromCenter(center: const Offset(120, 130), width: 40, height: 50),
      ),
      // Right upper wing
      Path()..addOval(
        Rect.fromCenter(center: const Offset(180, 130), width: 40, height: 50),
      ),
      // Left lower wing
      Path()..addOval(
        Rect.fromCenter(center: const Offset(125, 160), width: 30, height: 35),
      ),
      // Right lower wing
      Path()..addOval(
        Rect.fromCenter(center: const Offset(175, 160), width: 30, height: 35),
      ),
      // Antennae
      Path()..addOval(
        Rect.fromCenter(center: const Offset(145, 110), width: 3, height: 15),
      ),
      Path()..addOval(
        Rect.fromCenter(center: const Offset(155, 110), width: 3, height: 15),
      ),
    ],
  );
}
