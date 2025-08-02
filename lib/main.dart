import 'package:flutter/material.dart';
import 'package:obsidian_randomizer/screens/randomizer_screen.dart';
import 'package:obsidian_randomizer/services/config_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ConfigService.init();
  runApp(const ObsidianRandomizerApp());
}

class ObsidianRandomizerApp extends StatelessWidget {
  const ObsidianRandomizerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Obsidian Randomizer',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.purple,
        scaffoldBackgroundColor: const Color(0xFF1A1B1E),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF2D2F34),
          foregroundColor: Colors.white,
        ),
        cardTheme: const CardTheme(color: Color(0xFF2D2F34)),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF7C3AED),
            foregroundColor: Colors.white,
          ),
        ),
      ),
      home: const RandomizerScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
} 