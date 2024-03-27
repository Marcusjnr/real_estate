import 'package:flutter/material.dart';
import 'package:real_estate_app/theme/colors.dart';

class BottomNavMenuItem extends StatelessWidget {
  final Color color;
  final Function() onTap;
  const BottomNavMenuItem({super.key, this.color = AppColors.bottomNavigationItemBackColor, required this.onTap,});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 42,
        width: 42,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
        ),
      ),
    );
  }
}
