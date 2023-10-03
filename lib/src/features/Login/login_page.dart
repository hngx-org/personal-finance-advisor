import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:personal_finance_advisor/src/features/payments/payment_page.dart';
import 'package:personal_finance_advisor/src/features/payments/screens/payment_options.dart';
import 'package:personal_finance_advisor/src/general_widgets/custom_elevated_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    TextEditingController _controller = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //illustrator
                // Container(
                //   padding: EdgeInsets.all(50),
                //   child: SvgPicture.asset(
                //     'lib/src/asset/undraw_login_re_4vu2.svg',
                //   ),
                // ),
        
                //welcome back
                const Center(
                  child: Text(
                    'Welcome',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
              ]
              ),

              //Name
              Text(
                'Enter your name',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextField(
                controller: _controller,
              ),

              const SizedBox(
                height: 35,
              ),

              Text(
                'Enter your email',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextField(
                controller: _controller,
              ),
              const SizedBox(
                height: 35,
              ),

              Text(
                'Enter your password',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextField(
                controller: _controller,
              ),

              const SizedBox(
                height: 35,
              ),

              CustomElevatedButton(
                height: 52,
                text: 'Login',
                onTap: () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => const PaymentOptions(),
                      ));
                },
              )
            ],
          )
          ),
        ),
      ),
    );
  }
}
