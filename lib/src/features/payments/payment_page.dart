import 'package:flutter/material.dart';
import 'package:personal_finance_advisor/src/core/constants/dimensions.dart';
import 'package:personal_finance_advisor/src/general_widgets/custom_container_text_field.dart';
import 'package:personal_finance_advisor/src/general_widgets/custom_image_view.dart';
import 'package:personal_finance_advisor/src/general_widgets/spacing.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Padding(
            padding: const EdgeInsets.all(Dimensions.small),
            child: Column(
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
                ),
                Spacing.mediumHeight(),
                Text("First Name"),
                Spacing.smallHeight(),
                CustomContainerTextField(
                  boxheight: Dimensions.large,
                ),
                Spacing.mediumHeight(),
                Text("Last Name"),
                Spacing.smallHeight(),
                CustomContainerTextField(
                  boxheight: Dimensions.large,
                ),
                Spacing.mediumHeight(),
                Text("Card Number"),
                Spacing.smallHeight(),
                CustomContainerTextField(
                  boxheight: Dimensions.large,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomContainerTextField(
                      boxheight: Dimensions.medium,
                      boxwidth: Dimensions.medium,
                    ),
                     CustomContainerTextField(
                      boxheight: Dimensions.medium,
                      boxwidth: Dimensions.medium,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
