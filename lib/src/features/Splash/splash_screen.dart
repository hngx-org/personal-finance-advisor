import 'package:flutter/material.dart';
import 'package:personal_finance_advisor/src/core/utils/theme/colors.dart';

import 'package:personal_finance_advisor/src/features/Splash/screen_ui.dart';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:personal_finance_advisor/src/features/onboarding/first_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      backgroundColor: AppColors.primaryMainColor,
      splash: const ScreenUI(),
      nextScreen: const FirstScreen(),
    );
  }
}
