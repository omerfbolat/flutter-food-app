import 'package:flutter/foundation.dart';

@immutable
class AppState {
  final String token;
  final String email;
  final String fullname;

  const AppState({
    required this.token,
    required this.email,
    required this.fullname,
  });

  const AppState.initialState()
      : token = '',
        email = '',
        fullname = '';

  AppState copyWith({
    String? token,
    String? email,
    String? fullname,
  }) {
    return AppState(
      token: token ?? this.token,
      email: email ?? this.email,
      fullname: fullname ?? this.fullname,
    );
  }
}
