// app_constants.dart

import 'package:flutter/material.dart';

// Define colors
class AppColors {
  static const Color primaryColor = Color(0xFFFFFFFF);
  static const Color accentColor = Color(0xFF03DAC6);
  static const Color backgroundColor =  Color(0xFFB8E4FF);
  static const Color textColor = Colors.black;
  static const Color buttonColor = Color(0xFF151E93);
  static const Color title =Color(0xFF202244);
  static const Color CourseDestail= Color(0xFF545454);

}

// Define text styles
class AppTextStyles {
  static const TextStyle headline1 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.textColor,
  );

  static const TextStyle bodyText = TextStyle(
    fontSize: 16,
    color: AppColors.textColor,
  );


}
