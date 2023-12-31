import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hng_authentication/authentication.dart';
import 'package:personal_finance_advisor/src/features/payments/screens/payment_options.dart';

import '../../../core/helper_fxn.dart';
import '../../../core/utils/theme/colors.dart';
import '../../../general_widgets/spacing.dart';
import '../../chat/page/chat_screens.dart';
import '../providers/user_provider.dart';
import '../widgets/custom_botton.dart';
import '../widgets/custom_textfield.dart';
import '../widgets/dotted_line_w_text.dart';
import 'sign_up_screen.dart';

class LoginScreen extends ConsumerStatefulWidget {
  final Widget pageTo;
  const LoginScreen(this.pageTo, {super.key});
  static String cookies = '';

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool showPass = false;
  bool _isSending = false;

  Future<void> _logInUser() async {
    FocusManager.instance.primaryFocus?.unfocus(); // dismiss keyboard
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isSending = true;
      });
      _formKey.currentState!.save();

      final email = _emailController.text;
      final password = _passwordController.text;

      final authRepository = Authentication();

      try {
        final userData = await authRepository.signIn(email, password);
        ref.read(userProvider.notifier).setUser({
          'id': userData?.id ?? "",
          'name': userData?.name ?? "",
          'email': userData?.email ?? "",
        });
        log('Data retrieved => ${userData.toString}');
        toastMessage('Welcome back ${userData?.name ?? ""}');
        LoginScreen.cookies = userData.cookie;
        if (!mounted) return;
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => widget.pageTo,
          ),
          (route) => false,
        );
      } on ApiException catch (ex) {
        setState(() {
          _isSending = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              ex.message,
            ),
            duration: const Duration(seconds: 3),
          ),
        );
      } catch (otherExceptions) {
        setState(() {
          _isSending = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              otherExceptions.toString(),
            ),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final userDetails = ref.watch(userProvider);
    debugPrint(userDetails.toString()); // Testing

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
    );
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.only(
            top: MediaQuery.paddingOf(context).top + 24,
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
                    height: MediaQuery.sizeOf(context).height * 0.25,
                  ),
                  const Spacing.mediumHeight(),
                  Text(
                    'Welcome!',
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
                    textInputAction: TextInputAction.next,
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
                        return 'Enter a valid email address';
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
                    textInputAction: TextInputAction.done,
                    labelText: 'Password',
                    hintText: 'Enter your password',
                    labelIcon: Icons.key,
                    onFieldSubmitted: (_) => _logInUser(),
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
                    onPressed: _isSending ? null : _logInUser,
                    buttonContent: _isSending
                        ? const SizedBox(
                            height: 24,
                            width: 24,
                            child: CircularProgressIndicator(),
                          )
                        : const Row(
                            children: [
                              Text(
                                'Continue',
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                              Spacing.tinyWidth(),
                              Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: Colors.white,
                                size: 16,
                              ),
                            ],
                          ),
                    backgroundColor: AppColors.primaryMainColor,
                    shadowColor: Colors.white.withOpacity(0.1),
                  ),
                  const Spacing.largeHeight(),
                  const DottedLineWText(),
                  const Spacing.largeHeight(),
                  CustomButton(
                    onPressed: () => Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) => const SignUpScreen(),
                      ),
                      (route) => false,
                    ),
                    buttonContent: const Text(
                      'Create An Account',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                    backgroundColor: Colors.white.withOpacity(0.28),
                    shadowColor: const Color(0xff9183de).withOpacity(0.8),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
