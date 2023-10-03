import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:personal_finance_advisor/src/core/constants/dimensions.dart';
import 'package:personal_finance_advisor/src/core/utils/theme/colors.dart';
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
      backgroundColor: AppColors.primaryMainColor.withOpacity(0.7),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(Dimensions.medium),
            child: Column(
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text("Complete Your Payment for Premium Content"),
                    ),
                    Spacing.mediumHeight(),
                    Text("Email"),
                    Spacing.smallHeight(),
                    CustomContainerLeftIcon(
                      field: "Email",
                      icon: Icons.email,
                    ),
                    Spacing.mediumHeight(),
                    Text("First Name"),
                    Spacing.smallHeight(),
                    CustomContainerLeftIcon(
                      field: "First Name",
                      icon: Icons.person,
                    ),
                    Spacing.mediumHeight(),
                    Text("Last Name"),
                    Spacing.smallHeight(),
                    CustomContainerLeftIcon(
                      field: "Last Name",
                      icon: Icons.person,
                    ),
                    Spacing.mediumHeight(),
                    Text("Card Number"),
                    Spacing.smallHeight(),
                    CustomContainerLeftIcon(
                      field: "Card Number",
                      icon: Icons.credit_card,
                    ),
                  ],
                ),
                const Spacing.smallHeight(),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text("Expiry Date"),
                        Spacing.smallHeight(),
                        SizedBox(
                          width: 100.0, // width of the text form field
                          height: 50.0, // height of the text form field
                          child: CustomSmallTextField(
                            hintField: "mm/yy",
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text("CVC"),
                        Spacing.smallHeight(),
                        SizedBox(
                          width: 100.0,
                          height: 50.0,
                          child: CustomSmallTextField(
                            hintField: "cvc",
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const Spacing.smallHeight(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text("Pin"),
                        Spacing.smallHeight(),
                        SizedBox(
                          width: 100.0,
                          height: 50.0,
                          child: CustomSmallTextField(
                            hintField: "pin",
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ConstrainedBox(
                          constraints: BoxConstraints(
                              maxWidth: 100,
                              maxHeight: 250,
                              minWidth: Dimensions.large,
                              minHeight: Dimensions.large),
                          child: Image(
                            image: AssetImage("images/apple-pay.png"),
                          ),
                        ),
                        Spacing.mediumWidth(),
                        ConstrainedBox(
                          constraints: BoxConstraints(
                              maxWidth: 100,
                              maxHeight: 250,
                              minWidth: Dimensions.large,
                              minHeight: Dimensions.large),
                          child: Image(
                            image: AssetImage("images/google-pay.png"),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Spacing.bigHeight(),
                Spacing.bigHeight(),
                Spacing.bigHeight(),
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
