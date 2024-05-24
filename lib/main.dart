import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'redux/store.dart';
import 'screens/splash_screen.dart';
import 'screens/welcome.dart';
import 'screens/login.dart';
import 'screens/home.dart';

void main() {
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
        title: 'Flutter Redux Navigation',
        initialRoute: '/',
        routes: {
          '/': (context) => SplashScreen(),
          '/welcome': (context) => const WelcomeScreen(),
          '/login': (context) => const LoginScreen(),
          '/home': (context) => const HomeScreen(),
        },
      ),
    );
  }
}
