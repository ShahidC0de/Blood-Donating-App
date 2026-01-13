import 'package:blood_dontating_app/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';

class CustomTile extends StatelessWidget {
  final IconData icon;
  final String title1;
  final String titleValue;
  const CustomTile({
    super.key,
    required this.icon,
    required this.title1,
    required this.titleValue,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: AppPallete.buttonColor.withValues(alpha: 0.1),
          child: Icon(icon, color: AppPallete.buttonColor),
        ),
        SizedBox(width: 8),
        Text(
          title1,
          style: AppPallete.subHeadingText.copyWith(
            fontSize: 15,
            color: AppPallete.borderColor,
          ),
        ),
        Spacer(),

        Text(
          titleValue,
          style: AppPallete.subHeadingText.copyWith(fontSize: 15),
        ),
      ],
    );
  }
}
