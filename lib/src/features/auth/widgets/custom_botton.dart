import 'package:flutter/material.dart';
import 'package:personal_finance_advisor/src/general_widgets/spacing.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onPressed;
  final Widget buttonContent;
  final Color backgroundColor;
  final Color shadowColor;

  const CustomButton({
    super.key,
    this.onPressed,
    required this.buttonContent,
    required this.backgroundColor,
    required this.shadowColor,
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
            buttonContent,
          ],
        ),
      ),
    );
  }
}
