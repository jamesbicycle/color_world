import 'coloring_pages/flower_page.dart';
import 'coloring_pages/butterfly_page.dart';
import 'coloring_pages/house_page.dart';
import 'coloring_pages/rainbow_page.dart';
import 'coloring_pages/ocean_page.dart';
import 'coloring_pages/garden_page.dart';
import 'coloring_pages/mermaid_page.dart';
import 'coloring_page.dart';

class ColoringPages {
  static final List<ColoringPage> pages = [
    createFlowerPage(),
    createButterflyPage(),
    createHousePage(),
    createRainbowPage(),
    createOceanPage(),
    createGardenPage(),
    createMermaidPage(),
  ];
}
