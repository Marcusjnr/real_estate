import 'package:flutter/material.dart';
import 'package:real_estate_app/chat/pages/chat_page.dart';
import 'package:real_estate_app/home_main/widgets/bottom_nav.dart';
import 'package:real_estate_app/home_page/pages/home_page.dart';
import 'package:real_estate_app/search/pages/search_page.dart';
import 'package:real_estate_app/utils/utils.dart';

late AnimationController bottomAnimationController;

class HomeMainPage extends StatefulWidget {
  const HomeMainPage({super.key});

  @override
  State<HomeMainPage> createState() => _HomeMainPageState();
}

class _HomeMainPageState extends State<HomeMainPage> with TickerProviderStateMixin{
  int selectedScreen = 2;

  late Animation<Offset> _offsetAnimation;

  final List<Widget> _screens = [
    const SearchPage(),
    const ChatPage(),
    const HomePage(),
  ];

  @override
  void initState() {
    bottomAnimationController =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0.0, 2.0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: bottomAnimationController,
        curve: Curves.easeIn,
      ),
    );

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: getDeviceWidth(context),
            height: getDeviceHeight(context),
            child: _screens[selectedScreen],
          ),

          BottomNav(
            offsetAnimation: _offsetAnimation,
            bottomNavItemTapped: _bottomNavItemTapped,
          )
        ],
      ),
    );
  }


  void _bottomNavItemTapped(int selected){
    setState(() {
      selectedScreen = selected;
    });
  }
}
