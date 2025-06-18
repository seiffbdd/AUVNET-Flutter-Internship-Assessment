import 'package:flutter/material.dart';

class CenterScreenLoadingIndicator extends StatelessWidget {
  const CenterScreenLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.black38,
      child: const Center(child: CircularProgressIndicator()),
    );
  }
}
