import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nawel/config/theme/app_colors.dart';

class CodeBanner extends StatelessWidget {
  const CodeBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.white,
      margin: EdgeInsets.symmetric(horizontal: 19.0),
      elevation: 5,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Image.asset('assets/images/Security Vault.jpg'),
          ),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Got a code !',
                  style: GoogleFonts.dmSans(
                    textStyle: Theme.of(
                      context,
                    ).textTheme.displaySmall!.copyWith(
                      color: AppColors.darkGrey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  'Add your code and save on your order',
                  style: GoogleFonts.dmSans(
                    textStyle: TextStyle(
                      fontSize: 10.sp,
                      color: AppColors.darkGrey.withValues(alpha: 0.5),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
