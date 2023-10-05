import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hng_authentication/authentication.dart';

import 'package:personal_finance_advisor/src/features/chat/page/chat_screens.dart';

import '../../../core/utils/theme/colors.dart';
import '../../../general_widgets/spacing.dart';
import '../widgets/custom_botton.dart';
import '../widgets/custom_textfield.dart';
import 'sign_up_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

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
                  'assets/images/finance_guy_illustration.png',
                  height: MediaQuery.sizeOf(context).height * 0.3,
                ),
                const Spacing.mediumHeight(),
                Text(
                  'Welcome Back',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.white.withOpacity(0.7),
                  ),
                ),
                const Text(
                  "Please, Log In.",
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                  ),
                ),
                const Spacing.bigHeight(),
                CustomTextField(
                  hideText: false,
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
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      final email = _emailController.text;
                      final password = _passwordController.text;

                      final authRepository = Authentication();

                      try {
                        await authRepository.signIn(email, password);
                        if (!mounted) return;
                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                            builder: (context) => const ChatScreen(),
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
                  buttonText: 'Continue',
                  textIcon: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.white,
                    size: 16,
                  ),
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
                      builder: (context) => const SignUpScreen(),
                    ),
                    (route) => false,
                  ),
                  buttonText: 'Create An Account',
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
