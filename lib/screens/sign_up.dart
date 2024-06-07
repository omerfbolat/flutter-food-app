import 'package:flutter/material.dart';
import 'package:flutter_food_app/db/registerUser.dart';
import 'package:flutter_food_app/widget/button.dart';
import '../utils/theme.dart';
import '../widget/input.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  String name = '';
  String email = '';
  String password = '';
  String confirmPassword = '';

  void snackBarError(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(backgroundColor: error, content: Text(text)),
    );
  }

  Future<void> signUp(context) async {
    if (name.isEmpty) {
      snackBarError(context, 'Please enter your name');
      return;
    }

    if (!name.contains(' ')) {
      snackBarError(context, 'Please enter at least first and last name');
      return;
    }

    if (email.isEmpty) {
      snackBarError(context, 'Please enter your email');
      return;
    }

    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(email)) {
      snackBarError(context, 'Please enter a valid email');
      return;
    }

    if (password.isEmpty) {
      snackBarError(context, 'Please enter your password');
      return;
    }

    if (password.length < 6) {
      snackBarError(context, 'Password must be at least 6 characters long');
      return;
    }

    if (password != confirmPassword) {
      snackBarError(context, 'Passwords do not match');
      return;
    }

    if (await isEmailRegistered(email)) {
      snackBarError(context, 'Email is already registered');
      return;
    }

    await registerUser(name, email, password);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
          backgroundColor: Colors.green,
          content: Text('User registered successfully!')),
    );
    Navigator.pushNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: background,
      body: Stack(
        children: [
          Positioned(
            top: -15,
            left: 0,
            child: Image.asset(
              'assets/images/ellipse.png',
              width: 150,
              height: 150,
            ),
          ),
          Positioned(
            top: 50,
            left: 20,
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/login');
              },
              child: Image.asset(
                'assets/images/back_button.png',
                width: 45,
                height: 45,
              ),
            ),
          ),
          Positioned(
            top: 0,
            right: -50,
            child: Image.asset(
              'assets/images/vector.png',
              width: 200,
              height: 400,
            ),
          ),
          const Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.only(top: 100, left: 20, right: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Sign Up',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Please sign up to get started',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
          Positioned(
            top: 220,
            left: 0,
            right: 0,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CustomInput(
                        title: 'Name',
                        hintText: 'John doe',
                        onChanged: (text) {
                          setState(() {
                            name = text;
                          });
                        }),
                    CustomInput(
                        title: 'EMAIL',
                        hintText: 'example@gmail.com',
                        onChanged: (text) {
                          setState(() {
                            email = text;
                          });
                        }),
                    CustomInput(
                        title: 'Password',
                        hintText: '* * * * * * * * * *',
                        onChanged: (text) {
                          setState(() {
                            password = text;
                          });
                        }),
                    CustomInput(
                        title: 'Re-Type Password',
                        hintText: '* * * * * * * * * *',
                        onChanged: (text) {
                          setState(() {
                            confirmPassword = text;
                          });
                        }),
                    const SizedBox(height: 30),
                    CustomButton(
                      text: 'Sign Up',
                      onPressed: () => signUp(context),
                    ),
                    const SizedBox(height: 600),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
