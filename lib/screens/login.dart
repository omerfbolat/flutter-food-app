import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import '../redux/store.dart';
import '../redux/app/action.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Sign in'),
            StoreConnector<AppStateWrapper, VoidCallback>(
              converter: (store) {
                return () => store.dispatch(LoginAction());
              },
              builder: (context, callback) {
                return ElevatedButton(
                  onPressed: () {
                    callback();
                    Navigator.pushReplacementNamed(context, '/home');
                  },
                  child: const Text('Login'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
