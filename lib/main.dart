import 'package:blood_dontating_app/core/theme/app_theme.dart';
import 'package:blood_dontating_app/features/login/presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blood Care, Donating App',
      theme: AppTheme.lightThemeMode,
      home: const SplashScreen(),
    );
  }
}
