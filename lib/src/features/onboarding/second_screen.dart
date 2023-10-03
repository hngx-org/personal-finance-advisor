import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:personal_finance_advisor/src/features/Login/login_page.dart';
import 'package:personal_finance_advisor/src/features/onboarding/third_screen.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              //illustrator
              SvgPicture.asset('lib/src/asset/onboarding2.svg'),

              const SizedBox(
                height: 60,
              ),

              //bold text
              const Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Text('Stay in Control of Your Finances',
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
                  'Maximize your funds with our AI-powered recommendations tailored just for you.',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Nunito Sans'),
                  textAlign: TextAlign.center),
              // const SizedBox(
              //   height: 69,
              // ),
              Spacer(),

              //navigation in row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        ),
                      );
                    },
                    child: const Text(
                      'Skip',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF0E2C66)),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ThirdScreen(),
                        ),
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
              Spacer()
            ],
          ),
        ),
      ),
    );
  }
}
