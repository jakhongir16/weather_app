import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/ui/pages/home_page/home_page.dart';

class AnimatedScreen extends StatelessWidget {
  const AnimatedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: 'assets/images/animatedweather.gif',
      splashIconSize: 850,
      nextScreen: const HomePage(),
      backgroundColor: Colors.white,
      duration: 3000,
    );
  }
}