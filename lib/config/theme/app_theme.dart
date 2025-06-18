import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nawel/config/theme/app_colors.dart';

/// Defines the global theme for the app, including text styles,
/// button styles, and background color.
ThemeData get appTheme {
  return ThemeData(
    textTheme: appTextTheme, // Custom text theme defined below

    scaffoldBackgroundColor: AppColors.white,
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: WidgetStateProperty.all<Color>(AppColors.facebookBlue),
      ),
    ),
  );
}

/// Defines a consistent set of text styles used throughout the app.
TextTheme get appTextTheme {
  return TextTheme(
    headlineLarge: TextStyle(
      fontSize: 30.sp,
      color: AppColors.white,
      fontWeight: FontWeight.bold,
    ),
    headlineMedium: TextStyle(
      fontSize: 28.sp,
      color: AppColors.black,
      fontWeight: FontWeight.w500,
    ),
    headlineSmall: TextStyle(
      fontSize: 20.sp,
      color: AppColors.black,
      fontWeight: FontWeight.bold,
    ),
    displayLarge: TextStyle(fontSize: 18.sp, color: AppColors.white),
    displayMedium: TextStyle(fontSize: 16.sp, color: AppColors.black),
    displaySmall: TextStyle(
      fontSize: 14.sp,
      color: AppColors.darkGrey.withValues(alpha: 0.5),
    ),
    bodySmall: TextStyle(fontSize: 12.sp, color: AppColors.white),
  );
}
