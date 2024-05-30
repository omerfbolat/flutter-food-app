import 'package:flutter/material.dart';
import 'package:flutter_food_app/widget/button.dart';
import '../utils/theme.dart';
import '../widget/input.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

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
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 100, left: 20, right: 20),
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
              decoration: BoxDecoration(
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
                    ),
                    SizedBox(height: 10),
                    CustomInput(
                      title: 'PASSWORD',
                      hintText: '* * * * * * * * * *',
                      isPassword: true,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Checkbox(
                              value: false,
                              onChanged: (newValue) {},
                            ),
                            Text(
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
                          child: Text(
                            'Forgot Password?',
                            style: TextStyle(
                              color: primary,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    CustomButton(
                      text: 'LOG IN',
                      onPressed: () {
                        Navigator.pushNamed(context, '/home');
                      },
                    ),
                    SizedBox(height: 30),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Don’t have an account?',
                            style: TextStyle(
                              color: fontPlaceholder,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 10),
                          GestureDetector(
                            onTap: () {
                            Navigator.pushNamed(context, '/sign_up');
                          },
                            child: Text(
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
                    SizedBox(height: 150),
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
