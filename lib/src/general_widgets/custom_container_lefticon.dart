import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:personal_finance_advisor/src/core/constants/dimensions.dart';
import 'package:personal_finance_advisor/src/core/utils/theme/colors.dart';
import 'package:personal_finance_advisor/src/general_widgets/custom_image_view.dart';
import 'package:personal_finance_advisor/src/general_widgets/spacing.dart';


class CustomContainerLeftIcon extends StatelessWidget {
  final String? displaydata;
  final VoidCallback? onPressed;
  final String iconSvgPath;
  final Color iconColor;
  final double containerHeight;
  final double containerWidth;
  final TextEditingController? controller;

  const CustomContainerLeftIcon({
    super.key,
    this.displaydata,
    this.onPressed,
    required this.iconSvgPath,
    required this.iconColor,
    required this.containerHeight,
    required this.containerWidth,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: containerHeight,
        width: containerWidth,
        decoration: BoxDecoration(
          color: AppColors.baseWhite,
          border: Border.all(color: AppColors.gray500),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding:EdgeInsets.symmetric(horizontal: Dimensions.medium),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              
              const Spacing.smallWidth(),
              TextFormField(),
            ],
          ),
        ),
      ),
    );
  }
}
