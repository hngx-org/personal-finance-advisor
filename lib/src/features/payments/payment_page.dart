import 'package:flutter/material.dart';
import 'package:personal_finance_advisor/src/core/constants/dimensions.dart';
import 'package:personal_finance_advisor/src/general_widgets/Custom_Small_Text_Form.dart';
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
            color: Color(0xFF3369FF),
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
                    CustomContainerTextField(
                      boxheight: Dimensions.large,
                      boxwidth: Dimensions.medium,
                    ),
                    Spacing.mediumHeight(),
                    Text("First Name"),
                    Spacing.smallHeight(),
                    CustomContainerTextField(
                      boxheight: Dimensions.large,
                      boxwidth: Dimensions.medium,
                    ),
                    Spacing.mediumHeight(),
                    Text("Last Name"),
                    Spacing.smallHeight(),
                    CustomContainerTextField(
                      boxheight: Dimensions.large,
                      boxwidth: Dimensions.medium,
                    ),
                    Spacing.mediumHeight(),
                    Text("Card Number"),
                    Spacing.smallHeight(),
                    CustomContainerTextField(
                      boxheight: Dimensions.large,
                      boxwidth: Dimensions.medium,
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
                            maxLines: 1,
                            maxLength: 4,
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
                            maxLines: 1,
                            maxLength: 3,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Text("Pin"),
                          SizedBox(
                            width: 100.0, // width of the text form field
                            height: 50.0, // height of the text form field
                            child: CustomSmallTextField(
                              maxLines: 1,
                              maxLength: 4,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                
                Align(
                  alignment: Alignment.bottomRight,
                  child: CustomElevatedButton(
                    text: " Pay",
                    width: MediaQuery.sizeOf(context).width * 0.4,
                    height: MediaQuery.sizeOf(context).height * 0.05,
                    onTap: () {},
                    buttonStyle: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Color(0xFF5200FF),
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
