import 'package:blood_dontating_app/core/constants/constants.dart';
import 'package:blood_dontating_app/core/theme/app_pallete.dart';
import 'package:blood_dontating_app/features/home/presentation/screens/more.dart';
import 'package:blood_dontating_app/features/home/presentation/screens/search_screen.dart';
import 'package:blood_dontating_app/features/home/presentation/widgets/activity_widget.dart';
import 'package:blood_dontating_app/features/home/presentation/widgets/blood_post_widget.dart';
import 'package:blood_dontating_app/features/inbox/presentation/screens/inbox_screen.dart';
import 'package:blood_dontating_app/features/auth/presentation/widgets/customfield.dart';
import 'package:blood_dontating_app/features/notification/presentation/screens/notification_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (context) => HomeScreen());
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final List<Widget> _screens = [Home(), const SearchScreen(), const More()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppPallete.backgroundColor,
        selectedItemColor: AppPallete.buttonColor,
        unselectedItemColor: AppPallete.borderColor,
        unselectedLabelStyle: AppPallete.subHeadingText.copyWith(
          color: AppPallete.borderColor,
        ),
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 40),
            label: 'Home',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),

          BottomNavigationBarItem(icon: Icon(Icons.more), label: 'More'),
        ],
      ),
      body: _screens[_currentIndex],
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String bloodDonateStatus = "Off";

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => InboxScreen()),
                      );
                    },
                    child: const Icon(Icons.mail_lock_outlined, size: 30),
                  ),
                  const SizedBox(width: 15),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NotificationScreen(),
                        ),
                      );
                    },
                    child: const Icon(
                      Icons.notifications_none_outlined,
                      size: 30,
                    ),
                  ),
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
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return activitiesIcons[index]["screen"]!;
                          },
                        ),
                      );
                    },
                    child: ActivityWidget(
                      title: activitiesIcons[index]["label"]!,
                      subtitle: activitiesIcons[index]["subtitle"]!,
                      icon: activitiesIcons[index]["icon"]!,
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
              const SizedBox(height: 20),

              Text(
                'Recently Viewed',
                style: AppPallete.headingText.copyWith(fontSize: 17),
              ),
              const SizedBox(height: 10),
              BloodPostWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
