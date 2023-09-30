import 'package:personal_finance_advisor/src/core/constants/dimensions.dart';
import 'package:flutter/material.dart';

class HompageButtons extends StatelessWidget {
  final String buttonTitle;
  final Color borderColor;
  final Color buttonColor;
  final Color buttonTitleColor;

  HompageButtons({
    this.borderColor = const Color(0xFF),
    this.buttonTitle = '',
    this.buttonColor = const Color(0xFF),
    this.buttonTitleColor = const Color(0xFF),
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: Dimensions.medium,
      left: Dimensions.medium,
      right: Dimensions.medium,
      child: Column(
        children: [
          GestureDetector(
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: buttonColor,
                border: Border.all(
                  color: borderColor,
                  width: 1.0,
                ),
                // Change the color to your desired background color
                borderRadius: BorderRadius.circular(
                    20.0), // Adjust the radius for curved edges
              ),
              child: Center(
                child: Text(
                  buttonTitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: buttonTitleColor,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
