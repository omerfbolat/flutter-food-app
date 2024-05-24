import 'package:flutter/foundation.dart';

@immutable
class AppState {
  final bool isAuthenticated;

  const AppState({required this.isAuthenticated});

  const AppState.initialState() : isAuthenticated = false;
}
