import 'package:blood_dontating_app/features/login/presentation/screens/forgot_password.dart';
import 'package:blood_dontating_app/features/login/presentation/screens/registration_screen.dart';
import 'package:blood_dontating_app/features/login/presentation/widgets/customfield.dart';
import 'package:blood_dontating_app/features/login/presentation/widgets/login_button.dart';
import 'package:blood_dontating_app/features/login/presentation/widgets/login_icon_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  static route() =>
      MaterialPageRoute(builder: (context) => const LoginScreen());
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          top: 100,
          left: 20,
          right: 20,
          bottom: 20,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome to Blood Care',
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),

            Text(
              'Enter your phone number & password to continue',
              style: TextStyle(color: Colors.black, fontSize: 15),
            ),
            const SizedBox(height: 30),
            Text(
              'Mobile',
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),
            Customfield(hintText: 'Mobile Number'),
            const SizedBox(height: 15),

            Text(
              'Password',
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),
            Customfield(hintText: 'Password'),

            const SizedBox(height: 10),

            Align(
              alignment: Alignment.topRight,
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).push(ForgotPassword.route());
                },
                child: Text(
                  'Forgot Password?',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),

            AuthButton(onpressed: () {}, title: 'Login'),
            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Expanded(child: Divider(thickness: 1)),

                Text(
                  'OR login with',
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
                const Expanded(child: Divider(thickness: 1)),
              ],
            ),
            const SizedBox(height: 15),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LoginWithIconButton(
                  iconData: Icons.facebook,
                  onpressed: () {},
                  title: 'Facebook',
                ),
                LoginWithIconButton(
                  onpressed: () {},
                  svgPath: 'assets/images/google_icon.svg',
                  title: 'Google',
                ),
              ],
            ),
            const SizedBox(height: 20),
            Center(
              child: RichText(
                text: TextSpan(
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    const TextSpan(text: 'Don\'t have an account? '),
                    TextSpan(
                      text: 'Sign Up',
                      style: TextStyle(color: Colors.red),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.of(
                            context,
                          ).pushReplacement(RegistrationScreen.route());
                        },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
