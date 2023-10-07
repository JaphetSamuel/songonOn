import 'package:flutter/material.dart';

class MyTheme {

  static ThemeData get lightTheme {
    return ThemeData(
      colorScheme: ColorScheme.light(
        background:Colors.teal.withOpacity(0.04) ,
        surface: Colors.white,
        primary: Colors.teal.shade900,
        onSurface: Colors.black,
          onSecondary: Colors.white,
      ),
      primarySwatch: Colors.teal,
      primaryColor: Colors.teal.shade900,
      cardColor: const Color.fromARGB(1, 57, 86, 78),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.white,
        foregroundColor: Colors.teal.shade900,
        elevation: 0,
        titleTextStyle:TextStyle(
          color: Colors.teal.shade900,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      textTheme: const TextTheme(
        titleLarge: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        titleMedium: TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        titleSmall: TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      primarySwatch: Colors.teal,
      primaryColor: Colors.teal.shade900,
      colorScheme: ColorScheme.dark(
        background: Colors.black87,
        surface: Colors.black87,
        primary: Colors.teal.shade900,
        onSurface: Colors.white,
        onSecondary: Colors.white,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.black87,
        elevation: 0,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      textTheme: const TextTheme(
        titleLarge: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        titleMedium: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}