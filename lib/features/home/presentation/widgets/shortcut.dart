import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nawel/config/theme/app_colors.dart';

class Shortcut extends StatelessWidget {
  const Shortcut({super.key, required this.image, required this.title});
  final String image;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 65.h,
          width: 65.h,
          padding: EdgeInsets.all(16.h),
          margin: EdgeInsets.symmetric(horizontal: 8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            color: AppColors.lightPeach,
          ),
          child: Image.asset(image, fit: BoxFit.cover),
        ),
        Text(
          title,
          style: Theme.of(context).textTheme.displaySmall!.copyWith(
            color: AppColors.darkGrey,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
