import 'package:flutter/material.dart';

class AppTheme{
  static const Color lightPrimary = Color(0xFFB7935F);
  static const Color darkPrimary = Color(0xFF141A2E);
  static const Color white = Color(0xFFF8F8F8);
  static const Color black = Color(0xFF242424);
  static const Color gold = Color(0xFFFACC1D);

  static ThemeData lightTheme = ThemeData(
    primaryColor: lightPrimary,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: Colors.transparent,
      foregroundColor: black,
      titleTextStyle: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: black,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: black,
       unselectedItemColor: white,
      backgroundColor: lightPrimary,
    ),
    textTheme: TextTheme(
      headlineSmall: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w400,
        color: black,
      ),
      titleLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w400,
        color: black,
      ),
    ),
  );
  static ThemeData darkTheme = ThemeData(
    primaryColor: darkPrimary,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: Colors.transparent,
      foregroundColor: white,
      titleTextStyle: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: white,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: gold,
      unselectedItemColor: white,
      backgroundColor: darkPrimary,
    ),
    textTheme: TextTheme(
      headlineSmall: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w400,
        color: white,
      ),
      titleLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w400,
        color: gold,
      ),
    ),
  );
}