import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:personal_finance_advisor/src/features/Login/login_page.dart';
import 'package:personal_finance_advisor/src/features/onboarding/second_screen.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

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
              SvgPicture.asset('lib/src/asset/Character.svg'),

              const SizedBox(
                height: 60,
              ),

              //bold text
              const Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Text('Welcome to AI Financial Advisor!',
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
                  'Empower your financial journey with smart insights and personalized advice, right at your fingertips',
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
                          builder: (context) => const SecondScreen(),
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
