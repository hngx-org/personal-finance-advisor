import 'package:flutter/material.dart';

class CustomTickText extends StatelessWidget {
  final String? content;
  const CustomTickText({super.key, this.content});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          WidgetSpan(
            child: Icon(Icons.check, color: Colors.black // green tick icon
                ),
          ),
          TextSpan(
            text: content,
            style: TextStyle(
              color: Colors.black,
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }
}
