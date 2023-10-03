import 'package:flutter/material.dart';
import 'package:personal_finance_advisor/src/general_widgets/spacing.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onPressed;
  final String buttonText;
  final Color backgroundColor;
  final Color shadowColor;
  final Widget? textIcon;

  const CustomButton({
    super.key,
    this.onPressed,
    required this.buttonText,
    required this.backgroundColor,
    required this.shadowColor,
    this.textIcon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 50,
        ),
        width: double.infinity,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(50),
          boxShadow: [
            BoxShadow(
              color: shadowColor,
              blurRadius: 20,
              blurStyle: BlurStyle.outer,
              spreadRadius: 0,
              offset: const Offset(2.5, 2.5),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              buttonText,
              style: const TextStyle(
                fontFamily: 'Roboto',
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            if (textIcon != null) const Spacing.tinyWidth(),
            if (textIcon != null) textIcon!,
          ],
        ),
      ),
    );
  }
}
