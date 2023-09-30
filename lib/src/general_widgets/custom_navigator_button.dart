import 'package:personal_finance_advisor/src/core/constants/dimensions.dart';
import 'package:personal_finance_advisor/src/core/utils/theme/app_decoration.dart';
import 'package:flutter/material.dart';

class CustomNavigatorButton extends StatelessWidget {
  final Color iconColor;
  final VoidCallback onPressed;
  const CustomNavigatorButton({
    super.key,
    required this.iconColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.only(
          left: Dimensions.medium,
        ),
        child: Container(
          height: Dimensions.medium,
          width: Dimensions.medium,
          padding: const EdgeInsets.all(Dimensions.tiny),
          decoration: AppDecoration.fillBlueGrey90001,
          child: Center(
            child: Icon(
              Icons.arrow_back_rounded,
              size: Dimensions.biggerMedium,
              color: iconColor,
            ),
          ),
        ),
      ),
    );
  }
}
