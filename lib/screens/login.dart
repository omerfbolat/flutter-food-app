// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_food_app/widget/button.dart';
import 'package:flutter_redux/flutter_redux.dart';
import '../db/loginUser.dart';
import '../redux/app/action.dart';
import '../redux/store.dart';
import '../utils/theme.dart';
import '../widget/input.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email = '';
  String password = '';
  bool rememberMe = false;

  void snackBarError(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(backgroundColor: error, content: Text(text)),
    );
  }

  Future<void> loginUp(BuildContext context) async {
    if (email.isEmpty) {
      snackBarError(context, 'Please enter your email');
      return;
    }

    if (password.isEmpty) {
      snackBarError(context, 'Please enter your password');
      return;
    }

    final result = await loginUser(email, password);

    if (result != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            backgroundColor: Colors.green,
            content: Text('Login successfully!')),
      );

      StoreProvider.of<AppStateWrapper>(context).dispatch(
        LoginAction(
          token: result['token'],
          email: result['email'],
          fullname: result['name'],
        ),
      );

      Navigator.pushNamed(context, '/home');
    } else {
      snackBarError(context, 'Invalid email or password');
    }
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
                    'Log In',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Please sign in to your existing account',
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
                        title: 'EMAIL',
                        hintText: 'example@gmail.com',
                        onChanged: (text) {
                          setState(() {
                            email = text;
                          });
                        }),
                    const SizedBox(height: 10),
                    CustomInput(
                        title: 'PASSWORD',
                        hintText: '* * * * * * * * * *',
                        isPassword: true,
                        onChanged: (text) {
                          setState(() {
                            password = text;
                          });
                        }),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Checkbox(
                              value: false,
                              onChanged: (newValue) {},
                            ),
                            const Text(
                              'Remember me',
                              style: TextStyle(
                                color: fontPlaceholder,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/forget_password');
                          },
                          child: const Text(
                            'Forgot Password?',
                            style: TextStyle(
                              color: primary,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    CustomButton(
                      text: 'LOG IN',
                      onPressed: () => loginUp(context),
                    ),
                    const SizedBox(height: 30),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Don’t have an account?',
                            style: TextStyle(
                              color: fontPlaceholder,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 10),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/sign_up');
                            },
                            child: const Text(
                              'SIGN UP',
                              style: TextStyle(
                                color: primary,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 150),
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
