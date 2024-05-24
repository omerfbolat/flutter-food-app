import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import '../redux/category/action.dart';
import '../redux/store.dart';
import '../redux/app/action.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        actions: [
          StoreConnector<AppStateWrapper, VoidCallback>(
            converter: (store) {
              return () => store.dispatch(LogoutAction());
            },
            builder: (context, callback) {
              return IconButton(
                icon: const Icon(Icons.logout),
                onPressed: () {
                  callback();
                  Navigator.pushReplacementNamed(context, '/login');
                },
              );
            },
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Welcome Home!'),
            StoreConnector<AppStateWrapper, VoidCallback>(
              converter: (store) {
                return () => store
                    .dispatch(SetCategoriesAction(['Category1', 'Category2']));
              },
              builder: (context, callback) {
                return ElevatedButton(
                  onPressed: () {
                    callback();
                  },
                  child: const Text('Load Categories'),
                );
              },
            ),
            StoreConnector<AppStateWrapper, List<String>>(
              converter: (store) => store.state.categoryState.categories,
              builder: (context, categories) {
                return Column(
                  children:
                      categories.map((category) => Text(category)).toList(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
