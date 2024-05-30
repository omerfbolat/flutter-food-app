import 'package:flutter/material.dart';
import 'package:flutter_food_app/widget/button.dart';
import '../utils/theme.dart';
import '../widget/input.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);

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
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 100, left: 20, right: 20),
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
                      title: 'Name',
                      hintText: 'John doe',
                    ),
                    CustomInput(
                      title: 'EMAIL',
                      hintText: 'example@gmail.com',
                    ),
                    CustomInput(
                      title: 'Password',
                      hintText: '* * * * * * * * * *',
                    ),
                    CustomInput(
                      title: 'Re-Type Password',
                      hintText: '* * * * * * * * * *',
                    ),
                    SizedBox(height: 30),
                    CustomButton(
                      text: 'Sign Up',
                      onPressed:  () {
                        Navigator.pushNamed(context, '/send_code');
                      },
                    ),
                    SizedBox(height: 600),
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
