import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homeservice/src/constants/colors.dart';

class LightThemeManager {
  static ThemeData getThemeData() {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      useMaterial3: true,
      brightness: Brightness.light,
      primaryColor: Colors.blue,
      fontFamily: 'Urbanist',
      scaffoldBackgroundColor: AppColors.primaryColor,
      textTheme: textTheme(),
      iconTheme: iconTheme(),
    );
  }
}

TextTheme textTheme() {
  return TextTheme(
bodyLarge: TextStyle(
  fontFamily: 'Urbanist',
  fontSize: 26.sp,
  fontWeight: FontWeight.bold,
  color: AppColors.secondaryColor,
  height: 1.0, // Adjust the line height to a reasonable value
  letterSpacing: 0.5,
),

      bodyMedium: TextStyle(
        //All categories
        fontFamily: 'Urbanist',
        fontSize: 18.sp,
        fontWeight: FontWeight.w600,
        color: AppColors.secondaryColor,
        letterSpacing: -2,
      ),
      bodySmall: TextStyle(
        //AC Appliances
        fontFamily: 'Urbanist',
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.secondaryColor,
      ),
      displaySmall: TextStyle(
        fontFamily: 'Urbanist',
        fontSize: 13.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.secondaryColor,
      ));
}

IconThemeData iconTheme() {
  return IconThemeData(
    color: AppColors.secondaryColor,
    size: 24,
  );
}
