import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/coloring_provider.dart';
import '../models/world_color.dart';

class ColorPalette extends StatelessWidget {
  const ColorPalette({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          // Header with selected color info
          Consumer<ColoringProvider>(
            builder: (context, provider, child) {
              final selectedWorldColor = WorldColors.colors.firstWhere(
                (worldColor) =>
                    worldColor.color.value == provider.selectedColor.value,
                orElse: () => const WorldColor(
                  name: 'Custom Color',
                  color: Colors.red,
                  country: 'Unknown',
                  description: 'A beautiful color',
                  emoji: '🎨',
                ),
              );

              return Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: Row(
                  children: [
                    // Selected color circle
                    Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        color: provider.selectedColor,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.grey.shade400,
                          width: 2,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    // Color info
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${selectedWorldColor.emoji} ${selectedWorldColor.name}',
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF2D3436),
                            ),
                          ),
                          Text(
                            'From ${selectedWorldColor.country}',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),

          const Divider(height: 1),

          // Color grid
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                scrollDirection: Axis.horizontal,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.0,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemCount: WorldColors.colors.length,
                itemBuilder: (context, index) {
                  final worldColor = WorldColors.colors[index];

                  return Consumer<ColoringProvider>(
                    builder: (context, provider, child) {
                      final isSelected =
                          provider.selectedColor.value ==
                          worldColor.color.value;

                      return GestureDetector(
                        onTap: () {
                          provider.selectColor(worldColor.color);

                          // Show a brief info snackbar
                          ScaffoldMessenger.of(context).hideCurrentSnackBar();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                '${worldColor.emoji} ${worldColor.name} - ${worldColor.description}',
                                style: const TextStyle(fontSize: 14),
                              ),
                              duration: const Duration(milliseconds: 800),
                              backgroundColor: worldColor.color.withOpacity(
                                0.9,
                              ),
                              behavior: SnackBarBehavior.floating,
                              margin: const EdgeInsets.all(16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          );
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          decoration: BoxDecoration(
                            color: worldColor.color,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: isSelected
                                  ? Colors.black
                                  : Colors.grey.shade300,
                              width: isSelected ? 3 : 2,
                            ),
                            boxShadow: isSelected
                                ? [
                                    BoxShadow(
                                      color: worldColor.color.withOpacity(0.5),
                                      blurRadius: 8,
                                      offset: const Offset(0, 2),
                                    ),
                                  ]
                                : [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      blurRadius: 2,
                                      offset: const Offset(0, 1),
                                    ),
                                  ],
                          ),
                          child: isSelected
                              ? const Icon(
                                  Icons.check,
                                  color: Colors.white,
                                  size: 16,
                                  shadows: [
                                    Shadow(
                                      offset: Offset(1, 1),
                                      blurRadius: 2,
                                      color: Colors.black26,
                                    ),
                                  ],
                                )
                              : null,
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
