import 'package:blood_dontating_app/features/auth/providers/auth_state_provider.dart';
import 'package:blood_dontating_app/features/auth/presentation/screens/login_informative_screen.dart';
import 'package:blood_dontating_app/features/profile/presentation/screens/profile_setup.dart';
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
          return const ProfileSetup();
        } else {
          return const OnboardingScreen();
        }
      },
      loading: () =>
          const Scaffold(body: Center(child: CircularProgressIndicator())),
      error: (err, stack) => Scaffold(body: Center(child: Text('Error: $err'))),
    );
  }
}
