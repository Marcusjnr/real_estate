import 'package:flutter/material.dart';
import 'package:real_estate_app/home_main/home_main_page.dart';
import 'package:real_estate_app/home_page/widgets/grid_item.dart';
import 'package:real_estate_app/theme/dimensions.dart';
import 'package:real_estate_app/utils/utils.dart';

class RoomsView extends StatefulWidget {
  final AnimationController sliderScaleAnimationController;

  const RoomsView({
    super.key,
    required this.sliderScaleAnimationController,
  });

  @override
  State<RoomsView> createState() => _RoomsViewState();
}

class _RoomsViewState extends State<RoomsView> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GridItem(
          imageString: 'assets/images/house_pic_living.jpg',
          width: getDeviceWidth(context),
          height: 190,
          sliderScaleAnimationController: widget.sliderScaleAnimationController,
          animationInterval: const Interval(0.0, 1.0),
          delay: 600,
        ),
        const SizedBox(
          height: AppDimensions.roomMargin,
        ),
        SizedBox(
          height: AppDimensions.roomLongHeight,
          child: Row(
            children: [
              GridItem(
                imageString: 'assets/images/house_interior_two.jpg',
                width: getDeviceWidth(context) * .5,
                height: AppDimensions.roomLongHeight,
                sliderScaleAnimationController:
                    widget.sliderScaleAnimationController,
                animationInterval: const Interval(0.3, 1.0),
                delay: 1000,
              ),
              const SizedBox(
                width: AppDimensions.roomMargin,
              ),
              Expanded(
                child: Column(
                  children: [
                    GridItem(
                      imageString: 'assets/images/house_interior_three.jpg',
                      height: AppDimensions.roomShortHeight,
                      sliderScaleAnimationController:
                          widget.sliderScaleAnimationController,
                      animationInterval: const Interval(0.5, 1.0),
                      delay: 800,
                    ),
                    const SizedBox(
                      height: AppDimensions.roomMargin,
                    ),
                    GridItem(
                      imageString: 'assets/images/house_interior_four.jpg',
                      height: AppDimensions.roomShortHeight,
                      sliderScaleAnimationController:
                          widget.sliderScaleAnimationController,
                      animationInterval: const Interval(0.8, 1.0),
                      delay: 1200,
                      delayCallBack: _startBottomAnimation
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  List<String> get imageList => [
        'assets/images/house_interior_two.jpg',
        'assets/images/house_interior_three.jpg',
        'assets/images/house_interior_four.jpg',
        'assets/images/house_interior_five.jpg',
      ];

  void _startBottomAnimation()=> bottomAnimationController.forward();
}