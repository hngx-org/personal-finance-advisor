import 'package:personal_finance_advisor/src/core/constants/dimensions.dart';
import 'package:personal_finance_advisor/src/core/utils/theme/colors.dart';
import 'package:personal_finance_advisor/src/core/utils/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:personal_finance_advisor/src/general_widgets/custom_image_view.dart';

class CustomContainerTextField extends StatelessWidget {
  final double? boxheight;
  final String? item;
  final double? boxwidth;
  final int? lines;

  const CustomContainerTextField({
    super.key,
    this.boxheight,
    this.item,
    this.boxwidth,
    this.lines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: lines,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.gray500,
          ),
          borderRadius: BorderRadius.circular(
            Dimensions.small,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(
            horizontal: Dimensions.smedium, vertical: Dimensions.medium),
        hintText: item,
        hintStyle: AppTextStyles.textSmallRegular.copyWith(
          color: AppColors.gray700Main,
        ),
        fillColor: AppColors.baseWhite,
        filled: true,
      ),
    );
  }
}
