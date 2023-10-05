import 'package:flutter/cupertino.dart';
import 'package:personal_finance_advisor/src/core/utils/theme/colors.dart';
import 'package:personal_finance_advisor/src/features/chat/page/chat_intro_screen.dart';
import 'package:personal_finance_advisor/src/general_widgets/custom_pricing_container.dart';

class BasicCard extends StatelessWidget {
  const BasicCard({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPricingContainer(
      optionalButton: true,
      plan: "BASIC",
      plantext:
          """For all individuals who want an experience of Finance Advisor""",
      kcontent: const ["Smart Saving Suggestions", "Financial Insights"],
      xcontent: const ["Limited Prompts Per day"],
      iconxbgcolor: AppColors.baseBlack,
      iconxcolor: AppColors.baseWhite,
      planprice: r"$0",
      pricetext: "Per member, per month",
      buttontext: "Start 14 day free trial",
      buttontextsize: 14,
      onTap: () {
        Navigator.pushAndRemoveUntil(
          context,
          CupertinoPageRoute(
            builder: (context) => const ChatIntroScreen(),
          ),
          (route) => false,
        );
      },
    );
  }
}
