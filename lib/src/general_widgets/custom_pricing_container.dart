import 'package:flutter/material.dart';
import 'package:personal_finance_advisor/src/core/constants/dimensions.dart';
import 'package:personal_finance_advisor/src/core/utils/theme/colors.dart';
import 'package:personal_finance_advisor/src/core/utils/theme/theme_helper.dart';
import 'package:personal_finance_advisor/src/general_widgets/custom_elevated_button.dart';
import 'package:personal_finance_advisor/src/general_widgets/custom_text_with_close.dart';
import 'package:personal_finance_advisor/src/general_widgets/custom_text_with_tick.dart';
import 'package:personal_finance_advisor/src/general_widgets/spacing.dart';

class CustomPricingContainer extends StatelessWidget {
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

  const CustomPricingContainer(
      {super.key,
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
      this.iconxbgcolor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.7,
      width: MediaQuery.sizeOf(context).width * 0.46,
      decoration: BoxDecoration(
        color: containercolor ?? Colors.white,
        border: Border.all(color: Colors.deepPurple, width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment
            .center, // center the custom text widgets vertically
        crossAxisAlignment: CrossAxisAlignment
            .start, // align the custom text widgets to the start horizontally
        children: [
          Container(
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.18,
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Color(0xFFF1F1F1),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Text(
                    plan!,
                    style: TextStyle(
                      color: AppColors.baseBlack,
                      fontSize: Dimensions.smedium,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(Dimensions.small),
                  child: Text(plantext ?? " Nothing",
                      style: TextStyle(
                        color: AppColors.baseBlack,
                        fontSize: Dimensions.smedium,
                        fontWeight: FontWeight.bold,
                      )),
                ),
                Divider(
                  color: Color(0xFF001C80),
                  thickness: 2.0,
                  endIndent: Checkbox.width,
                  indent: Checkbox.width,
                ),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: planprice,
                        style: TextStyle(
                          color: AppColors.baseBlack,
                          fontSize: Dimensions.large,
                          fontWeight: FontWeight.bold,),
                      ),
                      TextSpan(
                        text: '\n$pricetext',
                        style: TextStyle(
                            color: AppColors.baseBlack, fontSize: Dimensions.smedium),
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: Color(0xFF001C80),
                  thickness: 0.4,
                  endIndent: Checkbox.width,
                  indent: Checkbox.width,
                ),
              ],
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: kcontent!.length,
            itemBuilder: (context, index) {
              return CustomTickText(
                iconkbgcolor: iconkbgcolor ?? AppColors.baseBlack,
                iconkcolor: iconkcolor ?? AppColors.baseWhite,
                content: kcontent![index],
              );
            },
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: xcontent?.length ?? 0,
            itemBuilder: (context, index) {
              return CustomCloseText(
                iconxbgcolor: iconxbgcolor ?? AppColors.baseBlack,
                iconxcolor: iconxcolor ?? AppColors.baseWhite,
                contentx: xcontent![index],
              );
            },
          ),
          Spacing.mediumHeight(),
          Align(
            alignment: AlignmentDirectional.bottomCenter,
            child: CustomElevatedButton(
              text: buttontext,
              buttonTextStyle: TextStyle(
                color: buttontextcolor ?? AppColors.baseWhite,
                fontSize: Dimensions.small,
                fontWeight: FontWeight.w600,
              ),
              onTap: onTap,
              width: MediaQuery.sizeOf(context).width * 0.35,
              buttonStyle: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    buttonColor ?? AppColors.baseBlack),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
