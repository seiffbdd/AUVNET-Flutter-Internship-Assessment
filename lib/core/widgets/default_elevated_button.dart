import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nawel/config/theme/app_colors.dart';

class DefaultElevatedButton extends StatelessWidget {
  const DefaultElevatedButton({
    super.key,
    required this.text,
    this.textStyle,
    this.onPressed,
  });
  final String text;
  final TextStyle? textStyle;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed ?? () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.purple,
        padding: EdgeInsets.symmetric(vertical: 24),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: Text(
        text,
        style:
            textStyle ??
            GoogleFonts.rubik(
              textStyle: Theme.of(context).textTheme.displayLarge,
            ),
      ),
    );
  }
}
