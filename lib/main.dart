import 'package:flutter/material.dart';
import 'package:islami/home.dart';
import 'app_theme.dart';

void main() {
  runApp(const IslamiApp());
}

class IslamiApp extends StatelessWidget{
  const IslamiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routeName: (_) => const HomeScreen(),

      },
      initialRoute: HomeScreen.routeName,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
    );
  }

}