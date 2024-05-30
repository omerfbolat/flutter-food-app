import 'package:flutter/material.dart';
import 'package:flutter_food_app/widget/button.dart';
import '../utils/theme.dart';
import '../widget/input.dart';

class SendCodeContainer extends StatefulWidget {
  @override
  _SendCodeContainerState createState() => _SendCodeContainerState();
}

class _SendCodeContainerState extends State<SendCodeContainer> {
  int _countDown = 60;
  bool _isCounting = false;

  @override
  void initState() {
    super.initState();
    _startCountDown();
  }

  void _startCountDown() {
    setState(() {
      _isCounting = true;
    });
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        _countDown--;
      });
      if (_countDown > 0) {
        _startCountDown();
      } else {
        setState(() {
          _isCounting = false;
          _countDown = 60;
        });
      }
    });
  }

  FocusNode _focusNode1 = FocusNode();
  FocusNode _focusNode2 = FocusNode();
  FocusNode _focusNode3 = FocusNode();
  FocusNode _focusNode4 = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'CODE',
              style: TextStyle(
                color: fontPlaceholder,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              _isCounting ? 'Resend in $_countDown sec' : 'Resend',
              style: TextStyle(
                color: fontPlaceholder,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: CustomInput(
                hintText: 'code1',
                useHintAsPlaceholder: false,
                isNumeric: true,
                maxLength: 1,
                isCentered: true,
                nextFocusNode: _focusNode2,
                focusNode: _focusNode1,
              ),
            ),
            SizedBox(width: 20),
            Expanded(
              child: CustomInput(
                hintText: 'code2',
                useHintAsPlaceholder: false,
                isNumeric: true,
                maxLength: 1,
                isCentered: true,
                focusNode: _focusNode2,
                nextFocusNode: _focusNode3,
                previousFocusNode: _focusNode1,
              ),
            ),
            SizedBox(width: 20),
            Expanded(
              child: CustomInput(
                hintText: 'code3',
                useHintAsPlaceholder: false,
                isNumeric: true,
                maxLength: 1,
                isCentered: true,
                focusNode: _focusNode3,
                nextFocusNode: _focusNode4,
                previousFocusNode: _focusNode2,
              ),
            ),
            SizedBox(width: 20),
            Expanded(
              child: CustomInput(
                hintText: 'code4',
                useHintAsPlaceholder: false,
                isNumeric: true,
                maxLength: 1,
                isCentered: true,
                focusNode: _focusNode4,
                previousFocusNode: _focusNode3,
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        CustomButton(
          text: 'VERIFY',
          onPressed: () {
            _startCountDown();
            Navigator.pushNamed(context, '/home');
          },
        ),
        SizedBox(height: 600),
      ],
    );
  }
}

class SendCodeScreen extends StatelessWidget {
  const SendCodeScreen({Key? key}) : super(key: key);

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
                Navigator.pushNamed(context, '/forget_password');
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
                    'Verification',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Center(
                    child: Text(
                      'We have sent a code to your email example@gmail.com',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
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
                child: SendCodeContainer(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
