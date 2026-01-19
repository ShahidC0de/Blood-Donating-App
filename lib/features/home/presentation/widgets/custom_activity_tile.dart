import 'package:blood_dontating_app/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';

class CustomActivityTile extends StatelessWidget {
  final IconData icon;
  final String title;

  const CustomActivityTile({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: AppPallete.buttonColor.withValues(alpha: 0.1),
          child: Icon(icon, size: 28, color: AppPallete.buttonColor),
        ),
        SizedBox(width: 12),
        Text(
          title,
          style: AppPallete.subHeadingText.copyWith(
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(width: 12),
        Spacer(),
        Icon(Icons.arrow_forward_ios, size: 13),
      ],
    );
  }
}
