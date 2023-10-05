import 'package:flutter_riverpod/flutter_riverpod.dart';

final userProvider =
    StateNotifierProvider<UserNotifier, Map<dynamic, String>>((ref) {
  return UserNotifier();
});

class UserNotifier extends StateNotifier<Map<dynamic, String>> {
  UserNotifier() : super({});

  void setUser(Map<dynamic, String> user) {
    state = user;
  }
}
