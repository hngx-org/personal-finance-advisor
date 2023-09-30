import 'package:flutter/material.dart';

import '../core/constants/dimensions.dart';
import 'custom_image_view.dart';

class CustomIconContainer extends StatelessWidget {
  final String containerText;
  final TextStyle? containerTextStyle;
  final double spacingWidth;
  final String iconSvgPath;
  final Color containerColor;
  final double containerHPadding;
  final double containerVPadding;
  final Color iconColor;
  final double iconHeight;
  final double iconWidth;
  final VoidCallback? onTap;
  final double? containerHeight;
  final double? containerWidth;

  /// A custom container that contains an icon and a text with an optional
  /// spacing between them, and an optional onTap callback.
  /// Example usage:
  /// ```dart
  ///  CustomIconContainer(
  ///    containerText: '14 Events',
  ///    containerTextStyle: AppTextStyles.textXsMeduim.copyWith(
  ///      color: AppColors.primary1000,
  ///    ),
  ///    containerColor: AppColors.accentGreen100,
  ///    containerHPadding: Dimensions.smedium,
  ///    containerVPadding: Dimensions.xsmall,
  ///    iconSvgPath: ImageConstant.imgCalendar,
  ///    iconColor: AppColors.primary1000,
  ///    iconHeight: 16,
  ///    iconWidth: 16,
  ///    spacingWidth: Dimensions.tiny,
  ///    onTap: () {},
  /// ),
  /// ```

  const CustomIconContainer({
    super.key,
    required this.containerText,
    this.containerTextStyle,
    required this.spacingWidth,
    required this.containerColor,
    required this.containerHPadding,
    required this.containerVPadding,
    required this.iconSvgPath,
    required this.iconColor,
    required this.iconHeight,
    required this.iconWidth,
    this.onTap,
    this.containerHeight,
    this.containerWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: containerHeight,
      width: containerWidth,
      padding: EdgeInsets.symmetric(
        horizontal: containerHPadding,
        vertical: containerVPadding,
      ),
      decoration: BoxDecoration(
        color: containerColor,
        borderRadius: BorderRadius.circular(Dimensions.medium),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomImageView(
            svgPath: iconSvgPath,
            color: iconColor,
            height: iconHeight,
            width: iconWidth,
          ),
          SizedBox(width: spacingWidth),
          Text(
            containerText,
            style: containerTextStyle,
          ),
        ],
      ),
    );
  }
}
