import 'package:blood_dontating_app/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final lightThemeMode = ThemeData.light().copyWith(
    scaffoldBackgroundColor: AppPallete.backgroundColor,
    appBarTheme: AppBarTheme(
      backgroundColor: AppPallete.backgroundColor,
      elevation: 0,
      iconTheme: IconThemeData(color: AppPallete.buttonColor),
    ),
  );
}
