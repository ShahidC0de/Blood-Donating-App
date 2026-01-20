import 'package:blood_dontating_app/core/theme/app_theme.dart';
import 'package:blood_dontating_app/features/auth/presentation/screens/splash_screen.dart';
import 'package:blood_dontating_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    print('Firebase initialized successfully');
  } catch (e) {
    // Handle the error appropriately in your app
    print('Error initializing Firebase: $e');
  }
  runApp(ProviderScope(child: const MyApp()));
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
