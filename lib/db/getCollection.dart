// ignore_for_file: file_names

import 'mongodb.dart';

Future<List<Map<String, dynamic>>> getCategories() async {
  var categoriesCollection = MongoDatabase.categoriesCollection;

  var categoryDocs = await categoriesCollection.find().toList();

  return categoryDocs;
}
