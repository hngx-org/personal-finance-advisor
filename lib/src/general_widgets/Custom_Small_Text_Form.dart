import 'package:flutter/material.dart';
import 'package:personal_finance_advisor/src/core/constants/dimensions.dart';
import 'package:personal_finance_advisor/src/core/utils/theme/colors.dart';

class CustomSmallTextField extends StatelessWidget {
  final int? maxLines;
  final int? maxLength;
  final String? hintField;
  const CustomSmallTextField(
      {super.key, this.maxLines, this.maxLength, this.hintField});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(fontSize: 20.0, height: 2.0),
      maxLength: maxLength,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hintField,
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.black,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(
            horizontal: Dimensions.smedium, vertical: Dimensions.medium),
        fillColor: AppColors.baseWhite,
        filled: true,
      ),
    );
  }
}
