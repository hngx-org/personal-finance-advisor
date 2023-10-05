import 'package:flutter/material.dart';
import 'package:personal_finance_advisor/src/core/constants/dimensions.dart';
import 'package:personal_finance_advisor/src/core/utils/theme/colors.dart';
import 'package:personal_finance_advisor/src/general_widgets/custom_pricing_container.dart';

class PremiumCard extends StatelessWidget {
  const PremiumCard({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPricingContainer(
      optionalButton: false,
      plan: "PREMIUM",
      plantext:
          """For individuals who desire a full experience of Finance Advisor""",
      planprice: r"$49",
      pricetext: "Per member, per month",
      containercolor: Colors.blueAccent.shade200,
      iconkbgcolor: AppColors.baseWhite,
      iconkcolor: AppColors.baseBlack,
      kcontent: const [
        "Unlimited Prompts",
        "Personalised answers",
        "Financial Summary",
      ],
      buttonColor: AppColors.baseWhite,
      buttontext: "Get Premium",
      buttontextcolor: AppColors.baseBlack,
      buttontextsize: Dimensions.medium,
    );
  }
}
