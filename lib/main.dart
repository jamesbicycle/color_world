import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/home_screen.dart';
import 'providers/coloring_provider.dart';
import 'widgets/loading_screen.dart';

void main() {
  runApp(const ColorWorldApp());
}

class ColorWorldApp extends StatelessWidget {
  const ColorWorldApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ColoringProvider(),
      child: MaterialApp(
        title: 'Color World - Coloring App',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          scaffoldBackgroundColor: const Color(0xFFF8F9FA),
          fontFamily: 'Comic Sans MS',
          appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xFF6C5CE7),
            foregroundColor: Colors.white,
            elevation: 0,
          ),
        ),
        home: const LoadingScreen(child: HomeScreen()),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
