import 'package:blood_dontating_app/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';

class ActivityWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  const ActivityWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppPallete.backgroundColor,
        border: Border.all(
          color: AppPallete.fieldTextColor.withValues(alpha: 0.5),
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: AppPallete.buttonColor, size: 45),
          SizedBox(width: 5),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(title, style: AppPallete.headingText.copyWith(fontSize: 15)),
              Text(
                subtitle,
                style: AppPallete.subHeadingText.copyWith(fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
