import 'package:flutter/material.dart';
import 'package:personal_finance_advisor/src/core/utils/theme/colors.dart';
import 'package:personal_finance_advisor/src/features/Login/login_page.dart';
import 'package:personal_finance_advisor/src/features/Splash/screen_ui.dart';
import 'package:personal_finance_advisor/src/features/chat/page/chat_screens.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:personal_finance_advisor/src/general_widgets/custom_image_view.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      backgroundColor: AppColors.primaryMainColor,
      splash:
      const ScreenUI(),
      nextScreen: const LoginPage(),
    );
  }
}
