import 'package:flutter/material.dart';
import 'package:personal_finance_advisor/src/core/constants/dimensions.dart';

class DummyQuestionCont extends StatelessWidget {
  const DummyQuestionCont({
    this.text = 'Prompt Appears Here',
    this.isResp = false,
    super.key,
  });
  final String text;
  final bool? isResp;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 40,
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(
          horizontal: Dimensions.medium, vertical: Dimensions.small),
      decoration: BoxDecoration(
          color: isResp ?? false
              ? Colors.blue.shade50
              // AppColors.primaryMainColor.withOpacity(0.3)
              : const Color(0XFF3F3F3F).withOpacity(0.1),
          borderRadius: BorderRadius.circular(30)),
      child: Center(
          child: Text(
        text,
        overflow: TextOverflow.clip,
        textAlign: TextAlign.left,
        style: const TextStyle(
          color: Color(0XFF3F3F3F),
        ),
      )),
    );
  }
}
