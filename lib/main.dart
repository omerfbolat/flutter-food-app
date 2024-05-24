import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Welcome Food App'),
        ),
      ),
    );
  }
}
