// ignore_for_file: avoid_print, deprecated_member_use, file_names

import 'package:mongo_dart/mongo_dart.dart';
import 'mongodb.dart';

import 'package:crypto/crypto.dart';
import 'dart:convert';
import 'package:jaguar_jwt/jaguar_jwt.dart';

String hashPassword(String password) {
  final bytes = utf8.encode(password);
  final digest = sha256.convert(bytes);
  return digest.toString();
}

String createJwt(String userId) {
  final claimSet = JwtClaim(
    issuer: 'food-app',
    subject: userId,
    issuedAt: DateTime.now(),
    maxAge: const Duration(hours: 1),
  );

  const key = 'your-secret-key';
  final token = issueJwtHS256(claimSet, key);
  return token;
}

Future<Map<String, dynamic>?> loginUser(String email, String password) async {
  final usersCollection = MongoDatabase.usersCollection;
  final hashedPassword = hashPassword(password);

  final user = await usersCollection
      .findOne(where.eq('email', email).eq('password', hashedPassword));
  if (user != null) {
    final userId = user['_id'].toString();
    final token = createJwt(userId);
    return {
      'token': token,
      'email': user['email'],
      'name': user['name'],
    };
  } else {
    return null;
  }
}
