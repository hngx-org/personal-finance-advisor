import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:personal_finance_advisor/src/features/Login/login_page.dart';
import 'package:personal_finance_advisor/src/features/onboarding/forth_screen.dart';

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({super.key});

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
              SvgPicture.asset('lib/src/asset/onboarding3.svg'),

              const SizedBox(
                height: 60,
              ),

              //bold text
              const Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Text('Smart Savings Suggestions',
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
                  'Let AI guide you towards saving more efficiently with tailored recommendations.',
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
                          builder: (context) => const ForthScreen(),
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