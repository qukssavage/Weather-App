import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logo: Image.asset('assets/images/app_icon.png'),
      showLoader: false,
      durationInSeconds: 5,
      gradientBackground: const LinearGradient(
        colors: [
          Color.fromARGB(255, 57, 64, 202),
          Color.fromARGB(255, 62, 184, 245),
        ],
      ),
      // navigator: const HomePage(),
    );
  }
}
