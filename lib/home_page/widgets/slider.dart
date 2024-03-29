import 'dart:ui';

import 'package:flutter/material.dart';

class AppSlider extends StatefulWidget {
  const AppSlider({super.key});

  @override
  State<AppSlider> createState() => _AppSliderState();
}

class _AppSliderState extends State<AppSlider> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(.7),
                shape: BoxShape.circle
            ),
          ),
        )
      ],
    );
  }
}
