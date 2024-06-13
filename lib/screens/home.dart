import 'package:flutter/material.dart';
import 'package:flutter_food_app/widget/card.dart';
import 'package:flutter_food_app/widget/input.dart';
import 'package:flutter_redux/flutter_redux.dart';
import '../redux/category/action.dart';
import '../redux/store.dart';
import '../widget/categories.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../utils/theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      StoreProvider.of<AppStateWrapper>(context).dispatch(SetCategoriesAction([
        {'text': 'All', 'image': 'assets/images/all.png'},
        {'text': 'Hot Dog', 'image': 'assets/images/doghot.png'},
        {'text': 'Burger', 'image': 'assets/images/burger.png'}
      ]));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
            top: 50.0, left: 20.0, right: 20.0, bottom: 20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 45.0,
                    height: 45.0,
                    decoration: const BoxDecoration(
                      color: grayscaleLight,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        'assets/icons/Menu.svg',
                        width: 12.0,
                        height: 16.0,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Deliver to',
                        style: TextStyle(fontSize: 16.0, color: primary),
                      ),
                      Row(children: [
                        const Text(
                          'Halal Lab office',
                          style: TextStyle(fontSize: 14.0, color: font),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        SvgPicture.asset(
                          'assets/icons/Polygon 1.svg',
                          width: 15.0,
                          height: 15.0,
                        ),
                      ]),
                    ],
                  ),
                  const Spacer(),
                  Container(
                    width: 45.0,
                    height: 45.0,
                    decoration: const BoxDecoration(
                      color: background,
                      shape: BoxShape.circle,
                    ),
                    child: Stack(
                      children: [
                        Center(
                          child: SvgPicture.asset(
                            'assets/icons/shoppingBag.svg',
                            width: 15.0,
                            height: 20.0,
                          ),
                        ),
                        Positioned(
                          top: 0,
                          right: 0,
                          child: Container(
                            width: 25.0,
                            height: 25.0,
                            decoration: const BoxDecoration(
                              color: primary,
                              shape: BoxShape.circle,
                            ),
                            child: const Center(
                              child: Text(
                                '2',
                                style: TextStyle(
                                  color: white,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              const Row(children: [
                Text(
                  'Hey Halal, ',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  'Good Afternoon!',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ]),
              const SizedBox(
                height: 16,
              ),
              const CustomInput(
                hintText: 'Search dishes, restaurants',
                search: true,
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
              const SizedBox(
                height: 10,
              ),
              CustomCard(
                title: 'Rose Garden Restaurant',
                image: 'assets/images/card1.jpg',
                keys: ['Burger', 'Chicken', 'Rice', 'Wings'],
                point: 4.5,
                delivery: 'Free',
                time: '30 min',
                onPressed: () => {},
              ),
              const SizedBox(
                height: 10,
              ),
              CustomCard(
                title: 'Rose Garden Restaurant',
                image: 'assets/images/card1.jpg',
                keys: const ['Burger', 'Chicken', 'Rice', 'Wings'],
                point: 4.5,
                delivery: 'Free',
                time: '30 min',
                onPressed: () => {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
