import 'package:blood_dontating_app/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';

class Customfield extends StatelessWidget {
  final String hintText;
  const Customfield({super.key, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 30, right: 10),
      decoration: BoxDecoration(
        border: Border.all(color: AppPallete.borderColor, width: 1),
        borderRadius: BorderRadius.circular(5),
      ),
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
        ),
      ),
    );
  }
}
