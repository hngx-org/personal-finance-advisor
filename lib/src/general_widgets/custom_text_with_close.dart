import 'package:flutter/material.dart';
import 'package:personal_finance_advisor/src/core/constants/dimensions.dart';

class CustomCloseText extends StatelessWidget {
  final String? contentx;
  final Color? iconxcolor;
  final Color? iconxbgcolor;

  const CustomCloseText(
      {super.key, this.contentx, this.iconxcolor, this.iconxbgcolor});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(
              Dimensions.medium), // change this to your desired border radius
          child: Container(
            color: iconxbgcolor, // change this to your desired background color
            child: Icon(
              Icons.close,
              color: iconxcolor,
              size: Dimensions.medium,
            ), // change this to your desired icon and color
          ),
        ),
        const SizedBox(width: 10),
        Text(
          contentx!,
          style: const TextStyle(
            color: Colors.black,
            fontSize: Dimensions.medium,
          ),
        ),
      ],
    );
  }
}
