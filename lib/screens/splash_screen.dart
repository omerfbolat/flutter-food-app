import 'dart:async';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed('/welcome');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset('assets/food_logo.png', width: 100, height: 100),
              ],
            ),
          ),
            Positioned(
              top: -15,
              left:0,
              child: Image.asset('assets/splash.png', width: 200, height: 200),
            ),
            Positioned(
              bottom: 0,
              right: -15,
              child: Image.asset('assets/splash2.png', width: 200, height: 200),
            ),
          ],
      ),
    );
  }
}