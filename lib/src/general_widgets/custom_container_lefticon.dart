import 'package:flutter/material.dart';
import 'package:personal_finance_advisor/src/core/constants/dimensions.dart';
import 'package:personal_finance_advisor/src/core/utils/theme/colors.dart';
import 'package:personal_finance_advisor/src/core/utils/theme/text_styles.dart';
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
  final String? labelField;

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
    this.labelField,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            labelField ?? "Nothing",
            style: AppTextStyles.textMdMedium.copyWith(
              color: AppColors.baseWhite,
            ),
          ),
        ),
        const Spacing.smallHeight(),
        Container(
          height: containerHeight ?? MediaQuery.of(context).size.height * 0.08,
          width: containerWidth ?? MediaQuery.of(context).size.width * 0.9,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.7),
            border: Border.all(color: AppColors.gray500),
            borderRadius: BorderRadius.circular(50),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: Dimensions.medium),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(icon,
                    color: AppColors
                        .baseBlack), 
                const Spacing.smallWidth(),
                Expanded(
                  child: TextFormField(
                    controller: controller,
                    decoration: InputDecoration(
                      border: InputBorder
                          .none, 
                      focusedBorder: InputBorder.none,
                      hintText: field,
                      hintStyle: AppTextStyles.textMdMedium.copyWith(
                        color: AppColors.baseBlack,
                      ), // remove the border when focused
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
