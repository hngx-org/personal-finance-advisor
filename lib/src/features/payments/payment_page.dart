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
          decoration: BoxDecoration(
            color: Colors.white24,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
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
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Hi"),
                   Text("Hey")],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
