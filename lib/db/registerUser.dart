// ignore_for_file: avoid_print, deprecated_member_use, file_names

import 'package:mongo_dart/mongo_dart.dart';
import 'mongodb.dart';

import 'dart:convert';
import 'package:crypto/crypto.dart';

String hashPassword(String password) {
  final bytes = utf8.encode(password);
  final digest = sha256.convert(bytes);
  return digest.toString();
}

Future<bool> isEmailRegistered(String email) async {
  final usersCollection = MongoDatabase.usersCollection;
  final user = await usersCollection.findOne(where.eq('email', email));
  return user != null;
}

Future<void> registerUser(String name, String email, String password) async {
  final usersCollection = MongoDatabase.usersCollection;
  final hashedPassword = hashPassword(password);
  final newUser = {
    '_id': ObjectId().toHexString(),
    'name': name,
    'email': email,
    'password': hashedPassword,
  };

  try {
    await usersCollection.insertOne(newUser);
    print("User registered successfully!");
  } catch (e) {
    print("Error registering user: $e");
  }
}
