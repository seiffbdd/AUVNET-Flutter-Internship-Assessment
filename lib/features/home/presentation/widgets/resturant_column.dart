import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nawel/config/theme/app_colors.dart';

class ResturantColumn extends StatelessWidget {
  const ResturantColumn({
    super.key,
    required this.image,
    required this.title,
    required this.time,
  });
  final String image;
  final String title;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 70.h,
          width: 105.w,
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
          margin: EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.grey),
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Image.network(image),
        ),

        Text(
          title,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
            color: AppColors.darkGrey,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          time,
          style: Theme.of(
            context,
          ).textTheme.bodySmall!.copyWith(color: Color(0xff1e1e1e)),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
