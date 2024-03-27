import 'package:flutter/material.dart';
import 'package:real_estate_app/utils/utils.dart';

class GridItem extends StatelessWidget {
  final String imageString;
  const GridItem({super.key, required this.imageString,});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getDeviceWidth(context),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.red,
          image: DecorationImage(
            image: AssetImage(imageString),
            fit: BoxFit.cover,
          )
      ),
    );
  }
}
