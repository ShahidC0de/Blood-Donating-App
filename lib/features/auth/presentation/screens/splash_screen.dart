import 'package:blood_dontating_app/features/auth/auth_providers.dart';
import 'package:blood_dontating_app/features/auth/presentation/screens/login_informative_screen.dart';
import 'package:blood_dontating_app/features/home/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateProvider);

    return authState.when(
      data: (user) {
        if (user != null) {
          // User is logged in
          return const HomeScreen();
        } else {
          // User not logged in
          return const OnboardingScreen();
        }
      },
      loading: () =>
          const Scaffold(body: Center(child: CircularProgressIndicator())),
      error: (err, stack) => Scaffold(body: Center(child: Text('Error: $err'))),
    );
  }
}
