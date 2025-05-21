import 'package:flutter/material.dart';
import 'package:shop_app/constants/product_constant.dart';
import 'package:shop_app/screens/home/home_screen.dart';
import 'package:shop_app/screens/product_detail/product_detail_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final product = ProductConstant.productList[0];
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
      textTheme: const TextTheme(
        titleLarge: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
        titleMedium: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        titleSmall: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        bodyLarge: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      ),
      appBarTheme: const AppBarTheme(
        titleTextStyle: TextStyle(fontSize: 20, color: Colors.black),
        centerTitle: true,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(vertical: 6),
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
        labelStyle: const TextStyle(fontWeight: FontWeight.bold),
      ),
      useMaterial3: true,
    );

    return MaterialApp(
      theme: theme,
      home: ProductDetailScreen(product: product),
    );
  }
}
