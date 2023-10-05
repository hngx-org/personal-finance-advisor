import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal_finance_advisor/src/core/helper_fxn.dart';
import 'package:personal_finance_advisor/src/features/auth/screens/sign_up_screen.dart';
import 'package:personal_finance_advisor/src/features/chat/notifiers/chat_state.dart';
import 'package:hngx_openai/repository/openai_repository.dart';

import '../../auth/screens/log_in_screen.dart';

class ChatNotifier extends StateNotifier<ChatState> {
  ChatNotifier() : super(ChatState.initialState());

  final String cookie =
      LoginScreen.cookies == '' ? SignUpScreen.cookies : LoginScreen.cookies;

  OpenAIRepository openAI = OpenAIRepository();

  Future<void> sendChat(
    String userInput,
  ) async {
    state = state.copyWith(loadState: LoadState.loading);

    try {
      final response = await openAI.getChat(userInput, cookie);
      log('Data Resp for char: ${response}');
      state = state.copyWith(errorMessage: response, loadState: LoadState.done);
      if (response.toString() == 'Error: Subscription Required') {
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

  Future<void> chatHistory(
    String userInput,
  ) async {
    state = state.copyWith(loadState: LoadState.loading);
    try {
      final response = await openAI.getChatCompletions(
          state.history ?? [], userInput, cookie);

      log('Data Resp for history: ${response}');
      state = state.copyWith(errorMessage: response, loadState: LoadState.done);

      toastMessage('$response');
    } catch (e) {
      state = state.copyWith(
        loadState: LoadState.error,
        errorMessage: e.toString(),
      );
      errorToastMessage('$e');
      rethrow;
    }
  }
}

final chatProvider = StateNotifierProvider<ChatNotifier, ChatState>(
  (_) => ChatNotifier(),
);
