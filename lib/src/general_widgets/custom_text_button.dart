import 'package:personal_finance_advisor/src/core/constants/dimensions.dart';
import 'package:personal_finance_advisor/src/core/utils/theme/app_decoration.dart';
import 'package:personal_finance_advisor/src/core/utils/theme/custom_text_style.dart';
import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;
  const CustomTextButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 122,
        height: 34,
        padding: const EdgeInsets.symmetric(
          horizontal: Dimensions.medium,
          vertical: Dimensions.small,
        ),
        decoration: AppDecoration.outlinePrimary400,
        child: Center(
          child: Text(
            buttonText,
            style: CustomTextStyles.bodySmallPlusJarkataSansTextPrimary1000,
          ),
        ),
      ),
    );
  }
}
