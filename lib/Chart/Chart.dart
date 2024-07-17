// app_constants.dart

import 'package:flutter/material.dart';
import '../data/data.dart';



Color getBackgroundColor(bool isProd) {
 if (isProd==true)
   return Color(0xFFB8E4FF);
 else
   return Color(0xFFBDFFB8);
}

//bool isApiProd = false;
Color color = getBackgroundColor(isApiProd);

// Define colors
class AppColors {
  static const Color primaryColor = Color(0xFFFFFFFF);
  static const Color accentColor = Color(0xFF03DAC6);
  static  Color backgroundColor =  color;
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
