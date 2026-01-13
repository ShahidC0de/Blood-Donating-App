import 'package:blood_dontating_app/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';

class BloodPostWidget extends StatelessWidget {
  const BloodPostWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppPallete.backgroundColor,
        border: Border.all(
          color: AppPallete.fieldTextColor.withValues(alpha: 0.5),
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // LEFT BIG ICON
          Image.asset('assets/images/savelives.png', scale: 3),

          const SizedBox(width: 16),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Emergency B+ Blood Needed',
                  style: AppPallete.headingText.copyWith(fontSize: 15),
                ),

                const SizedBox(height: 8),

                Row(
                  children: [
                    Icon(
                      Icons.bloodtype,
                      color: AppPallete.buttonColor,
                      size: 20,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      'Saidu Sharif Hospital',
                      style: AppPallete.subHeadingText.copyWith(fontSize: 12),
                    ),
                  ],
                ),

                const SizedBox(height: 6),

                Row(
                  children: [
                    Icon(
                      Icons.calendar_month,
                      color: AppPallete.buttonColor,
                      size: 20,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      '12 Feb 2022',
                      style: AppPallete.subHeadingText.copyWith(fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
