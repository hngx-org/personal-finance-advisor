import 'dart:developer';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal_finance_advisor/src/core/helper_fxn.dart';
import 'package:personal_finance_advisor/src/core/utils/app_enums.dart';
import 'package:personal_finance_advisor/src/features/auth/screens/sign_up_screen.dart';
import 'package:personal_finance_advisor/src/features/chat/notifiers/chat_state.dart';
import 'package:hngx_openai/repository/openai_repository.dart';
import 'package:flutter/material.dart';
import 'package:personal_finance_advisor/src/features/chat/page/chat_screens.dart';
import 'package:personal_finance_advisor/src/features/payments/screens/payment_options.dart';
import 'package:personal_finance_advisor/src/features/settings/screens/upgrade_premium.dart';
import '../../auth/screens/log_in_screen.dart';

class ChatNotifier extends StateNotifier<ChatState> {
  ChatNotifier() : super(ChatState.initialState());

  final String cookie =
      LoginScreen.cookies == '' ? SignUpScreen.cookies : LoginScreen.cookies;

  OpenAIRepository openAI = OpenAIRepository();

  Future<void> sendChat(String userInput, context) async {
    log('cookies used $cookie');
    state =
        state.copyWith(chatState: LoadState.loading, errorMessage: 'loading');

    try {
      final response = await openAI.getChat(userInput, cookie);
      log('Data Resp for CHAT: $response');
      state = state.copyWith(errorMessage: response, chatState: LoadState.done);
      if (response.toString() == 'Error: Subscription Required') {
        errorToastMessage(response);
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => UpgradePremium(),
          ),
        );
      }
      if (response.toString().startsWith('Error')) {
        errorToastMessage(response);
      }
    } catch (e) {
      state = state.copyWith(
        chatState: LoadState.error,
        errorMessage: e.toString(),
      );
      errorToastMessage('$e');
      rethrow;
    }
  }

  Future<void> chatHistory(String userInput, context) async {
    log('cookies used $cookie');
    state = state.copyWith(loadState: LoadState.loading);
    try {
      final response = await openAI.getChatCompletions(
          state.history ?? [], userInput, cookie);

      log('Data Resp for HISTORY: $response');
      print('Data Resp for HISTORY: $response');
      state = state.copyWith(errorMessage: response, loadState: LoadState.done);
      if (response.toString() == 'Error: Subscription Required') {
        errorToastMessage(response);
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const UpgradePremium(       
            ),
          ),
        );
      }
      if (response.toString().startsWith('Error')) {
        errorToastMessage(response);
      }
    } catch (e) {
      state = state.copyWith(
        loadState: LoadState.error,
        errorMessage: e.toString(),
      );
      errorToastMessage('$e');
      rethrow;
    }
  }

  void updateHistory(String input) {
    state = state.copyWith(history: [
      ...state.history ?? [],
      input,
    ]);
  }
}

final chatProvider = StateNotifierProvider<ChatNotifier, ChatState>(
  (_) => ChatNotifier(),
);
