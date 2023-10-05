import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:personal_finance_advisor/src/features/chat/page/chat_screens.dart';
import 'package:personal_finance_advisor/src/general_widgets/custom_elevated_button.dart';
import 'package:personal_finance_advisor/src/general_widgets/custom_image_view.dart';
import 'package:personal_finance_advisor/src/general_widgets/spacing.dart';

class ChatIntroScreen extends StatelessWidget {
  const ChatIntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            const Text(
              'Your Ai Assistance',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 23),
            ),
            const Spacing.mediumHeight(),
            const Text(
              'Using this software,you can ask you questions and receive articles using artificial intelligence assistant',
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                  color: Color(0XFF757575)),
            ),
            const Spacing.largeHeight(),
            CustomImageView(
              imagePath: 'assets/images/ai_assitance.png',
            ),
            const Spacer(),
            CustomElevatedButton(
              //color: Colors.blue,
              buttonStyle: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.blue.shade200)),
              height: 56,
              text: 'Continue',
              rightIcon: const Icon(Icons.arrow_right_alt_outlined,

                  color: Colors.white),
              onTap: () => Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => const ChatScreen(),
                  )),

            ),
            const Spacing.largeHeight(),
          ],
        ),
      ),
    );
  }
}
