import 'package:flutter/material.dart';
import 'package:personal_finance_advisor/src/core/constants/dimensions.dart';
import 'package:personal_finance_advisor/src/core/utils/theme/colors.dart';
import 'package:personal_finance_advisor/src/core/utils/theme/text_styles.dart';

class CustomSmallTextField extends StatelessWidget {
  final int? maxLines;
  final int? maxLength;
  final String? hintField;
  final String? labelSmallField;
  const CustomSmallTextField(
      {super.key,
      this.maxLines,
      this.maxLength,
      this.hintField,
      this.labelSmallField});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          labelSmallField ?? "Nothing",
          style: AppTextStyles.textMdMedium.copyWith(
            color: AppColors.baseWhite,
          ),
        ),
        TextFormField(
          style: TextStyle(fontSize: 20.0, height: 2.0),
          maxLength: maxLength,
          maxLines: maxLines,
          decoration: InputDecoration(
            constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 0.08,
                maxWidth: MediaQuery.of(context).size.width * 0.35),
            hintText: hintField,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: const BorderSide(
                color: Colors.black,
              ),
            ),
            contentPadding: const EdgeInsets.symmetric(
                horizontal: Dimensions.smedium, vertical: Dimensions.medium),
            fillColor: Colors.white.withOpacity(0.7),
            filled: true,
          ),
        ),
      ],
    );
  }
}
