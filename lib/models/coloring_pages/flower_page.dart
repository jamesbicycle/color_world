import 'package:flutter/material.dart';
import '../coloring_page.dart';

ColoringPage createFlowerPage() {
  return ColoringPage(
    name: 'Beautiful Flower',
    description: 'A simple flower with petals - perfect for beginners!',
    difficulty: 'Easy',
    width: 300,
    height: 300,
    paths: [
      // Center
      Path()
        ..addOval(Rect.fromCircle(center: const Offset(150, 150), radius: 20)),
      // Petals
      ...List.generate(5, (i) {
        final path = Path();
        path.addOval(
          Rect.fromCircle(
            center: Offset(
              150 +
                  40 *
                      (i == 0
                          ? 0
                          : (i == 1
                                ? 0.6
                                : (i == 2 ? 0.4 : (i == 3 ? -0.4 : -0.6)))),
              150 +
                  40 *
                      (i == 0
                          ? -1
                          : (i == 1
                                ? -0.3
                                : (i == 2 ? 0.8 : (i == 3 ? 0.8 : -0.3)))),
            ),
            radius: 25,
          ),
        );
        return path;
      }),
      // Stem
      Path()..addRect(const Rect.fromLTWH(145, 200, 10, 80)),
      // Leaves
      Path()..addOval(
        Rect.fromCenter(center: const Offset(130, 220), width: 30, height: 15),
      ),
      Path()..addOval(
        Rect.fromCenter(center: const Offset(170, 240), width: 30, height: 15),
      ),
    ],
  );
}
