import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:personal_finance_advisor/src/core/constants/dimensions.dart';
import 'package:personal_finance_advisor/src/core/utils/theme/colors.dart';
import 'package:personal_finance_advisor/src/general_widgets/custom_image_view.dart';
import 'package:personal_finance_advisor/src/general_widgets/spacing.dart';

class CustomContainerLeftIcon extends StatelessWidget {
  final String? displaydata;
  final VoidCallback? onPressed;
  final String? iconSvgPath;
  final Color? iconColor;
  final double? containerHeight;
  final double? containerWidth;
  final TextEditingController? controller;
  final IconData? icon;
  final String? field;

  const CustomContainerLeftIcon({
    super.key,
    this.displaydata,
    this.onPressed,
    this.iconSvgPath,
    this.iconColor,
    this.containerHeight,
    this.containerWidth,
    this.controller,
    this.icon,
    this.field,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: containerHeight ?? MediaQuery.of(context).size.height * 0.08,
        width: containerWidth ?? MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
          color: AppColors.baseWhite,
          border: Border.all(color: AppColors.gray500),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Dimensions.medium),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(icon,
                  color: AppColors
                      .baseBlack), // TODO: Replace with custom image view (for svg
              const Spacing.smallWidth(),
              Expanded(
                child: TextFormField(
                  controller: controller,
                  decoration: InputDecoration(
                    border:
                        InputBorder.none, // remove the border when not focused
                    focusedBorder:
                        InputBorder.none, 
                        hintText: field ,// remove the border when focused
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
