import './state.dart';
import './action.dart';

AppState appReducer(AppState state, dynamic action) {
  if (action is LoginAction) {
    return state.copyWith(
      token: action.token,
      email: action.email,
      fullname: action.fullname,
    );
  } else if (action is LogoutAction) {
    return const AppState.initialState();
  }

  return state;
}
