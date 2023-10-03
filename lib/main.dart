import 'package:flutter/material.dart';
import 'package:personal_finance_advisor/src/features/Splash/splash_screen.dart';
import 'package:personal_finance_advisor/src/features/chat/page/chat_screens.dart';
import 'package:personal_finance_advisor/src/features/payments/payment_page.dart';
import 'package:personal_finance_advisor/src/features/payments/screens/payment_options.dart';

import 'src/features/chat/page/chat_intro_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Poppins',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
