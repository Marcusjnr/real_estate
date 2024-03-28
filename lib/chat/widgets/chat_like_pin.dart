import 'package:flutter/material.dart';
import 'package:real_estate_app/theme/colors.dart';
import 'package:real_estate_app/theme/dimensions.dart';

class ChatLikePin extends StatelessWidget {
  final String text;
  final Color color;

  const ChatLikePin({
    Key? key,
    required this.text,
    this.color = AppColors.primary,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(AppDimensions.borderRadius),
          topRight: Radius.circular(AppDimensions.borderRadius),
          bottomRight: Radius.circular(AppDimensions.borderRadius),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: AppColors.white
        ),
        textAlign: TextAlign.left,
      ),
    );
  }
}
