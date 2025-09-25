import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/coloring_provider.dart';

import 'coloring_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF74B9FF), Color(0xFF0984E3)],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    const Text(
                      '🌈 Color World 🌈',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            offset: Offset(2, 2),
                            blurRadius: 4,
                            color: Colors.black26,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Explore colors from around the world!',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Consumer<ColoringProvider>(
                      builder: (context, provider, child) {
                        final progress = provider.getOverallProgress();
                        return Column(
                          children: [
                            Text(
                              'Overall Progress: ${(progress * 100).toInt()}%',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 8),
                            LinearProgressIndicator(
                              value: progress,
                              backgroundColor: Colors.white.withOpacity(0.3),
                              valueColor: const AlwaysStoppedAnimation<Color>(
                                Colors.yellow,
                              ),
                              minHeight: 6,
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),

              // Coloring Pages Grid
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Choose a Coloring Page:',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF2D3436),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Expanded(
                          child: Consumer<ColoringProvider>(
                            builder: (context, provider, child) {
                              return GridView.builder(
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      childAspectRatio: 0.8,
                                      crossAxisSpacing: 16,
                                      mainAxisSpacing: 16,
                                    ),
                                itemCount: provider.pages.length,
                                itemBuilder: (context, index) {
                                  final page = provider.pages[index];
                                  final coloredSections = page.colors
                                      .where((color) => color != null)
                                      .length;
                                  final progress =
                                      coloredSections / page.colors.length;
                                  final isComplete = progress == 1.0;

                                  return GestureDetector(
                                    onTap: () {
                                      provider.selectPage(index);
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const ColoringScreen(),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black.withOpacity(
                                              0.1,
                                            ),
                                            blurRadius: 8,
                                            offset: const Offset(0, 4),
                                          ),
                                        ],
                                        gradient: LinearGradient(
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                          colors: isComplete
                                              ? [
                                                  Colors.green.shade100,
                                                  Colors.green.shade200,
                                                ]
                                              : [
                                                  Colors.blue.shade50,
                                                  Colors.purple.shade50,
                                                ],
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            // Difficulty badge
                                            Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                    horizontal: 8,
                                                    vertical: 4,
                                                  ),
                                              decoration: BoxDecoration(
                                                color: _getDifficultyColor(
                                                  page.difficulty,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
                                              child: Text(
                                                page.difficulty,
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),

                                            const SizedBox(height: 8),

                                            // Page preview (simple representation)
                                            Expanded(
                                              child: Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  border: Border.all(
                                                    color: Colors.grey.shade300,
                                                    width: 2,
                                                  ),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    _getPageEmoji(page.name),
                                                    style: const TextStyle(
                                                      fontSize: 40,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),

                                            const SizedBox(height: 8),

                                            // Page name
                                            Text(
                                              page.name,
                                              style: const TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xFF2D3436),
                                              ),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),

                                            const SizedBox(height: 4),

                                            // Progress
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: LinearProgressIndicator(
                                                    value: progress,
                                                    backgroundColor:
                                                        Colors.grey.shade200,
                                                    valueColor:
                                                        AlwaysStoppedAnimation<
                                                          Color
                                                        >(
                                                          isComplete
                                                              ? Colors.green
                                                              : Colors.blue,
                                                        ),
                                                    minHeight: 4,
                                                  ),
                                                ),
                                                const SizedBox(width: 8),
                                                Text(
                                                  '${(progress * 100).toInt()}%',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.grey.shade600,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ],
                                            ),

                                            if (isComplete)
                                              const Padding(
                                                padding: EdgeInsets.only(
                                                  top: 4,
                                                ),
                                                child: Row(
                                                  children: [
                                                    Icon(
                                                      Icons.star,
                                                      color: Colors.amber,
                                                      size: 16,
                                                    ),
                                                    SizedBox(width: 4),
                                                    Text(
                                                      'Complete!',
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                        color: Colors.green,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _getDifficultyColor(String difficulty) {
    switch (difficulty.toLowerCase()) {
      case 'easy':
        return Colors.green;
      case 'medium':
        return Colors.orange;
      case 'hard':
        return Colors.red;
      default:
        return Colors.blue;
    }
  }

  String _getPageEmoji(String pageName) {
    switch (pageName.toLowerCase()) {
      case 'beautiful flower':
        return '🌸';
      case 'happy butterfly':
        return '🦋';
      case 'cozy house':
        return '🏠';
      case 'magic rainbow':
        return '🌈';
      case 'ocean adventure':
        return '🐠';
      case 'magical garden':
        return '🌺';
      case 'enchanted mermaid':
        return '🧜‍♀️';
      default:
        return '🎨';
    }
  }
}
