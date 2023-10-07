import 'package:flutter/material.dart';

class DottedLineWText extends StatelessWidget {
  const DottedLineWText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SizedBox(
        width: double.infinity,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '------------------',
              style: TextStyle(
                color: Colors.white.withOpacity(0.4),
              ),
            ),
            // const Spacing.tinyWidth(),
            const Text(
              ' Or ',
              style: TextStyle(
                // fontFamily: 'Roboto',
                fontSize: 14,
                color: Colors.white,
              ),
            ),
            // const Spacing.tinyWidth(),
            Text(
              '------------------',
              style: TextStyle(
                color: Colors.white.withOpacity(0.4),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
