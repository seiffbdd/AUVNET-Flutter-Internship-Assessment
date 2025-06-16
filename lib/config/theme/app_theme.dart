import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nawel/config/theme/app_colors.dart';

ThemeData get appTheme {
  return ThemeData(
    textTheme: appTextTheme,

    scaffoldBackgroundColor: AppColors.white,
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: WidgetStateProperty.all<Color>(AppColors.facebookBlue),
      ),
    ),
  );
}

TextTheme get appTextTheme {
  return TextTheme(
    headlineLarge: TextStyle(fontSize: 30.sp, color: AppColors.black),
    headlineMedium: TextStyle(fontSize: 28.sp, color: AppColors.black),
    headlineSmall: TextStyle(fontSize: 20.sp, color: AppColors.black),
    displayLarge: TextStyle(fontSize: 18.sp, color: AppColors.white),
    displayMedium: TextStyle(fontSize: 16.sp, color: AppColors.black),
    displaySmall: TextStyle(fontSize: 14.h, color: AppColors.darkGrey),
    bodySmall: TextStyle(fontSize: 12.h, color: AppColors.white),
  );
}
