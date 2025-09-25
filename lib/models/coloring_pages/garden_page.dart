import 'package:flutter/material.dart';
import '../coloring_page.dart';

ColoringPage createGardenPage() {
  return ColoringPage(
    name: 'Magical Garden',
    description:
        'A wonderful garden full of flowers, trees, and friendly creatures!',
    difficulty: 'Hard',
    width: 400,
    height: 350,
    paths: [
      // Ground
      Path()
        ..moveTo(0, 250)
        ..quadraticBezierTo(100, 240, 200, 245)
        ..quadraticBezierTo(300, 250, 400, 245)
        ..lineTo(400, 350)
        ..lineTo(0, 350)
        ..close(),

      // Large tree trunk
      Path()..addRect(const Rect.fromLTWH(80, 180, 20, 70)),
      // Tree crown
      Path()..addOval(
        Rect.fromCenter(center: const Offset(90, 160), width: 80, height: 60),
      ),

      // Small tree
      Path()..addRect(const Rect.fromLTWH(320, 200, 12, 50)),
      Path()..addOval(
        Rect.fromCenter(center: const Offset(326, 185), width: 50, height: 40),
      ),

      // Flower bed border
      Path()
        ..moveTo(150, 250)
        ..quadraticBezierTo(200, 240, 250, 250)
        ..lineTo(250, 260)
        ..quadraticBezierTo(200, 250, 150, 260)
        ..close(),

      // Large flowers in bed
      ...List.generate(4, (i) {
        final centers = [
          const Offset(165, 255),
          const Offset(185, 250),
          const Offset(215, 255),
          const Offset(235, 252),
        ];
        final paths = <Path>[];
        // Flower center
        paths.add(
          Path()
            ..addOval(Rect.fromCenter(center: centers[i], width: 6, height: 6)),
        );
        // Petals
        for (int j = 0; j < 5; j++) {
          paths.add(
            Path()..addOval(
              Rect.fromCenter(
                center: Offset(
                  centers[i].dx +
                      8 *
                          (j == 0
                              ? 0
                              : (j == 1
                                    ? 0.7
                                    : (j == 2 ? 0.4 : (j == 3 ? -0.4 : -0.7)))),
                  centers[i].dy +
                      8 *
                          (j == 0
                              ? -1
                              : (j == 1
                                    ? -0.3
                                    : (j == 2 ? 0.8 : (j == 3 ? 0.8 : -0.3)))),
                ),
                width: 8,
                height: 8,
              ),
            ),
          );
        }
        return paths;
      }).expand((x) => x),

      // Butterfly
      Path()..addOval(
        Rect.fromCenter(center: const Offset(180, 120), width: 3, height: 20),
      ),
      Path()..addOval(
        Rect.fromCenter(center: const Offset(180, 110), width: 6, height: 6),
      ),
      Path()..addOval(
        Rect.fromCenter(center: const Offset(165, 115), width: 15, height: 20),
      ),
      Path()..addOval(
        Rect.fromCenter(center: const Offset(195, 115), width: 15, height: 20),
      ),
      Path()..addOval(
        Rect.fromCenter(center: const Offset(170, 125), width: 10, height: 12),
      ),
      Path()..addOval(
        Rect.fromCenter(center: const Offset(190, 125), width: 10, height: 12),
      ),

      // Mushrooms
      Path()..addOval(
        Rect.fromCenter(center: const Offset(120, 240), width: 16, height: 10),
      ),
      Path()..addRect(const Rect.fromLTWH(118, 240, 4, 12)),
      Path()..addOval(
        Rect.fromCenter(center: const Offset(280, 235), width: 12, height: 8),
      ),
      Path()..addRect(const Rect.fromLTWH(279, 235, 3, 10)),

      // Bird
      Path()..addOval(
        Rect.fromCenter(center: const Offset(140, 80), width: 20, height: 12),
      ),
      Path()..addOval(
        Rect.fromCenter(center: const Offset(150, 78), width: 8, height: 6),
      ),
      // Bird wings
      Path()
        ..moveTo(135, 75)
        ..quadraticBezierTo(125, 70, 130, 85)
        ..close(),
      Path()
        ..moveTo(145, 75)
        ..quadraticBezierTo(155, 70, 150, 85)
        ..close(),

      // Sun
      Path()..addOval(
        Rect.fromCenter(center: const Offset(350, 60), width: 40, height: 40),
      ),
      // Sun rays
      ...List.generate(8, (i) {
        final path = Path();
        final startX =
            350.0 +
            25.0 *
                (i == 0
                    ? 0.0
                    : (i == 1
                          ? 0.7
                          : (i == 2
                                ? 1.0
                                : (i == 3
                                      ? 0.7
                                      : (i == 4
                                            ? 0.0
                                            : (i == 5
                                                  ? -0.7
                                                  : (i == 6
                                                        ? -1.0
                                                        : -0.7)))))));
        final startY =
            60.0 +
            25.0 *
                (i == 0
                    ? -1.0
                    : (i == 1
                          ? -0.7
                          : (i == 2
                                ? 0.0
                                : (i == 3
                                      ? 0.7
                                      : (i == 4
                                            ? 1.0
                                            : (i == 5
                                                  ? 0.7
                                                  : (i == 6 ? 0.0 : -0.7)))))));
        final endX =
            350.0 +
            35.0 *
                (i == 0
                    ? 0.0
                    : (i == 1
                          ? 0.7
                          : (i == 2
                                ? 1.0
                                : (i == 3
                                      ? 0.7
                                      : (i == 4
                                            ? 0.0
                                            : (i == 5
                                                  ? -0.7
                                                  : (i == 6
                                                        ? -1.0
                                                        : -0.7)))))));
        final endY =
            60.0 +
            35.0 *
                (i == 0
                    ? -1.0
                    : (i == 1
                          ? -0.7
                          : (i == 2
                                ? 0.0
                                : (i == 3
                                      ? 0.7
                                      : (i == 4
                                            ? 1.0
                                            : (i == 5
                                                  ? 0.7
                                                  : (i == 6 ? 0.0 : -0.7)))))));

        path.moveTo(startX, startY);
        path.lineTo(endX, endY);
        return path;
      }),
    ],
  );
}
