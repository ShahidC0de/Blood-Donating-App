import 'package:blood_dontating_app/core/constants/constants.dart';
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
                GridView.builder(
                  shrinkWrap: true,

                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 4,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    crossAxisCount: 2,
                    mainAxisExtent: 90,
                  ),
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: AppPallete.backgroundColor,
                        border: Border.all(
                          color: AppPallete.fieldTextColor.withValues(
                            alpha: 0.5,
                          ),
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.bloodtype,
                            color: AppPallete.buttonColor,
                            size: 45,
                          ),
                          SizedBox(width: 5),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Blood Donors',
                                style: AppPallete.headingText.copyWith(
                                  fontSize: 15,
                                ),
                              ),
                              Text(
                                '120 posts',
                                style: AppPallete.subHeadingText.copyWith(
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
                const SizedBox(height: 20),

                Text(
                  'Blood Groups',
                  style: AppPallete.headingText.copyWith(fontSize: 17),
                ),
                const SizedBox(height: 10),
                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: bloodGroupIcons.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                  ),
                  itemBuilder: (context, index) {
                    final bloodGroupIcon = bloodGroupIcons[index];
                    return Container(
                      padding: EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: AppPallete.buttonColor,
                          width: 1.5,
                        ),
                      ),
                      child: Image.asset(bloodGroupIcon["icon"]!, scale: 2.5),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
