import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:personal_finance_advisor/src/features/auth/screens/sign_up_screen.dart';
import 'package:personal_finance_advisor/src/features/onboarding/third_screen.dart';

class ForthScreen extends StatelessWidget {
  const ForthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 202, 220, 253),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              //illustrator
              SvgPicture.asset('lib/src/asset/onboarding4.svg'),

              const SizedBox(
                height: 60,
              ),

              //bold text
              const Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Text('Intelligent Financial Insights',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0E2C66)),
                    textAlign: TextAlign.center),
              ),
              const SizedBox(
                height: 15,
              ),

              //sub text
              const Text(
                  'Receive tailored advice and insights to help you make informed decisions for your financial well-being',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Nunito Sans'),
                  textAlign: TextAlign.center),
              // const SizedBox(
              //   height: 69,
              // ),
              const Spacer(),

              //navigation in row
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignUpScreen(),
                        ),
                        (route) => false,
                      );
                    },
                    child: const Text(
                      'Next',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF0E2C66)),
                    ),
                  ),
                ],
              ),
              const Spacer()
            ],
          ),
        ),
      ),
    );
  }
}
