import 'package:flutter/material.dart';
import 'package:real_estate_app/theme/colors.dart';
import 'package:real_estate_app/theme/dimensions.dart';
import 'package:real_estate_app/utils/utils.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: getDeviceWidth(context),
        height: getDeviceHeight(context),
        padding: const EdgeInsets.symmetric(horizontal: AppDimensions.parentPadding, vertical: AppDimensions.parentPadding,),
        color: Colors.black,
        child: SafeArea(
          child: Stack(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                        color: AppColors.white,
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          prefixIcon: Container(
                            margin: const EdgeInsets.all(18),
                            child: Image.asset(
                                'assets/images/search_icon.png',
                              width: 24,
                              height: 24,
                            ),
                          ),
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          fillColor: AppColors.white,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 14,),
                  Container(
                    width: 60,
                    height: 60,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.white,
                    ),
                  )
                ],
              ),

              Positioned(
                left: AppDimensions.parentPadding,
                  bottom: AppDimensions.searchBottomMenuBottomMargin,
                  child: Column(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.menuGray.withOpacity(.8),
                        ),
                      ),
                      const SizedBox(height: 6,),
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.menuGray.withOpacity(.8),
                        ),
                      ),
                    ],
                  )
              ),

              Positioned(
                 right: AppDimensions.parentPadding,
                  bottom: AppDimensions.searchBottomMenuBottomMargin,
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppDimensions.borderRadius),
                      color: AppColors.menuGray.withOpacity(.8),
                    ),
                    child: const Row(
                      children: [
                        Text(
                            'List of variants',
                          style: TextStyle(
                            color: AppColors.white,
                          ),
                        )
                      ],
                    ),
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
