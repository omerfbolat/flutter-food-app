import './state.dart';
import './action.dart';

CategoryState categoryReducer(CategoryState state, dynamic action) {
  if (action is SetCategoriesAction) {
    return CategoryState(categories: action.categories);
  }
  return state;
}
