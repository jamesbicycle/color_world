import 'package:flutter/material.dart';
import '../models/coloring_page.dart';
import '../models/all_coloring_pages.dart';

class ColoringProvider extends ChangeNotifier {
  Color _selectedColor = Colors.red;
  int _currentPageIndex = 0;
  List<ColoringPage> _pages = [];

  ColoringProvider() {
    _pages = ColoringPages.pages.map((page) => page.copyWith()).toList();
  }

  Color get selectedColor => _selectedColor;
  int get currentPageIndex => _currentPageIndex;
  List<ColoringPage> get pages => _pages;
  ColoringPage get currentPage => _pages[_currentPageIndex];

  void selectColor(Color color) {
    _selectedColor = color;
    notifyListeners();
  }

  void selectPage(int index) {
    _currentPageIndex = index;
    notifyListeners();
  }

  void colorSection(int sectionIndex) {
    if (sectionIndex < _pages[_currentPageIndex].colors.length) {
      _pages[_currentPageIndex].colors[sectionIndex] = _selectedColor;
      notifyListeners();
    }
  }

  void clearPage() {
    for (int i = 0; i < _pages[_currentPageIndex].colors.length; i++) {
      _pages[_currentPageIndex].colors[i] = null;
    }
    notifyListeners();
  }

  void clearAllPages() {
    _pages = ColoringPages.pages.map((page) => page.copyWith()).toList();
    notifyListeners();
  }

  // Get progress for current page
  double getPageProgress() {
    final coloredSections = _pages[_currentPageIndex].colors
        .where((color) => color != null)
        .length;
    return coloredSections / _pages[_currentPageIndex].colors.length;
  }

  // Check if page is completed
  bool isPageComplete() {
    return _pages[_currentPageIndex].colors.every((color) => color != null);
  }

  // Get overall progress
  double getOverallProgress() {
    int totalSections = 0;
    int coloredSections = 0;

    for (final page in _pages) {
      totalSections += page.colors.length;
      coloredSections += page.colors.where((color) => color != null).length;
    }

    return totalSections > 0 ? coloredSections / totalSections : 0.0;
  }
}
