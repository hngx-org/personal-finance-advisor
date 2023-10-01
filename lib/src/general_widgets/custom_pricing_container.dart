import 'package:flutter/material.dart';
import 'package:personal_finance_advisor/src/core/constants/dimensions.dart';
import 'package:personal_finance_advisor/src/general_widgets/custom_elevated_button.dart';
import 'package:personal_finance_advisor/src/general_widgets/custom_text_with_close.dart';
import 'package:personal_finance_advisor/src/general_widgets/custom_text_with_tick.dart';
import 'package:personal_finance_advisor/src/general_widgets/spacing.dart';

class CustomPricingContainer extends StatelessWidget {
  final List<String>? xcontent;
  final List<String>? kcontent;
  final String action;
  final VoidCallback? onTap;

  const CustomPricingContainer(
      {super.key,
      this.kcontent,
      this.xcontent,
      required this.action,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.7,
      width: MediaQuery.sizeOf(context).width * 0.48,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.blue),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment
            .center, // center the custom text widgets vertically
        crossAxisAlignment: CrossAxisAlignment
            .start, // align the custom text widgets to the start horizontally
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemCount: kcontent!.length,
            itemBuilder: (context, index) {
              return CustomTickText(
                content: kcontent![index],
              );
            },
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: xcontent?.length ?? 0,
            itemBuilder: (context, index) {
              return CustomCloseText(
                contentx: xcontent![index],
                
              );
            },
          ),
          Spacing.mediumHeight(),
          Align(
            alignment: AlignmentDirectional.bottomCenter,
            child: CustomElevatedButton(
              text: action,
              onTap: onTap,
              width: MediaQuery.sizeOf(context).width * 0.38,
              buttonStyle: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
