import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'redux/store.dart';
import 'db/mongodb.dart';

import 'screens/splash_screen.dart';
import 'screens/welcome.dart';
import 'screens/login.dart';
import 'screens/home.dart';
import 'screens/forget_password.dart';
import 'screens/send_code.dart';
import 'screens/sign_up.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MongoDatabase.connect();

  final store = createStore();

  runApp(MyApp(store: store));
}

class MyApp extends StatelessWidget {
  final Store<AppStateWrapper> store;

  const MyApp({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppStateWrapper>(
      store: store,
      child: MaterialApp(
        theme: ThemeData(fontFamily: 'Sen'),
        title: 'Flutter Redux Navigation',
        initialRoute: '/',
        routes: {
          '/': (context) => SplashScreen(),
          '/welcome': (context) => const WelcomeScreen(),
          '/login': (context) => const LoginScreen(),
          '/home': (context) => const HomeScreen(),
          '/forget_password': (context) => const ForgetPasswordScreen(),
          '/send_code': (context) => const SendCodeScreen(),
          '/sign_up': (context) => const SignupScreen(),
        },
      ),
    );
  }
}
