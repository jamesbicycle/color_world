import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/coloring_provider.dart';

import '../widgets/coloring_canvas.dart';
import '../widgets/color_palette.dart';

class ColoringScreen extends StatelessWidget {
  const ColoringScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Consumer<ColoringProvider>(
          builder: (context, provider, child) {
            return Text(
              provider.currentPage.name,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            );
          },
        ),
        actions: [
          // Progress indicator
          Consumer<ColoringProvider>(
            builder: (context, provider, child) {
              final progress = provider.getPageProgress();
              return Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(
                      '${(progress * 100).toInt()}%',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),

          // Menu button
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert, color: Colors.white),
            onSelected: (value) {
              final provider = Provider.of<ColoringProvider>(
                context,
                listen: false,
              );
              switch (value) {
                case 'clear_page':
                  _showClearPageDialog(context, provider);
                  break;
                case 'page_info':
                  _showPageInfoDialog(context, provider);
                  break;
              }
            },
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'clear_page',
                child: Row(
                  children: [
                    Icon(Icons.clear, color: Colors.red),
                    SizedBox(width: 8),
                    Text('Clear Page'),
                  ],
                ),
              ),
              const PopupMenuItem(
                value: 'page_info',
                child: Row(
                  children: [
                    Icon(Icons.info, color: Colors.blue),
                    SizedBox(width: 8),
                    Text('Page Info'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          // Coloring Canvas
          Expanded(
            flex: 3,
            child: Container(
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: const ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                child: ColoringCanvas(),
              ),
            ),
          ),

          // Instructions
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.blue.shade200),
            ),
            child: Row(
              children: [
                Icon(Icons.info_outline, color: Colors.blue.shade600, size: 20),
                const SizedBox(width: 8),
                const Expanded(
                  child: Text(
                    'Pick a color below, then tap on the picture to fill it in!',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF2D3436),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Color Palette
          const ColorPalette(),

          const SizedBox(height: 16),
        ],
      ),
    );
  }

  void _showClearPageDialog(BuildContext context, ColoringProvider provider) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Row(
          children: [
            Icon(Icons.warning, color: Colors.orange),
            SizedBox(width: 8),
            Text('Clear Page'),
          ],
        ),
        content: const Text(
          'Are you sure you want to clear all colors from this page? This cannot be undone.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              provider.clearPage();
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Page cleared!'),
                  backgroundColor: Colors.orange,
                ),
              );
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
            child: const Text('Clear', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  void _showPageInfoDialog(BuildContext context, ColoringProvider provider) {
    final page = provider.currentPage;
    final progress = provider.getPageProgress();
    final isComplete = provider.isPageComplete();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(page.name),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(page.description, style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 16),
            Row(
              children: [
                const Icon(Icons.auto_awesome, color: Colors.purple),
                const SizedBox(width: 8),
                Text('Difficulty: ${page.difficulty}'),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.palette, color: Colors.blue),
                const SizedBox(width: 8),
                Text('Sections: ${page.paths.length}'),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Icon(
                  isComplete
                      ? Icons.check_circle
                      : Icons.radio_button_unchecked,
                  color: isComplete ? Colors.green : Colors.grey,
                ),
                const SizedBox(width: 8),
                Text('Progress: ${(progress * 100).toInt()}%'),
              ],
            ),
            if (isComplete) ...[
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.green.shade50,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.green.shade200),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.star, color: Colors.amber),
                    SizedBox(width: 8),
                    Text(
                      'Congratulations! You completed this page!',
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }
}
