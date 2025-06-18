import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nawel/config/theme/app_colors.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 31.h, vertical: 35.h),
      decoration: BoxDecoration(
        color: Colors.black12,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/images/Rectangle 531.jpg'),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Delivering to",
                  style: GoogleFonts.dmSans(
                    textStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: AppColors.darkGrey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  "Al Satwa, 81A Street",
                  style: GoogleFonts.dmSans(
                    textStyle: Theme.of(
                      context,
                    ).textTheme.displayMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.darkGrey,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "Hi hepa!",
                  style: GoogleFonts.rubik(
                    textStyle: Theme.of(context).textTheme.headlineLarge,
                  ),
                ),
              ],
            ),
          ),
          CircleAvatar(
            radius: 30.h,
            backgroundImage: const AssetImage('assets/images/Ellipse 26.jpg'),
          ),
        ],
      ),
    );
  }
}
