import 'package:flutter/material.dart';
import '../coloring_page.dart';
import 'dart:math' as math;

ColoringPage createMermaidPage() {
  return ColoringPage(
    name: 'Enchanted Mermaid',
    description:
        'A beautiful mermaid with flowing hair, detailed scales, and underwater treasures!',
    difficulty: 'Hard',
    width: 400,
    height: 500,
    paths: [
      // Ocean floor
      Path()
        ..moveTo(0, 420)
        ..quadraticBezierTo(100, 410, 200, 415)
        ..quadraticBezierTo(300, 420, 400, 415)
        ..lineTo(400, 500)
        ..lineTo(0, 500)
        ..close(),

      // Mermaid's tail (main body)
      Path()
        ..moveTo(180, 320)
        ..quadraticBezierTo(160, 340, 165, 370)
        ..quadraticBezierTo(170, 400, 180, 420)
        ..quadraticBezierTo(200, 430, 220, 420)
        ..quadraticBezierTo(230, 400, 235, 370)
        ..quadraticBezierTo(240, 340, 220, 320)
        ..close(),

      // Tail fin (left side)
      Path()
        ..moveTo(165, 415)
        ..quadraticBezierTo(140, 430, 130, 450)
        ..quadraticBezierTo(125, 470, 140, 480)
        ..quadraticBezierTo(160, 475, 180, 465)
        ..lineTo(180, 420)
        ..close(),

      // Tail fin (right side)
      Path()
        ..moveTo(235, 415)
        ..quadraticBezierTo(260, 430, 270, 450)
        ..quadraticBezierTo(275, 470, 260, 480)
        ..quadraticBezierTo(240, 475, 220, 465)
        ..lineTo(220, 420)
        ..close(),

      // Tail scales (decorative lines)
      ...List.generate(12, (i) {
        final path = Path();
        final y = 330.0 + (i * 8.0);
        final leftX = 180.0 - (5.0 + (i * 0.5));
        final rightX = 220.0 + (5.0 + (i * 0.5));
        path.moveTo(leftX, y);
        path.quadraticBezierTo(200.0, y - 3.0, rightX, y);
        return path;
      }),

      // Torso
      Path()
        ..moveTo(185, 200)
        ..quadraticBezierTo(175, 220, 175, 250)
        ..quadraticBezierTo(178, 280, 185, 310)
        ..quadraticBezierTo(200, 320, 215, 310)
        ..quadraticBezierTo(222, 280, 225, 250)
        ..quadraticBezierTo(225, 220, 215, 200)
        ..close(),

      // Arms (left)
      Path()
        ..moveTo(175, 210)
        ..quadraticBezierTo(155, 215, 145, 230)
        ..quadraticBezierTo(140, 245, 145, 260)
        ..quadraticBezierTo(150, 275, 160, 280)
        ..quadraticBezierTo(170, 278, 175, 270)
        ..quadraticBezierTo(178, 250, 175, 230)
        ..close(),

      // Arms (right)
      Path()
        ..moveTo(225, 210)
        ..quadraticBezierTo(245, 215, 255, 230)
        ..quadraticBezierTo(260, 245, 255, 260)
        ..quadraticBezierTo(250, 275, 240, 280)
        ..quadraticBezierTo(230, 278, 225, 270)
        ..quadraticBezierTo(222, 250, 225, 230)
        ..close(),

      // Hands (left)
      Path()..addOval(
        Rect.fromCenter(center: const Offset(150, 275), width: 12, height: 15),
      ),

      // Hands (right)
      Path()..addOval(
        Rect.fromCenter(center: const Offset(250, 275), width: 12, height: 15),
      ),

      // Head
      Path()..addOval(
        Rect.fromCenter(center: const Offset(200, 170), width: 45, height: 50),
      ),

      // Hair (flowing locks - multiple curved paths)
      ...List.generate(8, (i) {
        final path = Path();
        final startX = 175.0 + (i * 6.0);
        final startY = 145.0;
        path.moveTo(startX, startY);
        path.quadraticBezierTo(
          startX - 10.0 + (i * 2.0),
          startY - 20.0 - (i * 3.0),
          startX - 15.0 + (i * 3.0),
          startY - 40.0 - (i * 2.0),
        );
        path.quadraticBezierTo(
          startX - 20.0 + (i * 4.0),
          startY - 60.0 - (i * 1.0),
          startX - 10.0 + (i * 2.0),
          startY - 80.0 + (i * 1.0),
        );
        return path;
      }),

      // Additional flowing hair strands
      ...List.generate(6, (i) {
        final path = Path();
        final startX = 180.0 + (i * 8.0);
        final startY = 150.0;
        path.moveTo(startX, startY);
        path.quadraticBezierTo(
          startX + 15.0 - (i * 3.0),
          startY - 15.0 - (i * 2.0),
          startX + 25.0 - (i * 4.0),
          startY - 35.0 - (i * 3.0),
        );
        path.quadraticBezierTo(
          startX + 30.0 - (i * 5.0),
          startY - 55.0 - (i * 2.0),
          startX + 20.0 - (i * 3.0),
          startY - 75.0 + (i * 2.0),
        );
        return path;
      }),

      // Eyes (left)
      Path()..addOval(
        Rect.fromCenter(center: const Offset(190, 165), width: 8, height: 6),
      ),

      // Eyes (right)
      Path()..addOval(
        Rect.fromCenter(center: const Offset(210, 165), width: 8, height: 6),
      ),

      // Nose
      Path()
        ..moveTo(200, 170)
        ..lineTo(198, 175)
        ..lineTo(202, 175)
        ..close(),

      // Mouth (smiling)
      Path()
        ..moveTo(195, 180)
        ..quadraticBezierTo(200, 185, 205, 180),

      // Seashell bra (left)
      Path()
        ..moveTo(180, 200)
        ..quadraticBezierTo(175, 190, 170, 195)
        ..quadraticBezierTo(165, 205, 175, 215)
        ..quadraticBezierTo(185, 210, 190, 200)
        ..close(),

      // Seashell bra (right)
      Path()
        ..moveTo(220, 200)
        ..quadraticBezierTo(225, 190, 230, 195)
        ..quadraticBezierTo(235, 205, 225, 215)
        ..quadraticBezierTo(215, 210, 210, 200)
        ..close(),

      // Seashell details (ridges)
      ...List.generate(3, (i) {
        final leftPath = Path();
        leftPath.moveTo(172 + (i * 3), 198 + (i * 2));
        leftPath.lineTo(185 - (i * 2), 208 - (i * 2));

        final rightPath = Path();
        rightPath.moveTo(228 - (i * 3), 198 + (i * 2));
        rightPath.lineTo(215 + (i * 2), 208 - (i * 2));

        return [leftPath, rightPath];
      }).expand((x) => x),

      // Pearl necklace
      ...List.generate(7, (i) {
        return Path()..addOval(
          Rect.fromCenter(
            center: Offset(185 + (i * 5), 185),
            width: 4,
            height: 4,
          ),
        );
      }),

      // Starfish on head (decorative)
      Path()
        ..moveTo(210, 140)
        ..lineTo(215, 130)
        ..lineTo(225, 135)
        ..lineTo(220, 145)
        ..lineTo(225, 155)
        ..lineTo(210, 150)
        ..lineTo(195, 155)
        ..lineTo(200, 145)
        ..lineTo(195, 135)
        ..lineTo(205, 130)
        ..close(),

      // Coral formations (left side)
      Path()
        ..moveTo(30, 420)
        ..quadraticBezierTo(25, 390, 35, 360)
        ..quadraticBezierTo(45, 330, 40, 300)
        ..quadraticBezierTo(50, 280, 60, 300)
        ..quadraticBezierTo(55, 330, 65, 360)
        ..quadraticBezierTo(70, 390, 65, 420)
        ..close(),

      // Coral formations (right side)
      Path()
        ..moveTo(370, 420)
        ..quadraticBezierTo(365, 380, 375, 340)
        ..quadraticBezierTo(385, 300, 380, 260)
        ..quadraticBezierTo(390, 240, 395, 260)
        ..quadraticBezierTo(390, 300, 400, 340)
        ..lineTo(395, 380)
        ..lineTo(390, 420)
        ..close(),

      // Sea anemone
      ...List.generate(12, (i) {
        final path = Path();
        final angle = (i * math.pi * 2) / 12;
        final centerX = 100.0;
        final centerY = 400.0;
        final length = 25 + (i % 3) * 5;

        path.moveTo(centerX, centerY);
        path.quadraticBezierTo(
          centerX + (length * 0.7) * math.cos(angle),
          centerY + (length * 0.7) * math.sin(angle) - 10,
          centerX + length * math.cos(angle),
          centerY + length * math.sin(angle),
        );
        return path;
      }),

      // Treasure chest
      Path()..addRect(const Rect.fromLTWH(320, 390, 35, 25)),

      // Treasure chest lid
      Path()
        ..moveTo(320, 390)
        ..quadraticBezierTo(337, 380, 355, 390)
        ..lineTo(355, 395)
        ..quadraticBezierTo(337, 385, 320, 395)
        ..close(),

      // Treasure (gems/coins)
      ...List.generate(5, (i) {
        return Path()..addOval(
          Rect.fromCenter(
            center: Offset(325 + (i * 5), 395 + (i % 2) * 3),
            width: 3,
            height: 3,
          ),
        );
      }),

      // Seaweed (flowing plants)
      ...List.generate(4, (i) {
        final path = Path();
        final baseX = 280.0 + (i * 15.0);
        path.moveTo(baseX, 420.0);
        path.quadraticBezierTo(baseX + 5.0, 380.0, baseX - 5.0, 340.0);
        path.quadraticBezierTo(baseX + 8.0, 300.0, baseX - 3.0, 260.0);
        path.quadraticBezierTo(baseX + 6.0, 220.0, baseX, 180.0);
        return path;
      }),

      // Bubbles (various sizes)
      ...List.generate(15, (i) {
        final positions = [
          const Offset(80, 320),
          const Offset(95, 300),
          const Offset(85, 280),
          const Offset(300, 350),
          const Offset(315, 330),
          const Offset(305, 310),
          const Offset(120, 250),
          const Offset(130, 230),
          const Offset(115, 210),
          const Offset(270, 280),
          const Offset(285, 260),
          const Offset(275, 240),
          const Offset(350, 280),
          const Offset(360, 260),
          const Offset(340, 240),
        ];
        return Path()..addOval(
          Rect.fromCenter(
            center: positions[i],
            width: 4 + (i % 4) * 2,
            height: 4 + (i % 4) * 2,
          ),
        );
      }),

      // Small fish swimming around
      ...List.generate(6, (i) {
        final positions = [
          const Offset(50, 200),
          const Offset(340, 180),
          const Offset(70, 150),
          const Offset(320, 220),
          const Offset(90, 180),
          const Offset(300, 160),
        ];
        final fishPaths = <Path>[];

        // Fish body
        fishPaths.add(
          Path()..addOval(
            Rect.fromCenter(center: positions[i], width: 12, height: 8),
          ),
        );

        // Fish tail
        final tailPath = Path();
        if (i % 2 == 0) {
          // Fish facing right
          tailPath.moveTo(positions[i].dx - 6, positions[i].dy);
          tailPath.lineTo(positions[i].dx - 12, positions[i].dy - 4);
          tailPath.lineTo(positions[i].dx - 12, positions[i].dy + 4);
        } else {
          // Fish facing left
          tailPath.moveTo(positions[i].dx + 6, positions[i].dy);
          tailPath.lineTo(positions[i].dx + 12, positions[i].dy - 4);
          tailPath.lineTo(positions[i].dx + 12, positions[i].dy + 4);
        }
        tailPath.close();
        fishPaths.add(tailPath);

        return fishPaths;
      }).expand((x) => x),

      // Sea shells scattered on the ocean floor
      ...List.generate(4, (i) {
        final positions = [
          const Offset(150, 440),
          const Offset(250, 435),
          const Offset(200, 445),
          const Offset(300, 440),
        ];
        return Path()
          ..moveTo(positions[i].dx, positions[i].dy)
          ..quadraticBezierTo(
            positions[i].dx - 8,
            positions[i].dy - 5,
            positions[i].dx,
            positions[i].dy - 10,
          )
          ..quadraticBezierTo(
            positions[i].dx + 8,
            positions[i].dy - 5,
            positions[i].dx,
            positions[i].dy,
          )
          ..close();
      }),
    ],
  );
}
