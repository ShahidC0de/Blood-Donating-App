import 'package:blood_dontating_app/core/theme/app_pallete.dart';
import 'package:blood_dontating_app/features/home/presentation/widgets/custom_activity_tile.dart';
import 'package:flutter/material.dart';

class More extends StatelessWidget {
  const More({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('More'), automaticallyImplyLeading: false),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 40),
            Stack(
              clipBehavior: Clip.none, // IMPORTANT
              children: [
                Container(
                  width: double.infinity,
                  height: 140,
                  decoration: BoxDecoration(
                    color: AppPallete.buttonColor.withValues(alpha: 0.9),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),

                Positioned(
                  top: -40, // half of avatar radius
                  left: 0,
                  right: 0,
                  child: Center(
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: const AssetImage(
                        'assets/images/savelives.png',
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.edit_outlined,
                      color: AppPallete.backgroundColor,
                      size: 30,
                    ),
                  ),
                ),
                Positioned(
                  top: 70,
                  left: 0,
                  right: 0,
                  child: Column(
                    children: [
                      Text(
                        'John Doe',
                        style: AppPallete.headingText.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: AppPallete.backgroundColor,
                        ),
                      ),
                      Text(
                        'Blood Group: B+',
                        style: AppPallete.subHeadingText.copyWith(
                          fontSize: 14,
                          color: AppPallete.backgroundColor.withValues(
                            alpha: 0.9,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20), // space after avatar
            CustomActivityTile(icon: Icons.history, title: 'Settings'),
            Divider(color: AppPallete.borderColor.withValues(alpha: 0.3)),

            const SizedBox(height: 20), // space after avatar
            CustomActivityTile(icon: Icons.history, title: 'Compatibility'),
            Divider(color: AppPallete.borderColor.withValues(alpha: 0.3)),

            const SizedBox(height: 20), // space after avatar
            CustomActivityTile(icon: Icons.history, title: 'Blood Donated'),
            Divider(color: AppPallete.borderColor.withValues(alpha: 0.3)),

            const SizedBox(height: 20), // space after avatar
            CustomActivityTile(icon: Icons.history, title: 'Feedback'),
            Divider(color: AppPallete.borderColor.withValues(alpha: 0.3)),

            const SizedBox(height: 20), // space after avatar
            CustomActivityTile(icon: Icons.history, title: 'App Version'),
            Divider(color: AppPallete.borderColor.withValues(alpha: 0.3)),
          ],
        ),
      ),
    );
  }
}
