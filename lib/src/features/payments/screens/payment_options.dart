import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:personal_finance_advisor/src/core/utils/theme/colors.dart';
import 'package:personal_finance_advisor/src/core/utils/theme/text_styles.dart';
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
        automaticallyImplyLeading: true,
        //add leading automatically icon
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
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
              .copyWith(color: AppColors.baseBlack, fontSize: 24),
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
