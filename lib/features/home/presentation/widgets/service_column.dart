import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nawel/config/theme/app_colors.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ServiceColumn extends StatelessWidget {
  const ServiceColumn({
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
          color: AppColors.lightGrey,
          child: CachedNetworkImage(imageUrl: image),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          decoration: BoxDecoration(
            color: AppColors.purple,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Text(
            time,
            style: Theme.of(context).textTheme.bodySmall,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
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
