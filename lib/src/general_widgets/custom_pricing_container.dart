import 'package:flutter/material.dart';
import 'package:personal_finance_advisor/src/core/constants/dimensions.dart';
import 'package:personal_finance_advisor/src/core/utils/theme/colors.dart';
import 'package:personal_finance_advisor/src/core/utils/theme/text_styles.dart';
import 'package:personal_finance_advisor/src/core/utils/theme/theme_helper.dart';
import 'package:personal_finance_advisor/src/general_widgets/custom_elevated_button.dart';
import 'package:personal_finance_advisor/src/general_widgets/custom_text_with_close.dart';
import 'package:personal_finance_advisor/src/general_widgets/custom_text_with_tick.dart';
import 'package:personal_finance_advisor/src/general_widgets/spacing.dart';

class CustomPricingContainer extends StatefulWidget {
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
  State<CustomPricingContainer> createState() => _CustomPricingContainerState();
}

class _CustomPricingContainerState extends State<CustomPricingContainer> {
  bool _isLifted = false;

  void _toggleLift() {
    setState(() {
      _isLifted = !_isLifted;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleLift,
      child: AnimatedContainer(
        alignment: _isLifted ? Alignment.topCenter : Alignment.center,
        duration: const Duration(milliseconds: 1),
        child: Transform.translate(
          offset: _isLifted ? const Offset(5, 5) : const Offset(0, 0),
          child: Container(
            height: MediaQuery.sizeOf(context).height * 0.7,
            width: MediaQuery.sizeOf(context).width * 0.46,
            decoration: BoxDecoration(
              color: widget.containercolor ?? Colors.white,
              border: Border.all(color: Colors.blueAccent, width: 2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.25,
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: Color(0xFFF1F1F1),
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
                      Spacing.mediumHeight(),
                      Padding(
                        padding: const EdgeInsets.all(Dimensions.small),
                        child: Text(widget.plantext ?? " Nothing",
                            style: TextStyle(
                              color: AppColors.baseBlack,
                              fontSize: Dimensions.medium,
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                      Spacing.mediumHeight(),
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
                              text: widget.planprice,
                              style: TextStyle(
                                color: AppColors.baseBlack,
                                fontSize: Dimensions.large,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: '\n${widget.pricetext}',
                              style: TextStyle(
                                  color: AppColors.baseBlack,
                                  fontSize: Dimensions.smedium),
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
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemCount: widget.kcontent!.length +
                        (widget.xcontent?.length ??
                            0), // the total number of items
                    itemBuilder: (context, index) {
                      if (index < widget.kcontent!.length) {
                        // if the index is within the range of kcontent
                        return CustomTickText(
                          // return the custom tick text widget
                          iconkbgcolor:
                              widget.iconkbgcolor ?? AppColors.baseBlack,
                          iconkcolor: widget.iconkcolor ?? AppColors.baseWhite,
                          content: widget.kcontent![index],
                        );
                      } else {
                        // otherwise, the index is within the range of xcontent
                        return CustomCloseText(
                          // return the custom close text widget
                          iconxbgcolor:
                              widget.iconxbgcolor ?? AppColors.baseBlack,
                          iconxcolor: widget.iconxcolor ?? AppColors.baseWhite,
                          contentx: widget.xcontent![index -
                              widget.kcontent!
                                  .length], // adjust the index to match the xcontent list
                        );
                      }
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(height: 0.0); // zero height separator
                    },
                  ),
                ),
                Spacing.mediumHeight(),
                Align(
                  alignment: AlignmentDirectional.bottomCenter,
                  child: CustomElevatedButton(
                    width: MediaQuery.sizeOf(context).width * 0.4,
                    text: widget.buttontext,
                    buttonTextStyle: TextStyle(
                      color: widget.buttontextcolor ?? AppColors.baseWhite,
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                    ),
                    onTap: widget.onTap,
                    buttonStyle: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          widget.buttonColor ?? AppColors.baseBlack),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
