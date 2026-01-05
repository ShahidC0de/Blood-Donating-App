import 'package:blood_dontating_app/core/theme/app_pallete.dart';
import 'package:blood_dontating_app/features/login/presentation/widgets/customfield.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (context) => HomeScreen());
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String bloodDonateStatus = "Off";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header row
                Row(
                  children: [
                    CircleAvatar(
                      radius: 35,
                      child: Image.asset('assets/images/savelives.png'),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'ShahidC0de',
                          style: AppPallete.headingText.copyWith(fontSize: 20),
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Donate Blood: ',
                                style: AppPallete.subHeadingText.copyWith(
                                  fontSize: 12,
                                ),
                              ),
                              TextSpan(
                                text: bloodDonateStatus,
                                style: bloodDonateStatus == "Off"
                                    ? AppPallete.subHeadingText.copyWith(
                                        color: AppPallete.buttonColor,
                                      )
                                    : AppPallete.subHeadingText.copyWith(
                                        color: Colors.greenAccent,
                                      ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    const Icon(Icons.mail_lock_outlined, size: 30),
                    const SizedBox(width: 15),
                    const Icon(Icons.notifications_none_outlined, size: 30),
                  ],
                ),

                const SizedBox(height: 20),

                Customfield(hintText: 'Search Blood', icon: Icons.search),

                const SizedBox(height: 16),

                Container(
                  decoration: BoxDecoration(
                    color: AppPallete.buttonColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  padding: const EdgeInsets.all(18),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Save a life',
                            style: AppPallete.headingText.copyWith(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            'Give Blood',
                            style: AppPallete.headingText.copyWith(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Image.asset('assets/images/savelives.png', scale: 9),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                Text(
                  'Activity As',
                  style: AppPallete.headingText.copyWith(fontSize: 17),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
