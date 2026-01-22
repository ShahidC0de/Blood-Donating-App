import 'package:blood_dontating_app/core/theme/app_pallete.dart';
import 'package:blood_dontating_app/core/utils/snackbar.dart';
import 'package:blood_dontating_app/features/auth/presentation/notifiers/auth_notifier.dart';
import 'package:blood_dontating_app/features/auth/presentation/screens/login_screen.dart';
import 'package:blood_dontating_app/features/profile/presentation/screens/profile_setup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EmailVerificationScreen extends ConsumerStatefulWidget {
  static route() =>
      MaterialPageRoute(builder: (context) => const EmailVerificationScreen());

  const EmailVerificationScreen({super.key});

  @override
  ConsumerState<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState
    extends ConsumerState<EmailVerificationScreen> {
  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authNotifierProvider);
    ref.listen(authNotifierProvider, (prev, next) {
      next.whenOrNull(
        error: (error, _) {
          AppSnackBar.showError(context, error.toString());
        },
        data: (user) {
          if (user!.isEmailVerified) {
            Navigator.pushReplacement(context, ProfileSetup.route());
          } else {
            AppSnackBar.showError(context, "Please verify your email");
          }
        },
      );
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Email Verification'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icon / Illustration
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.red.withValues(alpha: 0.1),
              ),
              child: const Icon(
                Icons.mark_email_unread_rounded,
                size: 70,
                color: Colors.red,
              ),
            ),

            const SizedBox(height: 30),

            // Title
            Text(
              'Verify your email',
              style: AppPallete.headingText.copyWith(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            // Description
            Text(
              'We have sent a verification link to your email address.\n'
              'Please check your inbox and click the link to activate your account.',
              textAlign: TextAlign.center,
              style: AppPallete.subHeadingText.copyWith(
                fontSize: 14,
                height: 1.5,
              ),
            ),

            const SizedBox(height: 25),

            // Info box
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.shade100,
              ),
              child: Row(
                children: const [
                  Icon(Icons.info_outline, size: 20),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'Didn’t receive the email? Check your spam folder.',
                      style: TextStyle(fontSize: 13),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // Resend Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  ref
                      .read(authNotifierProvider.notifier)
                      .sendEmailVerificationAgain();
                },
                child: Text(
                  authState.isLoading ? "Resending " : 'Resend Email',
                ),
              ),
            ),

            const SizedBox(height: 10),

            // Continue Button
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: authState.isLoading
                    ? null
                    : () {
                        ref
                            .read(authNotifierProvider.notifier)
                            .getVerifiedUser();
                      },
                child: Text(
                  authState.isLoading
                      ? "A moment, Verifying"
                      : 'I’ve Verified, Continue',
                ),
              ),
            ),

            const SizedBox(height: 15),

            TextButton(
              onPressed: authState.isLoading
                  ? null
                  : () {
                      ref.read(authNotifierProvider.notifier).logout();
                      Navigator.pushReplacement(context, LoginScreen.route());
                    },
              child: const Text(
                'Change email or log out',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
