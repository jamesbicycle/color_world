import 'package:flutter/material.dart';
import '../coloring_page.dart';

ColoringPage createRainbowPage() {
  return ColoringPage(
    name: 'Magic Rainbow',
    description: 'A beautiful rainbow with clouds and stars!',
    difficulty: 'Medium',
    width: 350,
    height: 250,
    paths: [
      // Rainbow arcs (7 colors)
      ...List.generate(7, (i) {
        final path = Path();
        final rect = Rect.fromCenter(
          center: const Offset(175, 200),
          width: 280 - (i * 15),
          height: 280 - (i * 15),
        );
        path.addArc(rect, 3.14159, 3.14159); // Half circle
        return path;
      }),
      // Left cloud
      Path()..addOval(
        Rect.fromCenter(center: const Offset(50, 180), width: 30, height: 20),
      ),
      Path()..addOval(
        Rect.fromCenter(center: const Offset(65, 175), width: 25, height: 18),
      ),
      Path()..addOval(
        Rect.fromCenter(center: const Offset(35, 175), width: 20, height: 15),
      ),
      // Right cloud
      Path()..addOval(
        Rect.fromCenter(center: const Offset(300, 180), width: 30, height: 20),
      ),
      Path()..addOval(
        Rect.fromCenter(center: const Offset(285, 175), width: 25, height: 18),
      ),
      Path()..addOval(
        Rect.fromCenter(center: const Offset(315, 175), width: 20, height: 15),
      ),
      // Stars
      ...List.generate(5, (i) {
        final positions = [
          const Offset(100, 80),
          const Offset(180, 60),
          const Offset(250, 75),
          const Offset(140, 40),
          const Offset(220, 35),
        ];
        final path = Path();
        final center = positions[i];
        // Simple star shape
        for (int j = 0; j < 5; j++) {
          final x = center.dx + 8 * (j % 2 == 0 ? 1 : 0.4);
          final y = center.dy + 8 * (j % 2 == 0 ? 1 : 0.4);
          if (j == 0) {
            path.moveTo(x, y - 8);
          } else {
            path.lineTo(
              center.dx +
                  (j % 2 == 0 ? 8 : 3) *
                      (j == 1 ? 0.6 : (j == 2 ? -0.6 : (j == 3 ? -0.6 : 0.6))),
              center.dy +
                  (j % 2 == 0 ? 8 : 3) *
                      (j == 1 ? -0.6 : (j == 2 ? 0.2 : (j == 3 ? 0.2 : -0.6))) *
                      (j < 3 ? 1 : -1),
            );
          }
        }
        path.close();
        return path;
      }),
    ],
  );
}
