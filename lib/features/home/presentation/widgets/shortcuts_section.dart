import 'package:flutter/material.dart';
import 'package:nawel/features/home/presentation/widgets/shortcut.dart';

class ShortcutsSection extends StatelessWidget {
  const ShortcutsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        Shortcut(image: 'assets/images/Mask group.jpg', title: 'Past Orders'),
        Shortcut(
          image: 'assets/images/Security Vault.jpg',
          title: 'Super Saver',
        ),
        Shortcut(image: 'assets/images/Group 34.jpg', title: 'Must-tries'),
        Shortcut(image: 'assets/images/Group 9.jpg', title: 'Give Back'),
        Shortcut(image: 'assets/images/Vector.jpg', title: 'Best Sellers'),
      ],
    );
  }
}
