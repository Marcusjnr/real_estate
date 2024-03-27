import 'package:flutter/material.dart';
import 'package:real_estate_app/theme/colors.dart';
import 'package:real_estate_app/theme/dimensions.dart';
import 'package:real_estate_app/utils/count_up.dart';
import 'package:real_estate_app/utils/utils.dart';

class BuyRentDisplay extends StatelessWidget {
  const BuyRentDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: getDeviceWidth(context) * .4,
          width: getDeviceWidth(context) * .4,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.primary,
          ),
          child: const Column(
            children: [
              SizedBox(height: 12,),
              Text(
                'BUY',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),

              SizedBox(height: 17,),

              CountUp(
                begin: 0,
                end: 1034,
                duration: Duration(seconds: AppDimensions.countSeconds),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),

              Text(
                'offers',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(width: 16,),
        Expanded(
          child: Container(
            height: getDeviceWidth(context) * .4,
            width: getDeviceWidth(context) * .4,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            child: const Column(
              children: [
                SizedBox(height: 12,),
                Text(
                  'RENT',
                  style: TextStyle(
                    color: AppColors.appBrown,
                  ),
                ),

                SizedBox(height: 17,),

                CountUp(
                  begin: 0,
                  end: 2212,
                  duration: Duration(seconds: AppDimensions.countSeconds),
                  style: TextStyle(
                    color: AppColors.appBrown,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                Text(
                  'offers',
                  style: TextStyle(
                    color: AppColors.appBrown,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
