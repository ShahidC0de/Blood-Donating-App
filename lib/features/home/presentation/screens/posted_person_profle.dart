import 'package:blood_dontating_app/core/theme/app_pallete.dart';
import 'package:blood_dontating_app/features/blood_request/presentation/widgets/custom_tile.dart';
import 'package:flutter/material.dart';

class PostedPersonProfle extends StatelessWidget {
  const PostedPersonProfle({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile Details',
          style: AppPallete.subHeadingText.copyWith(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 20),
            Center(
              child: CircleAvatar(
                radius: 40,
                child: Image.asset('assets/images/savelives.png', scale: 1),
              ),
            ),
            Text(
              'ShahidC0de',
              style: AppPallete.headingText.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 5),
            Text(
              'O+ Blood',
              style: AppPallete.subHeadingText.copyWith(fontSize: 15),
            ),
            SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: AppPallete.buttonColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      fixedSize: const Size(120, 40),
                    ),
                    onPressed: () {},
                    child: Text(
                      'Chat Now',
                      style: TextStyle(
                        color: AppPallete.backgroundColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Container(
                  decoration: BoxDecoration(
                    color: AppPallete.backgroundColor,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: AppPallete.buttonColor, width: 1),
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      fixedSize: const Size(120, 40),
                    ),
                    onPressed: () {},
                    child: Text(
                      'Call',
                      style: TextStyle(
                        color: AppPallete.buttonColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'About',
              style: AppPallete.subHeadingText.copyWith(
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
            Divider(
              color: AppPallete.buttonColor.withValues(alpha: 0.5),
              thickness: 1,
            ),
            Container(
              margin: EdgeInsets.only(top: 10, bottom: 10, left: 30, right: 30),
              child: Column(
                children: [
                  CustomTile(
                    icon: Icons.person,
                    title1: "Age",
                    titleValue: '24',
                  ),
                  Divider(
                    color: AppPallete.borderColor.withValues(alpha: 0.5),
                    thickness: 1,
                  ),
                  CustomTile(
                    icon: Icons.location_on,
                    title1: "Gender",
                    titleValue: 'Male',
                  ),
                  Divider(
                    color: AppPallete.borderColor.withValues(alpha: 0.5),
                    thickness: 1,
                  ),
                  CustomTile(
                    icon: Icons.location_city_outlined,
                    title1: "City",
                    titleValue: 'Lahore',
                  ),
                  Divider(
                    color: AppPallete.borderColor.withValues(alpha: 0.5),
                    thickness: 1,
                  ),
                  CustomTile(
                    icon: Icons.phone_android_outlined,
                    title1: "Mobile",
                    titleValue: '+92 300 1234567',
                  ),
                  Divider(
                    color: AppPallete.borderColor.withValues(alpha: 0.5),
                    thickness: 1,
                  ),
                  CustomTile(
                    icon: Icons.email_outlined,
                    title1: "Email",
                    titleValue: 'shahidzada.cs@gmail.com',
                  ),
                  Divider(
                    color: AppPallete.borderColor.withValues(alpha: 0.5),
                    thickness: 1,
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'About User',
                style: AppPallete.subHeadingText.copyWith(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(height: 5),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Hi, I am Shahid. I am willing to donate blood to the people in need. Please feel free to contact me anytime.',
                style: AppPallete.subHeadingText.copyWith(fontSize: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
