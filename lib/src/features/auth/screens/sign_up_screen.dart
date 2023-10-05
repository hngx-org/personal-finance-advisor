import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hng_authentication/authentication.dart';

import '../../../core/utils/theme/colors.dart';
import '../../../general_widgets/spacing.dart';
import '../../payments/screens/payment_options.dart';
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
  bool showPass = false;

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
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.primaryMainColor.withOpacity(0.7),
              AppColors.primaryMainColor,
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
                  hideText: false,
                  controller: _usenameController,
                  labelIcon: Icons.person,
                  labelText: 'Username',
                  hintText: 'Enter your username',
                  validator: (value) {
                    // Regular expression to match alphanumeric characters and optional underscore
                    final RegExp usernameRegex = RegExp(r'^[a-zA-Z0-9_]+$');

                    if (value == null || value.isEmpty || value.length < 2) {
                      return 'Username must be at least 2 characters long';
                    }

                    if (!usernameRegex.hasMatch(value)) {
                      return 'Alphanumeric characters & underscores only';
                    }

                    return null;
                  },
                ),
                const Spacing.mediumHeight(),
                CustomTextField(
                  hideText: false,
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  labelIcon: Icons.email,
                  labelText: 'Email',
                  hintText: 'Enter your email',
                  validator: (value) {
                    // Regular expression to match a valid email address
                    final RegExp emailRegex = RegExp(
                        r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');

                    if (value == null ||
                        value.isEmpty ||
                        !emailRegex.hasMatch(value)) {
                      return 'Please enter a valid email address';
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
                  hideText: !showPass,
                  visibilityIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        showPass = !showPass;
                      });
                    },
                    icon: showPass
                        ? const Icon(
                            Icons.remove_red_eye_rounded,
                            color: Color(0xFF3C3C43),
                            size: 20,
                          )
                        : const Icon(
                            Icons.visibility_off_rounded,
                            color: Color(0xFF3C3C43),
                            size: 20,
                          ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty || value.length < 8) {
                      return 'Password must be at least 8 characters long';
                    }
                    return null;
                  },
                ),
                const Spacing.largeHeight(),
                CustomButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      final email = _emailController.text;
                      final password = _passwordController.text;
                      final name = _usenameController.text;

                      final authRepository = Authentication();

                      // print(data);

                      try {
                        await authRepository.signUp(email, name, password);
                        if (!mounted) return;
                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                            builder: (context) => const PaymentOptions(),
                          ),
                          (route) => false,
                        );
                      } catch (ex) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              ex.toString(),
                            ),
                            duration: const Duration(seconds: 3),
                          ),
                        );
                      }
                    }
                  },
                  buttonText: 'Create An Account',
                  backgroundColor: AppColors.primaryMainColor,
                  shadowColor: Colors.white.withOpacity(0.1),
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
                  onPressed: () => Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                    (route) => false,
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
