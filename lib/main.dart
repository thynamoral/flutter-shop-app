import 'package:flutter/material.dart';
import 'package:shop_app/screens/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = ThemeData(
      fontFamily: 'Roboto',
      colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: Colors.black,
        onPrimary: Colors.white,
        secondary: Colors.grey,
        onSecondary: Colors.black,
        error: Colors.red,
        onError: Colors.white,
        surface: Colors.white,
        onSurface: Colors.black,
      ),
      textTheme: TextTheme(
        titleMedium: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        titleSmall: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.symmetric(vertical: 6),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: BorderSide.none,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
        ),
      ),
      chipTheme: ChipThemeData(
        padding: EdgeInsets.all(8),
        elevation: 6,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        labelStyle: TextStyle(fontWeight: FontWeight.bold),
      ),
      useMaterial3: true,
    );

    return MaterialApp(theme: theme, home: const HomeScreen());
  }
}
