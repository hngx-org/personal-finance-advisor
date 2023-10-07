import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:personal_finance_advisor/src/core/utils/theme/colors.dart';
import 'package:personal_finance_advisor/src/core/utils/theme/text_styles.dart';
import 'package:personal_finance_advisor/src/features/auth/screens/sign_up_screen.dart';
import 'package:personal_finance_advisor/src/features/payments/screens/basic_card.dart';
import 'package:personal_finance_advisor/src/features/payments/screens/premium_card.dart';

class PaymentOptions extends StatefulWidget {
  const PaymentOptions({super.key});

  @override
  State<PaymentOptions> createState() => _PaymentOptionsState();
}

class _PaymentOptionsState extends State<PaymentOptions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => const SignUpScreen(),
              ),
              (route) => false,
            );
          },
        ),
        backgroundColor: Colors.transparent,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
        ),
        title: Text(
          "Payment options",
          style: AppTextStyles.textMdBold
              .copyWith(color: AppColors.baseBlack, fontSize: 22),
        ),
      ),
      backgroundColor: Colors.blue.shade50,
      body: const SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            PremiumCard(),
            BasicCard(),
          ],
        ),
      ),
      // const SafeArea(
      //   child: Padding(
      //     padding: EdgeInsets.symmetric(horizontal: Dimensions.tiny),
      //     child: Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //       children: [
      //         BasicCard(),
      //         PremiumCard(),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
