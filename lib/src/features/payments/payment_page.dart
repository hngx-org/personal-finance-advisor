import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:personal_finance_advisor/src/core/constants/dimensions.dart';
import 'package:personal_finance_advisor/src/core/utils/theme/colors.dart';
import 'package:personal_finance_advisor/src/core/utils/theme/text_styles.dart';
import 'package:personal_finance_advisor/src/features/chat/page/chat_intro_screen.dart';
import 'package:personal_finance_advisor/src/general_widgets/Custom_Small_Text_Form.dart';
import 'package:personal_finance_advisor/src/general_widgets/custom_container_lefticon.dart';
import 'package:personal_finance_advisor/src/general_widgets/custom_container_text_field.dart';
import 'package:personal_finance_advisor/src/general_widgets/custom_elevated_button.dart';
import 'package:personal_finance_advisor/src/general_widgets/custom_image_view.dart';
import 'package:personal_finance_advisor/src/general_widgets/spacing.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryMainColor.withOpacity(0.8),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Text(
                  "Complete Your Payment for Premium Content",
                  textAlign: TextAlign.center,
                  style: AppTextStyles.textLgBold.copyWith(
                    color: AppColors.baseWhite,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomContainerLeftIcon(
                      labelField: "Email",
                      field: "Email",
                      icon: Icons.email,
                    ),
                    Spacing.mediumHeight(),
                    CustomContainerLeftIcon(
                      labelField: "First Name",
                      field: "First Name",
                      icon: Icons.person,
                    ),
                    Spacing.mediumHeight(),
                    CustomContainerLeftIcon(
                      labelField: "Last Name",
                      field: "Last Name",
                      icon: Icons.person,
                    ),
                    Spacing.mediumHeight(),
                    CustomContainerLeftIcon(
                      field: "Card Number",
                      icon: Icons.credit_card,
                      labelField: "Card Number",
                    ),
                  ],
                ),
                const Spacing.smallHeight(),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        CustomSmallTextField(
                          hintField: "mm/yy",
                          labelSmallField: "Expiry Date",
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        CustomSmallTextField(
                          hintField: "cvc",
                          labelSmallField: "CVC",
                        ),
                      ],
                    ),
                  ],
                ),
                const Spacing.smallHeight(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      children: [
                        CustomSmallTextField(
                          labelSmallField: "Pin",
                          hintField: "pin",
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Spacing.mediumHeight(),
                        ConstrainedBox(
                          constraints: const BoxConstraints(
                              maxWidth: 100,
                              maxHeight: 250,
                              minWidth: Dimensions.large,
                              minHeight: Dimensions.large),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50.0),
                            child: const Image(
                              image: AssetImage("images/apple-pay.png"),
                            ),
                          ),
                        ),
                        const Spacing.mediumWidth(),
                        ConstrainedBox(
                          constraints: const BoxConstraints(
                              maxWidth: 100,
                              maxHeight: 250,
                              minWidth: Dimensions.large,
                              minHeight: Dimensions.large),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50.0),
                          
                            child: const Image(
                              image: AssetImage("images/google-pay.png"),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const Spacing.largeHeight(),
                CustomElevatedButton(
                  alignment: Alignment.bottomRight,
                  text: " Pay",
                  buttonTextStyle: const TextStyle(color: AppColors.baseWhite),
                  width: MediaQuery.sizeOf(context).width * 0.4,
                  height: MediaQuery.sizeOf(context).height * 0.05,
                  onTap: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => const ChatIntroScreen(),
                        ));
                  },
                  buttonStyle: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      const Color(0xFF3369FF),
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            50), // border radius of 10 pixels
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
