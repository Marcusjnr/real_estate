import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:real_estate_app/theme/colors.dart';
import 'package:real_estate_app/utils/utils.dart';

class GridItem extends StatefulWidget {
  final String imageString;
  final double? width;
  final double? height;
  final AnimationController sliderScaleAnimationController;
  final Interval animationInterval;
  final int delay;
  final Function()? delayCallBack;
  final String text;
  final AlignmentGeometry alignmentGeometry;
  final double fontSize;
  final double fontDisplaySize;
  final double textLeftPadding;

  const GridItem({
    super.key,
    required this.imageString,
    this.height,
    this.width,
    required this.sliderScaleAnimationController,
    required this.animationInterval,
    required this.delay,
    required this.text,
    this.alignmentGeometry = Alignment.center,
    this.delayCallBack,
    this.fontSize = 14,
    this.fontDisplaySize = 100,
    this.textLeftPadding = 8.0
  });

  @override
  State<GridItem> createState() => _GridItemState();
}

class _GridItemState extends State<GridItem> {
  bool _showAnimation = false;

  @override
  void initState() {
    super.initState();

    widget.sliderScaleAnimationController.addStatusListener((status) {
      if(status == AnimationStatus.completed){
        Timer( Duration(milliseconds: widget.delay), () {
          setState(() {
            _showAnimation = true;
          });
          if(widget.delayCallBack != null){
            widget.delayCallBack!();
          }
        });
      }
    });

  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width ?? getDeviceWidth(context),
      height: widget.height,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: AssetImage(widget.imageString),
            fit: BoxFit.cover,
          ),),
      child: Stack(
        children: [
          AnimatedPositioned(
            duration: const Duration(milliseconds: 500),
            bottom: 12,
            right: _showAnimation ? 0 : (widget.width ?? getDeviceWidth(context)) - 100,
            left: 0,
            child: ScaleTransition(
              scale: CurvedAnimation(
                parent: widget.sliderScaleAnimationController,
                curve: widget.animationInterval,
              ),
              child: ClipRect(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      width: _showAnimation ? widget.width ?? getDeviceWidth(context) : 50,
                      height: 50,
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(.7),
                        borderRadius: BorderRadius.circular(30),),
                      child: Stack(
                        children: [
                          Positioned(
                            top: 2,
                            right: 2,
                            left: _showAnimation ? null : 0,
                            child: Container(
                              width: 40,
                              height: 40,
                              decoration: const BoxDecoration(
                                  color: AppColors.white, shape: BoxShape.circle),
                              child: const Center(
                                child: Icon(
                                  Icons.keyboard_arrow_right,
                                  size: 18,
                                ),),
                            ),
                          ),

                          if(_showAnimation)
                           Align(
                              alignment: widget.alignmentGeometry,
                              child: Padding(
                                padding: EdgeInsets.only(left: widget.textLeftPadding),
                                child: SizedBox(
                                  width: widget.fontDisplaySize,
                                  child: Text(
                                      widget.text,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: widget.fontSize,
                                    ),
                                  ),
                                ),
                              ),)
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
