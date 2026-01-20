import 'package:blood_dontating_app/core/theme/app_pallete.dart';
import 'package:blood_dontating_app/features/auth/presentation/screens/verification_page.dart';
import 'package:blood_dontating_app/features/auth/presentation/widgets/customfield.dart';
import 'package:blood_dontating_app/features/auth/presentation/widgets/login_button.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  static route() =>
      MaterialPageRoute(builder: (context) => const ForgotPassword());
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forgot Password', style: AppPallete.headingText),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Enter your mobile number & we will send you an OTP to reset your password.',
              style: AppPallete.subHeadingText,
            ),
            const SizedBox(height: 20),
            Text('Mobile Number', style: AppPallete.subHeadingText),
            const SizedBox(height: 10),

            Customfield(hintText: 'Mobile Number'),
            Spacer(),
            AuthButton(
              onpressed: () {
                Navigator.of(
                  context,
                ).push(VerificationPage.route('+1234567890'));
              },
              title: 'Send',
            ),
          ],
        ),
      ),
    );
  }
}
