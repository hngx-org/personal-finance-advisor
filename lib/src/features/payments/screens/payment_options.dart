import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:in_app_payment/buttons/pay_buttons.dart';
import 'package:personal_finance_advisor/src/core/constants/dimensions.dart';
import 'package:personal_finance_advisor/src/core/utils/theme/colors.dart';
import 'package:personal_finance_advisor/src/features/chat/page/chat_intro_screen.dart';
import 'package:personal_finance_advisor/src/features/payments/payment_page.dart';
import 'package:personal_finance_advisor/src/features/payments/screens/payWith.dart';
import 'package:personal_finance_advisor/src/general_widgets/custom_elevated_button.dart';
import 'package:personal_finance_advisor/src/general_widgets/custom_pricing_container.dart';
import 'package:personal_finance_advisor/src/general_widgets/spacing.dart';

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
        automaticallyImplyLeading: true,
        backgroundColor: Colors.blueAccent,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
        ),
        title: Text(
          "Choose your payment option",
        ),
      ),
      backgroundColor: AppColors.baseWhite,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Dimensions.small),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Add the title as the first child of the column
              // const Text(
              //   "Choose your payment option",
              //   style: TextStyle(color: AppColors.baseBlack, fontSize: 24.0, fontWeight: FontWeight.bold),
              // ),
              const Spacing.largeHeight(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // const Spacing.bigHeight(),
                  CustomPricingContainer(
                    plan: "BASIC",
                    plantext:
                        """For all individuals who want an experience of Finance Advisor""",
                    kcontent: const [
                      "Unlimited prompts",
                    ],
                    xcontent: const [
                      "Financial Summary",
                      "Personalised answers",
                    ],
                    iconxbgcolor: AppColors.baseBlack,
                    iconxcolor: AppColors.baseWhite,
                    planprice: r"$0",
                    pricetext: "Per member, per month",
                    buttontext: "Start 14 day free trial",
                    onTap: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => const ChatIntroScreen(),
                          ));
                    },
                  ),
                  // const Spacing.smallWidth(),
                  CustomPricingContainer(
                    plan: "PREMIUM",
                    plantext:
                        """For individuals who want full experience of Finance Advisor""",
                    planprice: r"$49",
                    pricetext: "Per member, per month",
                    containercolor: Colors.blueAccent.shade200,
                    buttonColor: AppColors.baseWhite,
                    iconkbgcolor: AppColors.baseWhite,
                    iconkcolor: AppColors.baseBlack,
                    kcontent: const [
                      "Unlimited Prompts",
                      "Personalised answers",
                      "Financial Summary"
                    ],
                    buttontext: "Get Premium",
                    buttontextcolor: AppColors.baseBlack,
                    onTap: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => PayWith(),
                          ));
                    },
                  ),
                ],
              ),
              // Add some more text as the last child of the column
              // const Text(
              //   "Try our 100% free plan",
              //   style: TextStyle(color: AppColors.baseBlack, fontSize: 16.0),
              // ),
              //   CustomElevatedButton(
              //     margin: const EdgeInsets.symmetric(horizontal: 100),
              //     text: "Sign up today",
              //     // width: MediaQuery.sizeOf(context).width * 0.35,
              //     buttonStyle: ButtonStyle(
              //       backgroundColor: MaterialStateProperty.all<Color>(
              //         AppColors.primaryMainColor.withOpacity(0.8),
              //       ),
              //     ),
              //     onTap: () {
              //       Navigator.push(
              //           context,
              //           CupertinoPageRoute(
              //             builder: (context) => const PaymentPage(),
              //           ));
              //     },
              //   ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
