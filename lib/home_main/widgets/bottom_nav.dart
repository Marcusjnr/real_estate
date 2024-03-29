import 'package:flutter/material.dart';
import 'package:real_estate_app/home_main/widgets/bottom_nav_menu_item.dart';
import 'package:real_estate_app/theme/colors.dart';
import 'package:real_estate_app/theme/dimensions.dart';

class BottomNav extends StatefulWidget {
  final Function(int) bottomNavItemTapped;
  final Animation<Offset> offsetAnimation;

  const BottomNav({
    super.key,
    required this.bottomNavItemTapped,
    required this.offsetAnimation,
  });

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int currentSelected = 2;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: AppDimensions.bottomNavBarBottomMargin,
        left: 50,
        right: 50,
        child: SlideTransition(
          position: widget.offsetAnimation,
          child: Container(
            width: MediaQuery.sizeOf(context).width,
            height: AppDimensions.bottomNavBarHeight,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(36),
              color: AppColors.bottomNavigationColor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BottomNavMenuItem(
                  color: _determineColor(0),
                  onTap: () => _tapped(0),
                  icon: 'assets/images/search.png',
                ),
                BottomNavMenuItem(
                  color: _determineColor(1),
                  onTap: () => _tapped(1),
                  icon: 'assets/images/message.png',
                ),
                BottomNavMenuItem(
                  color: _determineColor(2),
                  onTap: () => _tapped(2),
                  icon: 'assets/images/home.png',
                ),
                BottomNavMenuItem(
                  color: _determineColor(3),
                  onTap: () => _tapped(3),
                  icon: 'assets/images/heart.png',
                ),
                BottomNavMenuItem(
                  color: _determineColor(4),
                  onTap: () => _tapped(4),
                  icon: 'assets/images/avatar.png',
                ),
              ],
            ),
          ),
        ));
  }

  Color _determineColor(int selected) {
    if (currentSelected == selected) {
      return AppColors.primary;
    }

    return AppColors.bottomNavigationItemBackColor;
  }

  void _tapped(int selected) {
    setState(() {
      currentSelected = selected;
    });
    widget.bottomNavItemTapped(selected);
  }
}
