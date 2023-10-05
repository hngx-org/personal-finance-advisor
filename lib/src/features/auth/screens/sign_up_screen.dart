import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hng_authentication/authentication.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal_finance_advisor/src/core/helper_fxn.dart';

import '../../../core/utils/theme/colors.dart';
import '../../../general_widgets/spacing.dart';
import '../../payments/screens/payment_options.dart';
import '../providers/user_provider.dart';
import '../widgets/custom_botton.dart';
import '../widgets/custom_textfield.dart';
import '../widgets/dotted_line_w_text.dart';
import 'log_in_screen.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({super.key});

  static String cookies = '';

  @override
  ConsumerState<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool showPass = false;
  bool _isSending = false;

  Future<void> _signUpUser() async {
    FocusManager.instance.primaryFocus?.unfocus(); // dismiss keyboard
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isSending = true;
      });
      _formKey.currentState!.save();

      final email = _emailController.text;
      final password = _passwordController.text;
      final name = _usernameController.text;

      final authRepository = Authentication();

      try {
        final userData = await authRepository.signUp(email, name, password);
        ref.read(userProvider.notifier).setUser({
          'id': userData?.id ?? "",
          'name': userData?.name ?? "",
          'email': userData?.email ?? "",
        });

        debugPrint('User cookie : ${userData?.cookie}');
        debugPrint('User cookie : ${userData?.email}');
        debugPrint('User cookie : ${userData?.name}');
        debugPrint('User cookie : ${userData?.credits}');
        SignUpScreen.cookies = userData?.cookie ?? "";

        toastMessage('Welcome ${userData?.name ?? ""}');
        if (!mounted) return;
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => const PaymentOptions(),
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
                    textInputAction: TextInputAction.next,
                    hideText: false,
                    controller: _usernameController,
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
                    controller: _passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.done,
                    labelText: 'Password',
                    hintText: 'Enter your password',
                    labelIcon: Icons.key,
                    hideText: !showPass,
                    onFieldSubmitted: (_) => _signUpUser(),
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
                    onPressed: _isSending ? null : _signUpUser,
                    buttonContent: _isSending
                        ? const SizedBox(
                            height: 24,
                            width: 24,
                            child: CircularProgressIndicator(),
                          )
                        : const Text(
                            'Create An Account',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
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
                        builder: (context) => const LoginScreen(),
                      ),
                      (route) => false,
                    ),
                    buttonContent: const Text(
                      'Log In',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                    backgroundColor: Colors.white.withOpacity(0.28),
                    shadowColor: const Color(0xff9183de),
                  ),
                  const Spacing.bigHeight(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
