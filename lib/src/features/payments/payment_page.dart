import 'package:flutter/material.dart';
import 'package:personal_finance_advisor/src/core/constants/dimensions.dart';
import 'package:personal_finance_advisor/src/core/utils/theme/colors.dart';
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
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            color: Color(0xFF3369FF).withOpacity(0.1),
          ),
          child: Padding(
            padding: const EdgeInsets.all(Dimensions.medium),
            child: Column(
              children: [
                Column(
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
                Spacing.smallHeight(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text("Expiry Date"),
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
                        SizedBox(
                          width: 100.0, // width of the text form field
                          height: 50.0, // height of the text form field
                          child: CustomSmallTextField(
                            hintField: "cvc",
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Spacing.smallHeight(),
                Row(
                  children: [
                    Column(
                      children: [
                        Text("Pin"),
                        SizedBox(
                          width: 100.0, // width of the text form field
                          height: 50.0, // height of the text form field
                          child: CustomSmallTextField(
                            hintField: "pin",
                          ),
                        ),
                      ],
                    ),
                    Spacing.largeWidth(),
                    Column(children: [
                      Row(children: [
                        Image(
                          image: AssetImage("images/mastercard.png"),
                          height: Dimensions.large,
                          width: Dimensions.large,
                        ),
                        Spacing.mediumWidth(),
                        Image(
                          image: AssetImage("images/visa.png"),
                          height: Dimensions.large,
                          width: Dimensions.large,
                        ),
                        //   Image(
                        //   image: AssetImage("images/americanexpress.png"),
                        //   height: Dimensions.small,
                        //   width: Dimensions.small,
                        // ),
                      ]),
                      //
                    ]),
                  ],
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: CustomElevatedButton(
                    text: " Pay",
                    buttonTextStyle: TextStyle(color: AppColors.baseWhite),
                    width: MediaQuery.sizeOf(context).width * 0.4,
                    height: MediaQuery.sizeOf(context).height * 0.05,
                    onTap: () {},
                    buttonStyle: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Color(0xFF3369FF),
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              4.0), // border radius of 10 pixels
                        ),
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
