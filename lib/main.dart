import 'package:flutter/material.dart';
import 'package:real_estate_app/home_main/home_main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'EuclidCircularRegular',
        useMaterial3: false,
      ),
      home: const HomeMainPage(),
    );
  }
}
