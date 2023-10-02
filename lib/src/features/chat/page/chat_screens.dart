import 'package:flutter/material.dart';
import 'package:personal_finance_advisor/src/core/constants/dimensions.dart';
import 'package:personal_finance_advisor/src/core/utils/theme/colors.dart';
import 'package:personal_finance_advisor/src/general_widgets/custom_image_view.dart';
import 'package:personal_finance_advisor/src/general_widgets/general_widgets_exports.dart';
import 'package:personal_finance_advisor/src/general_widgets/spacing.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: Dimensions.tiny,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Personal Finance Advisor',
              style: TextStyle(
                  color: AppColors.primaryMainColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w700),
            ),
            Text(
              '. Online',
              style: TextStyle(
                  color: Color(0XFF3ABF38),
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const Spacing.mediumHeight(),
            CustomImageView(
              height: 24,
              width: 24,
              imagePath: 'assets/images/explain.png',
            ),
            const Center(
                child: Text(
              'Explain',
              style: TextStyle(
                  color: Color(0XFF3F3F3F),
                  fontWeight: FontWeight.w700,
                  fontSize: 14),
            )),
            const Spacing.mediumHeight(),
            const DummyQuestionCont(
                text: 'What is the difference between stocks and bonds?'),
            const DummyQuestionCont(
                text: 'Explain the concept of compound interest.'),
            const Spacing.bigHeight(),
            CustomImageView(
              height: 24,
              width: 24,
              svgPath: 'assets/images/edit.svg',
            ),
            const Center(
                child: Text(
              'Write & edit',
              style: TextStyle(
                  color: Color(0XFF3F3F3F),
                  fontWeight: FontWeight.w700,
                  fontSize: 14),
            )),
            const Spacing.mediumHeight(),
            const DummyQuestionCont(
                text: 'What are the key principles of financial planning?'),
            const DummyQuestionCont(text: '"How does credit scoring work?'),
            const Spacing.bigHeight(),
            CustomImageView(
              height: 24,
              width: 24,
              svgPath: 'assets/images/translate.svg',
            ),
            const Center(
                child: Text(
              'Translate',
              style: TextStyle(
                  color: Color(0XFF3F3F3F),
                  fontWeight: FontWeight.w700,
                  fontSize: 14),
            )),
            const Spacing.mediumHeight(),
            const DummyQuestionCont(
                text: 'What is the role of a financial advisor?'),
            const DummyQuestionCont(
                text: 'Discuss the pros and cons of investing in real estate'),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 100,
        width: double.infinity,
        color: const Color(0XFF3F3F3F).withOpacity(0.3),
        alignment: Alignment.center,
        padding: const EdgeInsets.all(Dimensions.medium),
        margin: MediaQuery.of(context).viewInsets,
        child: AppTextField(
          hintText: 'Let me give you financial advice',
          borderRadius: 30,
          suffixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomImageView(
                  height: 24,
                  width: 24,
                  svgPath: 'assets/images/microphone.svg',
                ),
                const Spacing.smallWidth(),
                CustomImageView(
                  height: 24,
                  width: 24,
                  svgPath: 'assets/images/send.svg',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DummyQuestionCont extends StatelessWidget {
  const DummyQuestionCont({
    required this.text,
    super.key,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: double.infinity,
      padding: const EdgeInsets.all(4),
      margin: const EdgeInsets.symmetric(
          horizontal: Dimensions.medium, vertical: Dimensions.small),
      decoration: BoxDecoration(
          color: const Color(0XFF3F3F3F).withOpacity(0.1),
          borderRadius: BorderRadius.circular(30)),
      child: Center(
          child: Text(
        text,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          color: Color(0XFF3F3F3F),
        ),
      )),
    );
  }
}
