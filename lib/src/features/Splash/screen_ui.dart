import 'package:flutter/material.dart';
import 'package:personal_finance_advisor/src/general_widgets/custom_image_view.dart';

class ScreenUI extends StatelessWidget {
  const ScreenUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 1.3,
      child: CustomImageView(
        imagePath: 'images/logo.png',
      ),
    );
  }
}
