import 'package:flutter/material.dart';
import '../coloring_page.dart';

ColoringPage createOceanPage() {
  return ColoringPage(
    name: 'Ocean Adventure',
    description: 'Underwater world with fish, coral, and sea plants!',
    difficulty: 'Hard',
    width: 400,
    height: 350,
    paths: [
      // Sea floor
      Path()
        ..moveTo(0, 280)
        ..quadraticBezierTo(100, 270, 200, 275)
        ..quadraticBezierTo(300, 280, 400, 275)
        ..lineTo(400, 350)
        ..lineTo(0, 350)
        ..close(),

      // Fish 1 (large)
      Path()..addOval(
        Rect.fromCenter(center: const Offset(120, 150), width: 60, height: 35),
      ),
      // Fish 1 tail
      Path()
        ..moveTo(90, 150)
        ..lineTo(70, 140)
        ..lineTo(70, 160)
        ..close(),
      // Fish 1 fin
      Path()
        ..moveTo(130, 130)
        ..lineTo(140, 115)
        ..lineTo(120, 120)
        ..close(),

      // Fish 2 (medium)
      Path()..addOval(
        Rect.fromCenter(center: const Offset(280, 180), width: 40, height: 25),
      ),
      // Fish 2 tail
      Path()
        ..moveTo(300, 180)
        ..lineTo(315, 170)
        ..lineTo(315, 190)
        ..close(),

      // Fish 3 (small)
      Path()..addOval(
        Rect.fromCenter(center: const Offset(320, 120), width: 25, height: 15),
      ),
      // Fish 3 tail
      Path()
        ..moveTo(332, 120)
        ..lineTo(340, 115)
        ..lineTo(340, 125)
        ..close(),

      // Coral 1
      Path()
        ..moveTo(50, 280)
        ..quadraticBezierTo(45, 250, 50, 220)
        ..quadraticBezierTo(55, 200, 60, 180)
        ..quadraticBezierTo(65, 200, 70, 220)
        ..quadraticBezierTo(75, 250, 70, 280)
        ..close(),

      // Coral 2
      Path()
        ..moveTo(350, 280)
        ..quadraticBezierTo(345, 240, 355, 200)
        ..quadraticBezierTo(365, 240, 360, 280)
        ..close(),

      // Seaweed 1
      Path()
        ..moveTo(150, 280)
        ..quadraticBezierTo(145, 240, 155, 200)
        ..quadraticBezierTo(160, 160, 150, 120)
        ..moveTo(155, 280)
        ..quadraticBezierTo(160, 240, 150, 200)
        ..quadraticBezierTo(145, 160, 155, 120),

      // Bubbles
      ...List.generate(8, (i) {
        final positions = [
          const Offset(90, 200),
          const Offset(110, 180),
          const Offset(95, 160),
          const Offset(250, 220),
          const Offset(270, 200),
          const Offset(260, 180),
          const Offset(200, 100),
          const Offset(220, 80),
        ];
        return Path()..addOval(
          Rect.fromCenter(
            center: positions[i],
            width: 6 + (i % 3) * 3,
            height: 6 + (i % 3) * 3,
          ),
        );
      }),

      // Starfish
      Path()
        ..moveTo(200, 260)
        ..lineTo(210, 245)
        ..lineTo(225, 250)
        ..lineTo(215, 265)
        ..lineTo(220, 280)
        ..lineTo(200, 270)
        ..lineTo(180, 280)
        ..lineTo(185, 265)
        ..lineTo(175, 250)
        ..lineTo(190, 245)
        ..close(),
    ],
  );
}
