import 'package:flutter/material.dart';
import 'package:personal_finance_advisor/src/core/constants/dimensions.dart';
import 'package:personal_finance_advisor/src/core/utils/theme/text_styles.dart';
import 'package:personal_finance_advisor/src/general_widgets/custom_pricing_container.dart';
import 'package:personal_finance_advisor/src/general_widgets/spacing.dart';

class PaymentOptions extends StatelessWidget {
  const PaymentOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Color(0xFF3369FF),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Add the title as the first child of the column
          Text(
            "Choose your payment option",
            style: TextStyle(color: Colors.white, fontSize: 24.0),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Spacing.bigHeight(),
              CustomPricingContainer(
                kcontent: [
                  "Unlimited prompts",
                ],
                xcontent: ["Financial Summary" , "Personalised answers",],
                action: "Start 14 day free trial",
                onTap: () {},
              ),
              CustomPricingContainer(
                kcontent: ["Unlimited Prompts", "Personalised  answers"],
                action: "Get Premium",
                onTap: () {},
              ),
            ],
          ),
          // Add some more text as the last child of the column
          Text(
            "Thank you for choosing us",
            style: TextStyle(color: Colors.white, fontSize: 18.0),
          ),
        ],
      ),
    );
  }
}
