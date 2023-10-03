import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../general_widgets/spacing.dart';
import '../../payments/payment_page.dart';
import '../widgets/custom_botton.dart';
import '../widgets/custom_textfield.dart';
import 'log_in_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usenameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
    );
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
          top: MediaQuery.paddingOf(context).top,
          left: 36,
          right: 36,
          bottom: MediaQuery.viewInsetsOf(context).bottom / 36,
        ),
        height: MediaQuery.sizeOf(context).height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xff9183de),
              Color(0xffa094e3),
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Image.asset(
                  'assets/images/finance_girl_illustration.png',
                  height: MediaQuery.sizeOf(context).height * 0.3,
                ),
                const Spacing.mediumHeight(),
                Text(
                  'Hi there!',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.white.withOpacity(0.7),
                  ),
                ),
                const Text(
                  "Let's Get Started",
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                  ),
                ),
                const Spacing.bigHeight(),
                CustomTextField(
                  controller: _usenameController,
                  labelIcon: Icons.person,
                  labelText: 'Username',
                  hintText: 'Enter your username',
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        value.trim().length <= 1) {
                      return 'Please enter a valid username';
                    }
                    return null;
                  },
                ),
                const Spacing.mediumHeight(),
                CustomTextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  labelIcon: Icons.email,
                  labelText: 'Email',
                  hintText: 'Enter your email',
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        value.trim().length <= 1 ||
                        !value.contains('@') ||
                        !value.contains('.') ||
                        value.contains(' ') ||
                        value.contains(',')) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),
                const Spacing.mediumHeight(),
                CustomTextField(
                  controller: _passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  labelText: 'Password',
                  hintText: 'Enter your password',
                  labelIcon: Icons.key,
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        value.trim().length <= 1) {
                      return 'Please enter a valid password';
                    }
                    return null;
                  },
                ),
                const Spacing.largeHeight(),
                CustomButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();

                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const PaymentPage(),
                        ),
                      );
                    }
                  },
                  buttonText: 'Create An Account',
                  backgroundColor: const Color(0xFF52439A),
                  shadowColor: const Color(0xff9183de),
                ),
                const Spacing.largeHeight(),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '-------------------',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                      ),
                    ),
                    const Spacing.smallWidth(),
                    const Text(
                      'Or',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                    const Spacing.smallWidth(),
                    Text(
                      '-------------------',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                      ),
                    ),
                  ],
                ),
                const Spacing.largeHeight(),
                CustomButton(
                  onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                  ),
                  buttonText: 'Log In',
                  backgroundColor: Colors.white.withOpacity(0.28),
                  shadowColor: const Color(0xff9183de),
                ),
                const Spacing.bigHeight(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
