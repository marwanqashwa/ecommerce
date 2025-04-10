import 'package:ecommerce/screens/LogInScreen.dart';
import 'package:ecommerce/screens/OnBoardingScreen.dart';
import 'package:ecommerce/screens/Splash.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }

}