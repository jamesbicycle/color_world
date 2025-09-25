import 'package:flutter/material.dart';

class ColoringPage {
  final String name;
  final String description;
  final List<Path> paths;
  final List<Color?> colors;
  final double width;
  final double height;
  final String difficulty;

  ColoringPage({
    required this.name,
    required this.description,
    required this.paths,
    required this.width,
    required this.height,
    required this.difficulty,
  }) : colors = List.filled(paths.length, null);

  ColoringPage copyWith({List<Color?>? colors}) {
    final newPage = ColoringPage(
      name: name,
      description: description,
      paths: paths,
      width: width,
      height: height,
      difficulty: difficulty,
    );
    if (colors != null) {
      newPage.colors.clear();
      newPage.colors.addAll(colors);
    }
    return newPage;
  }
}
