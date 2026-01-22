import 'package:blood_dontating_app/core/utils/snackbar.dart';
import 'package:blood_dontating_app/features/auth/presentation/notifiers/auth_notifier.dart';
import 'package:blood_dontating_app/features/auth/presentation/screens/forgot_password.dart';
import 'package:blood_dontating_app/features/auth/presentation/screens/registration_screen.dart';
import 'package:blood_dontating_app/features/auth/presentation/widgets/customfield.dart';
import 'package:blood_dontating_app/features/auth/presentation/widgets/login_button.dart';
import 'package:blood_dontating_app/features/auth/presentation/widgets/login_icon_button.dart';
import 'package:blood_dontating_app/features/home/presentation/screens/home_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginScreen extends ConsumerStatefulWidget {
  static route() =>
      MaterialPageRoute(builder: (context) => const LoginScreen());
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authNotifierProvider);
    ref.listen(authNotifierProvider, (prev, next) {
      next.whenOrNull(
        error: (error, _) {
          AppSnackBar.showError(context, error.toString());
        },
        data: (user) {
          Navigator.pushReplacement(context, HomeScreen.route());
        },
      );
    });
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          top: 100,
          left: 20,
          right: 20,
          bottom: 20,
        ),
        child: Form(
          key: formKey,
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
                'Enter your Email & Password to continue',
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
              const SizedBox(height: 30),
              Text(
                'Email',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 15),
              Customfield(hintText: 'Email', controller: emailController),
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
              Customfield(hintText: 'Password', controller: passwordController),

              const SizedBox(height: 10),

              Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: authState.isLoading
                      ? null
                      : () {
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

              AuthButton(
                onpressed: () {
                  if (formKey.currentState!.validate()) {
                    ref
                        .read(authNotifierProvider.notifier)
                        .loginUser(
                          emailController.text.trim(),
                          passwordController.text.trim(),
                        );
                  }
                },
                title: authState.isLoading ? "Signing In" : "Sign In",
              ),
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
      ),
    );
  }
}
