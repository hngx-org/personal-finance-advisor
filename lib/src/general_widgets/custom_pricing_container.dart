import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:in_app_payment/buttons/pay_buttons.dart';
import 'package:personal_finance_advisor/src/core/constants/dimensions.dart';
import 'package:personal_finance_advisor/src/core/utils/theme/colors.dart';
import 'package:personal_finance_advisor/src/core/utils/theme/text_styles.dart';
import 'package:personal_finance_advisor/src/features/auth/providers/user_provider.dart';
import 'package:personal_finance_advisor/src/general_widgets/custom_elevated_button.dart';
import 'package:personal_finance_advisor/src/general_widgets/custom_text_with_close.dart';
import 'package:personal_finance_advisor/src/general_widgets/custom_text_with_tick.dart';
import 'package:personal_finance_advisor/src/general_widgets/spacing.dart';

class CustomPricingContainer extends ConsumerStatefulWidget {
  final List<String>? xcontent;
  final List<String>? kcontent;
  final String buttontext;
  final VoidCallback? onTap;
  final Color? containercolor;
  final Color? buttonColor;
  final Color? buttontextcolor;
  final String? plan;
  final String? plantext;
  final String? planprice;
  final String? pricetext;
  final Color? iconkcolor;
  final Color? iconkbgcolor;
  final Color? iconxcolor;
  final Color? iconxbgcolor;
  final double? buttontextsize;
  final bool optionalButton;

  const CustomPricingContainer({
    super.key,
    this.kcontent,
    this.xcontent,
    required this.buttontext,
    this.onTap,
    this.containercolor,
    this.buttonColor,
    this.buttontextcolor,
    this.plan,
    this.plantext,
    this.planprice,
    this.pricetext,
    this.iconkcolor,
    this.iconkbgcolor,
    this.iconxcolor,
    this.iconxbgcolor,
    this.buttontextsize,
    required this.optionalButton,
  });

  @override
  ConsumerState<CustomPricingContainer> createState() =>
      _CustomPricingContainerState();
}

class _CustomPricingContainerState
    extends ConsumerState<CustomPricingContainer> {
  final pay = HNGPay();

  @override
  Widget build(BuildContext context) {
    final userDetails = ref.watch(userProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 30,
        horizontal: 20,
      ),
      child: Container(
        height: double.maxFinite,
        width: MediaQuery.of(context).size.width * 0.7,
        decoration: BoxDecoration(
          color: widget.containercolor ?? Colors.white,
          border: Border.all(color: Colors.blueAccent, width: 2),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(Dimensions.medium),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacing.mediumHeight(),
              Container(
                width: MediaQuery.of(context).size.width * 0.35,
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: const Color(0xFFF1F1F1),
                  borderRadius: BorderRadius.circular(50.0),
                ),
                child: Center(
                  child: Text(
                    widget.plan!,
                    style: AppTextStyles.textMdMedium.copyWith(
                      color: AppColors.baseBlack,
                    ),
                  ),
                ),
              ),
              const Spacing.largeHeight(),
              Text(
                widget.plantext ?? " Nothing",
                style: AppTextStyles.textMdMedium.copyWith(
                  color: AppColors.baseBlack,
                ),
              ),
              const Spacing.mediumHeight(),
              const Divider(
                color: Color(0xFF001C80),
                thickness: 2.0,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: widget.planprice,
                        style: AppTextStyles.textMdBold.copyWith(
                          color: AppColors.baseBlack,
                          fontSize: Dimensions.large,
                        ),
                      ),
                      TextSpan(
                        text: '\n${widget.pricetext}',
                        style: AppTextStyles.textMdRegular.copyWith(
                          color: AppColors.baseBlack,
                          fontSize: Dimensions.medium,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Divider(
                color: Color(0xFF001C80),
                thickness: 0.7,
              ),
              const Spacing.smallHeight(),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount:
                      widget.kcontent!.length + (widget.xcontent?.length ?? 0),
                  itemBuilder: (context, index) {
                    if (index < widget.kcontent!.length) {
                      return CustomTickText(
                        iconkbgcolor:
                            widget.iconkbgcolor ?? AppColors.baseBlack,
                        iconkcolor: widget.iconkcolor ?? AppColors.baseWhite,
                        content: widget.kcontent![index],
                      );
                    } else {
                      return CustomCloseText(
                        iconxbgcolor:
                            widget.iconxbgcolor ?? AppColors.baseBlack,
                        iconxcolor: widget.iconxcolor ?? AppColors.baseWhite,
                        contentx:
                            widget.xcontent![index - widget.kcontent!.length],
                      );
                    }
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 12); // zero height separator
                  },
                ),
              ),
              const Spacer(),
              Align(
                alignment: AlignmentDirectional.bottomCenter,
                child: widget.optionalButton
                    ? CustomElevatedButton(
                        width: 200,
                        height: 48,
                        text: widget.buttontext,
                        buttonTextStyle: TextStyle(
                          color: widget.buttontextcolor ?? AppColors.baseWhite,
                          fontSize: widget.buttontextsize ?? Dimensions.medium,
                          // fontWeight: FontWeight.w600,
                        ),
                        onTap: widget.onTap,
                        buttonStyle: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              widget.buttonColor ?? AppColors.baseBlack),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                        ),
                      )
                    : Platform.isIOS
                        ? pay.applePay(context, amountToPay: "10", userID: '23')
                        : pay.googlePay(context,
                            amountToPay: "10", userID: userDetails['id']!),
              ),
              const Spacing.mediumHeight(),
            ],
          ),
        ),
      ),
    );
  }
}
