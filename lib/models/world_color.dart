import 'package:flutter/material.dart';

class WorldColor {
  final String name;
  final Color color;
  final String country;
  final String description;
  final String emoji;

  const WorldColor({
    required this.name,
    required this.color,
    required this.country,
    required this.description,
    required this.emoji,
  });
}

// Colors from around the world with cultural significance
class WorldColors {
  static const List<WorldColor> colors = [
    // Japan
    WorldColor(
      name: 'Sakura Pink',
      color: Color(0xFFFFB7C5),
      country: 'Japan',
      description: 'The beautiful pink of cherry blossoms',
      emoji: '🌸',
    ),
    WorldColor(
      name: 'Indigo Blue',
      color: Color(0xFF4B0082),
      country: 'Japan',
      description: 'Traditional Japanese indigo dye',
      emoji: '🏯',
    ),

    // India
    WorldColor(
      name: 'Saffron Orange',
      color: Color(0xFFFF9933),
      country: 'India',
      description: 'Sacred saffron spice color',
      emoji: '🧡',
    ),
    WorldColor(
      name: 'Turmeric Yellow',
      color: Color(0xFFE4C441),
      country: 'India',
      description: 'Golden turmeric spice',
      emoji: '✨',
    ),
    WorldColor(
      name: 'Henna Brown',
      color: Color(0xFFA0522D),
      country: 'India',
      description: 'Natural henna dye',
      emoji: '🤎',
    ),

    // Mexico
    WorldColor(
      name: 'Aztec Turquoise',
      color: Color(0xFF40E0D0),
      country: 'Mexico',
      description: 'Sacred Aztec turquoise stone',
      emoji: '💙',
    ),
    WorldColor(
      name: 'Papaya Orange',
      color: Color(0xFFFF6B35),
      country: 'Mexico',
      description: 'Tropical papaya fruit',
      emoji: '🏵️',
    ),
    WorldColor(
      name: 'Chili Red',
      color: Color(0xFFDC143C),
      country: 'Mexico',
      description: 'Spicy red chili pepper',
      emoji: '🌶️',
    ),

    // Egypt
    WorldColor(
      name: 'Desert Gold',
      color: Color(0xFFFFD700),
      country: 'Egypt',
      description: 'Golden desert sands',
      emoji: '🏜️',
    ),
    WorldColor(
      name: 'Nile Blue',
      color: Color(0xFF4682B4),
      country: 'Egypt',
      description: 'The mighty Nile river',
      emoji: '💙',
    ),

    // China
    WorldColor(
      name: 'Jade Green',
      color: Color(0xFF00A86B),
      country: 'China',
      description: 'Precious jade stone',
      emoji: '💚',
    ),
    WorldColor(
      name: 'Vermillion Red',
      color: Color(0xFFE34234),
      country: 'China',
      description: 'Traditional Chinese red',
      emoji: '❤️',
    ),

    // Morocco
    WorldColor(
      name: 'Marrakech Pink',
      color: Color(0xFFE91E63),
      country: 'Morocco',
      description: 'Pink city walls of Marrakech',
      emoji: '🌺',
    ),
    WorldColor(
      name: 'Berber Blue',
      color: Color(0xFF1E90FF),
      country: 'Morocco',
      description: 'Traditional Berber blue',
      emoji: '💙',
    ),

    // Peru
    WorldColor(
      name: 'Machu Picchu Green',
      color: Color(0xFF228B22),
      country: 'Peru',
      description: 'Misty mountain forests',
      emoji: '🏔️',
    ),
    WorldColor(
      name: 'Llama Brown',
      color: Color(0xFF8B4513),
      country: 'Peru',
      description: 'Soft llama wool',
      emoji: '🦙',
    ),

    // Greece
    WorldColor(
      name: 'Aegean Blue',
      color: Color(0xFF0077BE),
      country: 'Greece',
      description: 'Crystal clear Aegean sea',
      emoji: '🌊',
    ),
    WorldColor(
      name: 'Olive Green',
      color: Color(0xFF808000),
      country: 'Greece',
      description: 'Ancient olive trees',
      emoji: '🫒',
    ),

    // Basic colors for younger kids
    WorldColor(
      name: 'Rainbow Red',
      color: Color(0xFFFF0000),
      country: 'Everywhere',
      description: 'Bright red like a rainbow',
      emoji: '🌈',
    ),
    WorldColor(
      name: 'Sky Blue',
      color: Color(0xFF87CEEB),
      country: 'Everywhere',
      description: 'Blue like the sky',
      emoji: '☁️',
    ),
    WorldColor(
      name: 'Grass Green',
      color: Color(0xFF32CD32),
      country: 'Everywhere',
      description: 'Green like fresh grass',
      emoji: '🌱',
    ),
    WorldColor(
      name: 'Sun Yellow',
      color: Color(0xFFFFFF00),
      country: 'Everywhere',
      description: 'Bright yellow sun',
      emoji: '☀️',
    ),
    WorldColor(
      name: 'Grape Purple',
      color: Color(0xFF8A2BE2),
      country: 'Everywhere',
      description: 'Purple like juicy grapes',
      emoji: '🍇',
    ),
    WorldColor(
      name: 'Snow White',
      color: Color(0xFFFFFFFF),
      country: 'Everywhere',
      description: 'Pure white snow',
      emoji: '❄️',
    ),
    WorldColor(
      name: 'Night Black',
      color: Color(0xFF000000),
      country: 'Everywhere',
      description: 'Dark like night',
      emoji: '🌙',
    ),
  ];
}
