import 'package:flutter/material.dart';

class CustomCloseText extends StatelessWidget {
  final String? contentx;
  const CustomCloseText({super.key, this.contentx});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
  TextSpan(
    children: [
      WidgetSpan(
        child: Icon(Icons.close, color: Colors.black), // red x icon
      ),
      TextSpan(
        text: contentx,
        style: TextStyle(
          fontSize: 8,
          color: Colors.black,
        ),
      ),
    ],
  ),
)
;
  }
}
