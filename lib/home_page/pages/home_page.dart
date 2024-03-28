import 'package:flutter/material.dart';
import 'package:real_estate_app/home_page/widgets/buy_rent_display.dart';
import 'package:real_estate_app/home_page/widgets/grid_item.dart';
import 'package:real_estate_app/theme/colors.dart';
import 'package:real_estate_app/theme/dimensions.dart';
import 'package:real_estate_app/utils/utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late AnimationController locationFadeController;
  late AnimationController greetingAnimationController;
  late AnimationController staggeredSlowAnimationController;
  late AnimationController staggeredFastAnimationController;
  late AnimationController selectPerfectPlaceStaggeredAnimationController;
  late Interval locationContainerInterval;
  late Interval fadeLocationTextInterval;
  late Interval profilePictureScaleInterval;
  late Interval selectTextInterval;
  late Interval buyRentScaleInterval;
  late Interval roomsSlideInterval;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    locationFadeController =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);

    greetingAnimationController = AnimationController(
        duration: const Duration(milliseconds: 200), vsync: this);

    staggeredSlowAnimationController =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);

    staggeredFastAnimationController =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);

    selectPerfectPlaceStaggeredAnimationController =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);

    locationContainerInterval = const Interval(0.0, 0.5);
    fadeLocationTextInterval = const Interval(0.4, 1.0);
    profilePictureScaleInterval = const Interval(0.0, 1.0);

    selectTextInterval = const Interval(0.0, 1.0);
    buyRentScaleInterval = const Interval(0.5, 1.0);
    roomsSlideInterval = const Interval(0.9, 1.0);

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0.0, 1.0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: selectPerfectPlaceStaggeredAnimationController,
        curve: roomsSlideInterval,
      ),
    );

    locationFadeController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        greetingAnimationController.forward();
      }
    });

    greetingAnimationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        selectPerfectPlaceStaggeredAnimationController.forward();
      }
    });

    locationFadeController.forward();
    staggeredSlowAnimationController.forward();
    staggeredFastAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: getDeviceWidth(context),
        height: getDeviceHeight(context),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: const Alignment(0, 1.44),
            end: const Alignment(-1.9, -1.9),
            colors: [
              AppColors.primary.withOpacity(.4),
              AppColors.primary.withOpacity(.02)
            ],
            stops: const [
              0.04,
              0.5,
            ],
          ),
        ),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Stack(
                children: [
                  Container(
                    height: getDeviceHeight(context) * .6,
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 50,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizeTransition(
                              sizeFactor: CurvedAnimation(
                                parent: staggeredSlowAnimationController,
                                curve: locationContainerInterval,
                              ),
                              axis: Axis.horizontal,
                              axisAlignment: -1,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  color: Colors.white,
                                ),
                                padding: const EdgeInsets.all(14),
                                child: FadeTransition(
                                  opacity: CurvedAnimation(
                                      parent: locationFadeController,
                                      curve: fadeLocationTextInterval),
                                  child: const Row(
                                    children: [
                                      Icon(
                                        Icons.location_on_rounded,
                                        color: AppColors.appBrown,
                                      ),
                                      Text(
                                        'Saint Petersburg',
                                        style: TextStyle(
                                          color: AppColors.appBrown,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            ScaleTransition(
                              scale: CurvedAnimation(
                                parent: staggeredFastAnimationController,
                                curve: profilePictureScaleInterval,
                              ),
                              child: Container(
                                width: 50,
                                height: 50,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColors.primary),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        FadeTransition(
                          opacity: CurvedAnimation(
                              parent: greetingAnimationController,
                              curve: fadeLocationTextInterval),
                          child: const Row(
                            children: [
                              Text(
                                'Hi, Marina',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: AppColors.appBrown,
                                  fontSize: 24,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizeTransition(
                          sizeFactor: CurvedAnimation(
                            parent:
                                selectPerfectPlaceStaggeredAnimationController,
                            curve: selectTextInterval,
                          ),
                          axis: Axis.vertical,
                          axisAlignment: 0,
                          child: const Row(
                            children: [
                              Text(
                                "let's select your\nperfect place",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ScaleTransition(
                            scale: CurvedAnimation(
                              parent:
                                  selectPerfectPlaceStaggeredAnimationController,
                              curve: buyRentScaleInterval,
                            ),
                            child: const BuyRentDisplay()),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: SlideTransition(
                position: _offsetAnimation,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(AppDimensions.borderRadius),
                        topRight: Radius.circular(AppDimensions.borderRadius),
                      )),
                  child: Column(
                    children: [
                      Container(
                        width: getDeviceWidth(context),
                        height: 190,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.red,
                            image: const DecorationImage(
                              image: AssetImage(
                                  'assets/images/house_pic_living.jpg'),
                              fit: BoxFit.cover,
                            )),
                      ),
                      GridView.builder(
                        itemCount: imageList.length,
                        primary: false,
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 8.0,
                          crossAxisSpacing: 8.0,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return GridItem(
                            imageString: imageList[index],
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  List<String> get imageList => [
        'assets/images/house_interior_two.jpg',
        'assets/images/house_interior_three.jpg',
        'assets/images/house_interior_four.jpg',
        'assets/images/house_interior_five.jpg',
      ];

  @override
  void dispose() {
    staggeredSlowAnimationController.dispose();
    staggeredFastAnimationController.dispose();
    selectPerfectPlaceStaggeredAnimationController.dispose();
    locationFadeController.dispose();
    greetingAnimationController.dispose();
    super.dispose();
  }
}
