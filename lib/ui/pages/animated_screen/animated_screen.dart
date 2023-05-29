import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:weather/ui/pages/home_page/home_page.dart';
import 'package:weather/ui/ui_theme/app_colors.dart';

class AnimatedScreen extends StatelessWidget {
  const AnimatedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/snow_night.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Image.asset('assets/images/app_icon.png'),
      ),
      splashIconSize: 450,
      duration: 2000,
      backgroundColor: AppColors.darkBlueColor,
      // splashTransition: SplashTransition.decoratedBoxTransition,
      nextScreen: const HomePage(),
    );
  }
}
