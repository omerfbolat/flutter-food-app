import 'package:flutter/foundation.dart';

@immutable
class CategoryState {
  final List<Map<String, String>> categories;

  const CategoryState({required this.categories});

  CategoryState.initialState() : categories = [];
}
