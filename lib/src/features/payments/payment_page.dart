import 'package:flutter/material.dart';
import 'package:personal_finance_advisor/src/core/constants/dimensions.dart';
import 'package:personal_finance_advisor/src/general_widgets/custom_container_text_field.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Text("Complete Your Payment for Premium Content"),
            CustomContainerTextField(boxheight: Dimensions.large,)
          ],
        ),
      ),
    );
  }
}