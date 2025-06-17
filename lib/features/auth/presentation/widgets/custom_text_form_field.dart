import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nawel/config/theme/app_colors.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final bool obscureText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.icon,
    this.obscureText = false,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300.w,
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'This field can\'t be empty';
          }
          return null;
        },
        controller: controller,
        style: GoogleFonts.mulish(
          textStyle: Theme.of(context).textTheme.displayMedium,
        ),
        obscureText: obscureText,
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        decoration: InputDecoration(
          filled: true,

          fillColor: AppColors.grey.withValues(alpha: 0.2),
          contentPadding: EdgeInsets.symmetric(vertical: 24.0),
          prefixIcon: Icon(
            icon,
            color: AppColors.darkGrey.withValues(alpha: 0.5),
          ),
          hintText: hintText,
          hintStyle: GoogleFonts.mulish(
            textStyle: Theme.of(context).textTheme.displaySmall,
          ),

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide(color: Colors.transparent),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide(color: Colors.transparent),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide(color: Colors.transparent),
          ),
        ),
      ),
    );
  }
}
