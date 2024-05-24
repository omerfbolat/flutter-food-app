import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'app/state.dart';
import 'app/reducer.dart';
import 'category/state.dart';
import 'category/reducer.dart';

class AppStateWrapper {
  final AppState appState;
  final CategoryState categoryState;

  AppStateWrapper({
    required this.appState,
    required this.categoryState,
  });
}

AppStateWrapper appStateWrapperReducer(AppStateWrapper state, dynamic action) {
  return AppStateWrapper(
    appState: appReducer(state.appState, action),
    categoryState: categoryReducer(state.categoryState, action),
  );
}

Store<AppStateWrapper> createStore() {
  return Store<AppStateWrapper>(
    appStateWrapperReducer,
    initialState: AppStateWrapper(
      appState: const AppState.initialState(),
      categoryState: CategoryState.initialState(),
    ),
    middleware: [thunkMiddleware],
  );
}
