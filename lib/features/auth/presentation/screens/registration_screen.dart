import 'package:blood_dontating_app/core/utils/snackbar.dart';
import 'package:blood_dontating_app/features/auth/presentation/notifiers/auth_notifier.dart';
import 'package:blood_dontating_app/features/auth/presentation/screens/login_screen.dart';
import 'package:blood_dontating_app/features/auth/presentation/screens/verification_page.dart';
import 'package:blood_dontating_app/features/auth/presentation/widgets/customfield.dart';
import 'package:blood_dontating_app/features/auth/presentation/widgets/login_button.dart';
import 'package:blood_dontating_app/features/auth/presentation/widgets/login_icon_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegistrationScreen extends ConsumerStatefulWidget {
  static route() =>
      MaterialPageRoute(builder: (context) => const RegistrationScreen());
  const RegistrationScreen({super.key});

  @override
  ConsumerState<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends ConsumerState<RegistrationScreen> {
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
          Navigator.pushReplacement(
            context,
            VerificationPage.route('+1234567890'),
          );
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
                'Create an account',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 15),

              Text(
                'Fill in the form below to create an account',
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
              Customfield(
                hintText: 'Email Address',
                controller: emailController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Email is Required";
                  }
                  if (!value.contains('@')) {
                    return "Enter a valid Email";
                  }
                  return null;
                },
              ),
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
              Customfield(
                hintText: 'Password',
                controller: passwordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Password is Required";
                  }
                  if (value.length < 6) {
                    return "Password must be at least 6 characters";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),

              const SizedBox(height: 15),

              AuthButton(
                onpressed: () {
                  if (formKey.currentState!.validate()) {
                    ref
                        .read(authNotifierProvider.notifier)
                        .registerUser(
                          emailController.text.trim(),
                          passwordController.text.trim(),
                        );
                  }
                },
                title: authState.isLoading ? "Creating.." : 'Register',
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
                      const TextSpan(text: 'Already have an account? '),
                      TextSpan(
                        text: 'Sign In',
                        style: TextStyle(color: Colors.red),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.of(
                              context,
                            ).pushReplacement(LoginScreen.route());
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
