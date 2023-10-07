import 'package:flutter/material.dart';
import 'package:personal_finance_advisor/src/core/utils/theme/colors.dart';
import 'package:personal_finance_advisor/src/core/utils/theme/text_styles.dart';
import 'package:personal_finance_advisor/src/features/payments/screens/premium_card.dart';
import 'package:personal_finance_advisor/src/features/settings/screens/settings_screen.dart';

class UpgradePremium extends StatelessWidget {
  const UpgradePremium({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        titleSpacing: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const SettingsScreen(),
              ),
            );
          },
        ),
        backgroundColor: Colors.transparent,
        title: Text(
          "Upgrade to Premium",
          style: AppTextStyles.textMdBold
              .copyWith(color: AppColors.baseBlack, fontSize: 22),
        ),
      ),
      body: Center(
        child: PremiumCard(),
      ),
    );
  }
}
