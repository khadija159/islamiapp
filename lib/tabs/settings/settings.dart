import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:islami/main.dart';

class Settings with ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;
  String languageCode = 'en';

  bool get isDark => themeMode == ThemeMode.dark;

  String get backgroundImage => isDark ? 'dark_bg' : 'default_bg';

  void changeTheme(ThemeMode selectedTheme){
    themeMode = selectedTheme;
    notifyListeners();
  }

  void changeLanguage(String selectedLanguage){
    if(selectedLanguage == languageCode) return;
    languageCode = selectedLanguage;
    notifyListeners();
  }
}