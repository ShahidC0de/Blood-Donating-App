import 'package:blood_dontating_app/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';

class Customfield extends StatelessWidget {
  final TextInputType? inputType;
  final String hintText;
  final TextEditingController? controller;
  final IconData? icon;
  final bool obscureText;
  final String? Function(String?)? validator;
  final int? maxlines;

  const Customfield({
    this.maxlines,

    this.inputType,
    super.key,
    required this.hintText,
    this.controller,
    this.icon,
    this.obscureText = false,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxlines,
      keyboardType: inputType,
      controller: controller,
      obscureText: obscureText,
      validator: validator,
      style: TextStyle(color: AppPallete.fieldTextColor, fontSize: 15),
      decoration: InputDecoration(
        prefixIcon: icon != null
            ? Icon(icon, color: AppPallete.borderColor)
            : null,
        hintText: hintText,
        errorStyle: const TextStyle(color: Colors.red, fontSize: 12),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 16,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(
            color: AppPallete.borderColor.withValues(alpha: 0.3),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(color: AppPallete.buttonColor, width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: const BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: const BorderSide(color: Colors.red, width: 1.5),
        ),
      ),
    );
  }
}
