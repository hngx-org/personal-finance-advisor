import 'package:flutter/material.dart';
import 'package:personal_finance_advisor/src/general_widgets/spacing.dart';

class DottedLineWText extends StatelessWidget {
  const DottedLineWText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          '-------------------',
          style: TextStyle(
            color: Colors.white.withOpacity(0.4),
          ),
        ),
        const Spacing.smallWidth(),
        const Text(
          'Or',
          style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 14,
            color: Colors.white,
          ),
        ),
        const Spacing.smallWidth(),
        Text(
          '-------------------',
          style: TextStyle(
            color: Colors.white.withOpacity(0.4),
          ),
        ),
      ],
    );
  }
}
