import 'dart:developer';
import 'package:mongo_dart/mongo_dart.dart';
import 'constant.dart';

class MongoDatabase {
  static late Db _db;

  static Future<void> connect() async {
    _db = await Db.create(mongoUrl);
    await _db.open();
    inspect(_db);
  }

  static DbCollection getCollection(String collectionName) {
    if (!_db.isConnected) {
      throw Exception("Database is not connected");
    }
    return _db.collection(collectionName);
  }

  static DbCollection get usersCollection => getCollection('users');
  static DbCollection get productsCollection => getCollection('products');
  static DbCollection get categoriesCollection => getCollection('categories');
  static DbCollection get ordersCollection => getCollection('orders');
}
