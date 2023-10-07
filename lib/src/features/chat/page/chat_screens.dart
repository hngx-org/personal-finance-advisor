import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal_finance_advisor/src/core/constants/dimensions.dart';
import 'package:personal_finance_advisor/src/core/utils/app_enums.dart';
import 'package:personal_finance_advisor/src/core/utils/theme/colors.dart';
import 'package:personal_finance_advisor/src/features/chat/page/widgets/dummy_question.dart';
import 'package:personal_finance_advisor/src/features/settings/screens/settings_screen.dart';
import 'package:personal_finance_advisor/src/general_widgets/custom_image_view.dart';
import 'package:personal_finance_advisor/src/general_widgets/general_widgets_exports.dart';
import 'package:personal_finance_advisor/src/general_widgets/spacing.dart';

import '../notifiers/chat_notifiers.dart';

class ChatScreen extends ConsumerStatefulWidget {
  const ChatScreen({super.key});

  @override
  ConsumerState<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends ConsumerState<ChatScreen> {
  final _chatCont = TextEditingController();

  @override
  void initState() {
    super.initState();

    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
    //   await ref
    //       .read(chatProvider.notifier)
    //       .chatHistory('Personal Finance Advisor');
    // });
  }

  String question = '';

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(chatProvider);
    final notifer = ref.watch(chatProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 24,
        elevation: Dimensions.tiny,
        automaticallyImplyLeading: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Personal Finance Advisor',
              style: TextStyle(
                  color: AppColors.primaryMainColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w700),
            ),
            Text(
              '• Online',
              style: TextStyle(
                  color: const Color(0XFF3ABF38).withOpacity(0.8),
                  fontSize: 12,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
        actions: [
          PopupMenuButton(
            color: Colors.blue.shade300,
            surfaceTintColor: Colors.transparent,
            itemBuilder: (context) {
              return [
                PopupMenuItem<int>(
                  value: 0,
                  child: const Text(
                    'Settings',
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const SettingsScreen(),
                      ),
                    );
                  },
                ),
              ];
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: _chatCont.text.isNotEmpty || state.errorMessage != ''
              ? [
                  const Spacing.mediumHeight(),
                               DummyQuestionCont(
                    text: question,
                  ),
                  state.errorMessage == 'loading'
                      ? const Center(
                          child: CupertinoActivityIndicator(
                            color: AppColors.primaryMainColor,
                          ),
                        )
                      : DummyQuestionCont(
                          text: state.errorMessage, isResp: true),
                  const Spacing.largeHeight(),
                  Text(
                    'History',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                  const Spacing.smallHeight(),
                  (state.history ?? []).isEmpty
                      ? const Text('')
                      : ListView.builder(
                          shrinkWrap: true,
                          itemCount: (state.history ?? []).length,
                          itemBuilder: (context, index) {
                            final text = (state.history ?? [])[index];
                            return DummyQuestionCont(
                              text: text,
                            );
                          }),
                  const Spacing.smallHeight(),
                ]
              : [
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
                      text:
                          'What are the key principles of financial planning?'),
                  const DummyQuestionCont(
                      text: '"How does credit scoring work?'),
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
                      text:
                          'Discuss the pros and cons of investing in real estate'),
                  const Spacing.smallHeight(),
                  state.chatState == LoadState.loading
                      ? const Center(
                          child: CupertinoActivityIndicator(
                            color: AppColors.primaryMainColor,
                          ),
                        )
                      : const SizedBox(),
                  const Spacing.smallHeight(),
                  (state.history ?? []).isEmpty
                      ? const Text('No History')
                      : ListView.builder(
                          shrinkWrap: true,
                          itemCount: (state.history ?? []).length,
                          itemBuilder: (context, index) {
                            final text = (state.history ?? [])[index];
                            return DummyQuestionCont(text: text, isResp: false);
                          }),
                ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 100,
        width: double.infinity,
        color: const Color(0XFF3F3F3F).withOpacity(0.09),
        alignment: Alignment.center,
        padding: const EdgeInsets.all(Dimensions.medium),
        margin: MediaQuery.of(context).viewInsets,
        child: AppTextField(
          controller: _chatCont,
          backgroundColor: Colors.blue.shade50,
          hintText: 'Let me give you financial advice',
          onFieldSubmitted: (p0) {
            setState(() {
              question = p0;
            });
            debugPrint('In Chat submitted');
            notifer.sendChat(p0, context);
            notifer.updateHistory(p0);
            _chatCont.clear();
          },
          borderRadius: 30,
          suffixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Spacing.smallWidth(),
                CustomImageView(
                  height: 24,
                  width: 24,
                  onTap: () {
                    setState(() {
                      question = _chatCont.text;
                    });
                    debugPrint('In Chat field');
                    notifer.sendChat(_chatCont.text, context);
                    notifer.updateHistory(_chatCont.text);
                    _chatCont.clear();
                  },
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
