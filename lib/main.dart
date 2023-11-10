import 'package:flutter/material.dart';
import 'package:expense/widgets/expenses.dart';

var kColorScheme = ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 8, 13, 255));

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData().copyWith(useMaterial3: true,
      scaffoldBackgroundColor: Color.fromARGB(255, 237, 228, 255),
      colorScheme: kColorScheme,
      appBarTheme: const AppBarTheme().copyWith(
        backgroundColor: const Color.fromARGB(108, 127, 65, 241),
        foregroundColor: const Color.fromARGB(255, 41, 36, 50),
        centerTitle: true,
        elevation: 5,
        shadowColor: Color.fromARGB(255, 255, 8, 234),
      ),
      cardTheme: const CardTheme().copyWith(
        elevation: 3,
        color: kColorScheme.primaryContainer,
        shadowColor: const Color.fromARGB(255, 8, 13, 255),
        margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
        
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(143, 8, 12, 255),
          foregroundColor: const Color.fromARGB(255, 255, 255, 255)
        ),
      ),
      ),
      home: const Expenses(),
    ),
  );
}
