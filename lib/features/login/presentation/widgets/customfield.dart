import 'package:blood_dontating_app/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Customfield extends StatelessWidget {
  IconData? icon;

  int maxLines = 1;
  final String hintText;
  final TextEditingController? controller;
  Customfield({
    super.key,
    required this.hintText,
    this.controller,
    this.maxLines = 1,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.only(left: 15, right: 10, top: 2, bottom: 2),
      decoration: BoxDecoration(
        border: Border.all(color: AppPallete.borderColor, width: 1),
        borderRadius: BorderRadius.circular(5),
      ),
      child: TextField(
        maxLines: maxLines,
        style: TextStyle(color: AppPallete.fieldTextColor, fontSize: 15),
        controller: controller,
        decoration: InputDecoration(
          prefixIcon: Icon(icon, size: 40, color: AppPallete.borderColor),
          border: InputBorder.none,
          hintText: hintText,
        ),
      ),
    );
  }
}
