import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/coloring_provider.dart';

class ColoringCanvas extends StatefulWidget {
  const ColoringCanvas({super.key});

  @override
  State<ColoringCanvas> createState() => _ColoringCanvasState();
}

class _ColoringCanvasState extends State<ColoringCanvas> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ColoringProvider>(
      builder: (context, provider, child) {
        final page = provider.currentPage;

        return Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.white,
          child: CustomPaint(
            painter: ColoringPainter(
              paths: page.paths,
              colors: page.colors,
              onTap: (sectionIndex) {
                provider.colorSection(sectionIndex);

                // Show completion celebration if page is completed
                if (provider.isPageComplete()) {
                  _showCompletionDialog(context);
                }
              },
            ),
            child: GestureDetector(
              onTapDown: (details) {
                // Find which section was tapped
                final renderBox = context.findRenderObject() as RenderBox;
                final localPosition = renderBox.globalToLocal(
                  details.globalPosition,
                );

                // Scale the tap position to match the drawing coordinates
                final size = renderBox.size;
                final scaleX = size.width / 400;
                final scaleY = size.height / 350;
                final scale = scaleX < scaleY ? scaleX : scaleY;

                final offsetX = (size.width - (400 * scale)) / 2;
                final offsetY = (size.height - (350 * scale)) / 2;

                final adjustedX = (localPosition.dx - offsetX) / scale;
                final adjustedY = (localPosition.dy - offsetY) / scale;
                final adjustedPosition = Offset(adjustedX, adjustedY);

                for (int i = 0; i < page.paths.length; i++) {
                  if (page.paths[i].contains(adjustedPosition)) {
                    provider.colorSection(i);

                    // Show completion celebration if page is completed
                    if (provider.isPageComplete()) {
                      _showCompletionDialog(context);
                    }
                    break;
                  }
                }
              },
            ),
          ),
        );
      },
    );
  }

  void _showCompletionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: const LinearGradient(
              colors: [Colors.purple, Colors.pink],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('🎉', style: TextStyle(fontSize: 60)),
              const SizedBox(height: 16),
              const Text(
                'Congratulations!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'You completed this coloring page!',
                style: TextStyle(fontSize: 16, color: Colors.white),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.pop(context); // Go back to home screen
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.purple,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text('Back to Gallery'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.purple,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text('Keep Coloring'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ColoringPainter extends CustomPainter {
  final List<Path> paths;
  final List<Color?> colors;
  final Function(int) onTap;

  ColoringPainter({
    required this.paths,
    required this.colors,
    required this.onTap,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // Scale the drawing to fit the canvas
    final scaleX = size.width / 400; // Assuming max width of 400
    final scaleY = size.height / 350; // Assuming max height of 350
    final scale = scaleX < scaleY ? scaleX : scaleY;

    canvas.save();

    // Center the drawing
    final offsetX = (size.width - (400 * scale)) / 2;
    final offsetY = (size.height - (350 * scale)) / 2;
    canvas.translate(offsetX, offsetY);
    canvas.scale(scale);

    // Draw each section
    for (int i = 0; i < paths.length; i++) {
      final path = paths[i];
      final color = colors[i];

      // Fill with color if colored, otherwise white
      final fillPaint = Paint()
        ..color = color ?? Colors.white
        ..style = PaintingStyle.fill;

      canvas.drawPath(path, fillPaint);

      // Draw black outline
      final outlinePaint = Paint()
        ..color = Colors.black
        ..style = PaintingStyle.stroke
        ..strokeWidth =
            2.0 /
            scale // Adjust stroke width for scaling
        ..strokeJoin = StrokeJoin.round
        ..strokeCap = StrokeCap.round;

      canvas.drawPath(path, outlinePaint);
    }

    canvas.restore();
  }

  @override
  bool shouldRepaint(ColoringPainter oldDelegate) {
    return oldDelegate.colors != colors;
  }
}

// Extension to check if a path contains a point
extension PathExtension on Path {}
