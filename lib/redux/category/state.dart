import 'package:flutter/foundation.dart';

@immutable
class CategoryState {
  final List<String> categories;

  const CategoryState({required this.categories});

  CategoryState.initialState() : categories = [];
}
