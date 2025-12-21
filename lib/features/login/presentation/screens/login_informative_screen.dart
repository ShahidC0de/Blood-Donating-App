import 'package:blood_dontating_app/features/login/presentation/screens/widgets/login_button.dart';
import 'package:blood_dontating_app/features/login/presentation/screens/widgets/login_icon_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int currentPage = 0;

  final List<Map<String, String>> onboardingData = [
    {
      "title": "Welcome to BloodApp",
      "subtitle": "Your easy way to donate and receive blood.",
      "image": "assets/images/welcome.png",
    },
    {
      "title": "Track Donations",
      "subtitle": "Keep track of your donation history and stats.",
      "image": "assets/images/track_record.png",
    },
    {
      "title": "Save Lives",
      "subtitle": "Connect with donors and recipients near you.",
      "image": "assets/images/savelives.png",
    },
  ];

  void nextPage() {
    if (currentPage < onboardingData.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    } else {
      // Navigate to main app screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    }
  }

  void skip() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: onboardingData.length,
            onPageChanged: (index) {
              setState(() {
                currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ColorFiltered(
                      colorFilter: ColorFilter.mode(
                        Colors.transparent,
                        BlendMode
                            .dstOut, // This attempts to "punch out" the white
                      ),
                      child: Image.asset(onboardingData[index]['image']!),
                    ),
                    const SizedBox(height: 30),
                    Text(
                      onboardingData[index]['title']!,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 15),
                    Text(
                      onboardingData[index]['subtitle']!,
                      style: const TextStyle(fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              );
            },
          ),
          Positioned(
            top: 50,
            right: 20,
            child: TextButton(onPressed: skip, child: const Text("Skip")),
          ),
          Positioned(
            bottom: 50,
            right: 20,
            child: AuthButton(
              onpressed: nextPage,
              title: currentPage == onboardingData.length - 1
                  ? "Start"
                  : "Next",
            ),
          ),
        ],
      ),
    );
  }
}

class LoginScreen extends StatelessWidget {
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
              'Welcome to our app',
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),

            Text(
              'Enter your email address and passwored to continue',
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
            Container(
              padding: const EdgeInsets.only(left: 30, right: 10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1),
                borderRadius: BorderRadius.circular(5),
              ),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Type Number',
                ),
              ),
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
            Container(
              padding: const EdgeInsets.only(left: 30, right: 10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1),
                borderRadius: BorderRadius.circular(5),
              ),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Password',
                ),
              ),
            ),
            const SizedBox(height: 10),

            Align(
              alignment: Alignment.topRight,
              child: TextButton(
                onPressed: () {},
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
                          // Handle sign up tap
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
