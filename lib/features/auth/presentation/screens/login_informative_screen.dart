import 'package:blood_dontating_app/features/auth/presentation/screens/login_screen.dart';
import 'package:blood_dontating_app/features/auth/presentation/widgets/login_button.dart';
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
