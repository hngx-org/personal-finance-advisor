import 'package:personal_finance_advisor/src/core/utils/theme/theme_helper.dart';
import 'package:flutter/material.dart';

class AppDecoration {
  // Fill decorations
  static BoxDecoration get fillGray => BoxDecoration(
        color: appTheme.gray100,
      );
  static BoxDecoration get fillWhiteA => BoxDecoration(
        color: appTheme.whiteA700,
        borderRadius: BorderRadiusStyle.circleBorder12,
      );
  static BoxDecoration get fillBlueGrey90001 => BoxDecoration(
        shape: BoxShape.circle,
        color: appTheme.blueGray90001,
      );
  static BoxDecoration get fillGrey300 => BoxDecoration(
        color: appTheme.gray300,
        borderRadius: BorderRadiusStyle.circleBorder35,
      );
  static BoxDecoration get fillGrey500 => BoxDecoration(
        color: appTheme.gray500,
      );

  // Outline decorations
  static BoxDecoration get outlineGray => BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: appTheme.gray200,
            width: 1,
          ),
        ),
      );
  static BoxDecoration get outlinePrimary400 => BoxDecoration(
        border: Border.all(
          color: appTheme.primary400,
        ),
        borderRadius: BorderRadiusStyle.circleBorder45,
      );
}

class BorderRadiusStyle {
  static BorderRadius get circleBorder18 => BorderRadius.circular(
        18,
      );
  static BorderRadius get circleBorder12 => BorderRadius.circular(
        12,
      );
  static BorderRadius get circleBorder35 => BorderRadius.circular(
        35,
      );
  static BorderRadius get circleBorder45 => BorderRadius.circular(
        45,
      );
}

double get strokeAlignInside => BorderSide.strokeAlignInside;

double get strokeAlignCenter => BorderSide.strokeAlignCenter;

double get strokeAlignOutside => BorderSide.strokeAlignOutside;
