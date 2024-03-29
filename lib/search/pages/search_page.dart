import 'dart:math';

import 'package:flutter/material.dart';
import 'package:real_estate_app/chat/widgets/chat_like_pin.dart';
import 'package:real_estate_app/search/models/search_category.dart';
import 'package:real_estate_app/theme/colors.dart';
import 'package:real_estate_app/theme/dimensions.dart';
import 'package:real_estate_app/utils/utils.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> with TickerProviderStateMixin {
  late AnimationController listAnimationController,
      optionsAnimationController,
      chatPinAnimationController;

  final Random _random = Random();
  late List<Widget> _widgets;

  @override
  void initState() {
    super.initState();

    listAnimationController =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);

    optionsAnimationController =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);

    chatPinAnimationController =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);

    _widgets = List.generate(4, (index) => _buildRandomPin());

    optionsAnimationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        chatPinAnimationController.forward();
      }
    });
    optionsAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: getDeviceWidth(context),
        height: getDeviceHeight(context),
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimensions.parentPadding,
          vertical: AppDimensions.parentPadding,
        ),
        decoration: const BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
            image: AssetImage('assets/images/map.png'),
            fit: BoxFit.cover,
          )
        ),
        child: SafeArea(
          child: Stack(
            children: [
              Row(
                children: [
                  Expanded(
                    child: ScaleTransition(
                      scale: CurvedAnimation(
                        parent: optionsAnimationController,
                        curve: Curves.easeInOut,
                      ),
                      child: Container(
                        height: 54,
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
                                color: Colors.black,
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
                  ),
                  const SizedBox(
                    width: 14,
                  ),
                  ScaleTransition(
                    scale: CurvedAnimation(
                      parent: optionsAnimationController,
                      curve: Curves.easeInOut,
                    ),
                    child: Container(
                      width: 54,
                      height: 54,
                      padding: const EdgeInsets.all(14),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.white,
                      ),
                      child: Image.asset(
                        'assets/images/filter.png',
                      ),
                    ),
                  )
                ],
              ),
              Positioned(
                left: AppDimensions.parentPadding,
                bottom: AppDimensions.searchBottomMenuBottomMargin,
                child: ScaleTransition(
                  scale: CurvedAnimation(
                    parent: optionsAnimationController,
                    curve: Curves.easeInOut,
                  ),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: _openMenu,
                        child: Container(
                          width: AppDimensions.searchOptionContainer,
                          height: AppDimensions.searchOptionContainer,
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.menuGray.withOpacity(.8),
                          ),
                          child: Image.asset(
                            'assets/images/wallet.png',
                            color: AppColors.searchOption,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Container(
                        width: AppDimensions.searchOptionContainer,
                        height: AppDimensions.searchOptionContainer,
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.menuGray.withOpacity(.8),
                        ),
                        child: Image.asset(
                          'assets/images/send.png',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: AppDimensions.searchListContainerBottomMargin,
                child: ScaleTransition(
                  alignment: Alignment.bottomLeft,
                  scale: CurvedAnimation(
                    parent: listAnimationController,
                    curve: Curves.easeInOut,
                  ),
                  child: Container(
                    width: 250,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(
                        AppDimensions.borderRadius,
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: listTitles
                          .map(
                            (listItem) => ListTile(
                              onTap: _closeMenu,
                              leading: Image.asset(
                                listItem.icon,
                                width: 26,
                                height: 26,
                              ),
                              title: Text(
                                listItem.title,
                                style: const TextStyle(
                                  color: AppColors.searchListTitle,
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ),
              ),
              Positioned(
                right: AppDimensions.parentPadding,
                bottom: AppDimensions.searchBottomMenuBottomMargin,
                child: ScaleTransition(
                  scale: CurvedAnimation(
                    parent: optionsAnimationController,
                    curve: Curves.easeInOut,
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(AppDimensions.borderRadius),
                      color: const Color(0xFF777777).withOpacity(.7),
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/images/left-align.png',
                          color: AppColors.white,
                          width: 14,
                          height: 14,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          'List of variants',
                          style: TextStyle(
                            color: AppColors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              ..._widgets,
            ],
          ),
        ),
      ),
    );
  }

  void _openMenu() => listAnimationController.forward();

  void _closeMenu() => listAnimationController.reverse();

  Widget _buildRandomPin() {
    double top = 160 + _random.nextDouble() * (300 - 160);
    double left = _random.nextDouble() * 300;
    return Positioned(
        top: top,
        left: left,
        child: ScaleTransition(
          scale: CurvedAnimation(
            parent: chatPinAnimationController,
            curve: Curves.easeInOut,
          ),
          child: const ChatLikePin(
            text: 'Money',
          ),
        ));
  }

  List<SearchCategory> get listTitles => [
        const SearchCategory('assets/images/cosy_areas.png', 'Cosy areas'),
        const SearchCategory('assets/images/wallet.png', 'Price'),
        const SearchCategory('assets/images/basket.png', 'Infrastructure'),
        const SearchCategory('assets/images/layers.png', 'Without any layer'),
      ];

  @override
  void dispose() {
    listAnimationController.dispose();
    optionsAnimationController.dispose();
    chatPinAnimationController.dispose();
    super.dispose();
  }
}
