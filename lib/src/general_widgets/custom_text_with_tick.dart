import 'package:flutter/material.dart';
import 'package:personal_finance_advisor/src/core/constants/dimensions.dart';
import 'package:personal_finance_advisor/src/general_widgets/spacing.dart';

class CustomTickText extends StatelessWidget {
  final String? content;
  final Color? iconkcolor;
  final Color? iconkbgcolor;
  const CustomTickText({
    super.key,
    this.content,
    this.iconkbgcolor,
    this.iconkcolor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(
              Dimensions.medium), // change this to your desired border radius
          child: Container(
            color: iconkbgcolor, // change this to your desired background color
            child: Icon(
              Icons.check,
              color: iconkcolor,
              size: Dimensions.medium,
            ), // change this to your desired icon and color
          ),
        ),
        Spacing.tinyWidth(),
        SizedBox(
          width: 130,
          child: RichText(
            text: TextSpan(
              text: content,
              style: TextStyle(
                overflow: TextOverflow.ellipsis,
                color: Colors.black,
                fontSize: Dimensions.medium,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
