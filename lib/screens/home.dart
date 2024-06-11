import 'package:flutter/material.dart';
import 'package:flutter_food_app/widget/card.dart';
import 'package:flutter_redux/flutter_redux.dart';
import '../redux/category/action.dart';
import '../redux/store.dart';
import '../redux/app/action.dart';
import '../widget/categories.dart';

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
                return () => store.dispatch(SetCategoriesAction([
                      {'text': 'All', 'image': ''},
                      {'text': 'Hot Dog', 'image': 'assets/images/doghot.png'},
                      {'text': 'Burger', 'image': ''}
                    ]));
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
            StoreConnector<AppStateWrapper, List<Map<String, String>>>(
              converter: (store) => store.state.categoryState.categories,
              builder: (context, categories) {
                return CategoriesSlider(
                  categories: categories.map((category) {
                    return {
                      "text": category['text'],
                      "image": category['image']
                    };
                  }).toList(),
                );
              },
            ),
            CustomCard(
              title: 'Rose Garden Restaurant',
              image: 'assets/images/card1.jpg',
              keys: ['Burger', 'Chiken', 'Riche', 'Wings'],
              point: 4.5,
              delivery: 'Free',
              time: '30 min',
              onPressed:() => {},
            ),
          ],
        ),
      ),
    );
  }
}
