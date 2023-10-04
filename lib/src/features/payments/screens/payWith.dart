import 'package:flutter/material.dart';
import 'package:in_app_payment/in_app_payment.dart';
import 'package:personal_finance_advisor/src/core/constants/dimensions.dart';
import 'package:personal_finance_advisor/src/core/utils/theme/colors.dart';
import 'package:personal_finance_advisor/src/general_widgets/custom_elevated_button.dart';
import 'package:personal_finance_advisor/src/general_widgets/spacing.dart';

class PayWith extends StatefulWidget {
  const PayWith({super.key});

  @override
  State<PayWith> createState() => _PayWithState();
}

class _PayWithState extends State<PayWith> {
  final pay = HNGPay();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.blueAccent.shade200,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            pay.googlePay(amountToPay: '45'),
            Spacing.largeHeight(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 90.0),
              child: GestureDetector(
                child: Container(
                  // height: 48,
                  padding: EdgeInsets.all(13),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: AppColors.baseBlack,
                  ),
                  child: Text(
                    "Pay With Apple Pay",
                    style: TextStyle(
                      color: AppColors.baseWhite,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
