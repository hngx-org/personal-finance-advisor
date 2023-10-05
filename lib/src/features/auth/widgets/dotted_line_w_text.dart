import 'package:flutter/material.dart';
import 'package:personal_finance_advisor/src/general_widgets/spacing.dart';

class DottedLineWText extends StatelessWidget {
  const DottedLineWText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: Text(
            '-------------------',
            style: TextStyle(
              color: Colors.white.withOpacity(0.4),
            ),
          ),
        ),
        // const Spacing.tinyWidth(),
        const Text(
          'Or ',
          style: TextStyle(
            // fontFamily: 'Roboto',
            fontSize: 14,
            color: Colors.white,
          ),
        ),
        // const Spacing.tinyWidth(),
        Expanded(
          child: Text(
            '-------------------',
            style: TextStyle(
              color: Colors.white.withOpacity(0.4),
            ),
          ),
        ),
      ],
    );
  }
}

class CustomDashedLine extends StatelessWidget {
  const CustomDashedLine({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double dashWidth = 5.0;
    double dashSpace = 5.0;
    int numberOfDashes = (screenWidth / (dashWidth + dashSpace)).floor();

    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomPaint(
            size: Size(screenWidth / 3, 1),
            painter: DashedLinePainter(
              dashWidth: dashWidth,
              dashSpace: dashSpace,
              numberOfDashes: numberOfDashes ~/ 2,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
                horizontal: 8), // Adjust the padding as needed

            color: Colors.transparent, // Adjust the background color as needed
            child: const Text(
              "Or",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          CustomPaint(
            size: Size(screenWidth / 3, 1),
            painter: DashedLinePainter(
              dashWidth: dashWidth,
              dashSpace: dashSpace,
              numberOfDashes: numberOfDashes ~/ 2,
            ),
          ),
        ],
      ),
    );
  }
}

class DashedLinePainter extends CustomPainter {
  final double dashWidth;
  final double dashSpace;
  final int numberOfDashes;

  DashedLinePainter({
    required this.dashWidth,
    required this.dashSpace,
    required this.numberOfDashes,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.white.withOpacity(0.4) // Change the color as needed
      ..strokeWidth = 1;

    double startX = 0;
    double endX = dashWidth;

    for (int i = 0; i < numberOfDashes; i++) {
      canvas.drawLine(Offset(startX, 0), Offset(endX, 0), paint);
      startX += dashWidth + dashSpace;
      endX = startX + dashWidth;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
