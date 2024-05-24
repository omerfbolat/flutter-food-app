import './state.dart';
import './action.dart';

AppState appReducer(AppState state, dynamic action) {
  if (action is LoginAction) {
    return const AppState(isAuthenticated: true);
  } else if (action is LogoutAction) {
    return const AppState(isAuthenticated: false);
  }
  return state;
}
