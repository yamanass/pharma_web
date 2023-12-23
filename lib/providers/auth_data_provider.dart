import 'package:flutter_riverpod/flutter_riverpod.dart';


class TokenNotifierState extends StateNotifier<String?> {
  TokenNotifierState() : super(null);

  setToken(String token) {
    state = token;
  }
}

final tokenProvider = StateNotifierProvider((ref) => TokenNotifierState());
