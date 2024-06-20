import 'package:flutter/material.dart';
import 'package:flutter_food_app/widget/button.dart';
import 'package:flutter_food_app/widget/categories.dart';
import 'package:flutter_food_app/widget/image.dart';
import 'package:flutter_food_app/widget/options.dart';
import 'package:flutter_food_app/widget/qty.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/theme.dart';

class FoodDetailsScreen extends StatefulWidget {
  const FoodDetailsScreen({Key? key}) : super(key: key);

  @override
  _FoodDetailsScreenState createState() => _FoodDetailsScreenState();
}

class _FoodDetailsScreenState extends State<FoodDetailsScreen> {
  bool _isFavorite = false;
  Color _backgroundColor = Colors.white;

  void _toggleFavorite() {
    setState(() {
      _isFavorite = !_isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      ImageBox(
                        width: MediaQuery.of(context).size.width,
                        height: 300,
                        image: 'assets/images/card1.jpg',
                        round: 12,
                      ),
                      Positioned(
                        top: 50,
                        left: 25,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Image.asset(
                            'assets/images/back_button.png',
                            width: 45,
                            height: 45,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 50,
                        right: 25,
                        child: GestureDetector(
                          onTap: _toggleFavorite,
                          child: Container(
                            width: 45,
                            height: 45,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                            child: Center(
                              child: _isFavorite
                                  ? SvgPicture.asset(
                                      'assets/icons/heart.svg',
                                      width: 24.0,
                                      height: 24.0,
                                    )
                                  : SvgPicture.asset(
                                      'assets/icons/heartIsFavorite.svg',
                                      width: 20.0,
                                      height: 20.0,
                                    ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Burger Bistro',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(height: 7),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              'assets/images/roseGarden.png',
                              width: 22,
                              height: 22,
                            ),
                            SizedBox(width: 11),
                            Text(
                              'Rose Garden',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        SizedBox(height: 7),
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/icons/Star.svg',
                              width: 20.0,
                              height: 20.0,
                              color: primary,
                            ),
                            const SizedBox(width: 4.0),
                            Text(
                              '4.7',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            const SizedBox(width: 16.0),
                            SvgPicture.asset(
                              'assets/icons/Car.svg',
                              width: 20.0,
                              height: 20.0,
                              color: primary,
                            ),
                            const SizedBox(width: 4.0),
                            Text(
                              'Free',
                              style: TextStyle(fontSize: 14),
                            ),
                            const SizedBox(width: 16.0),
                            SvgPicture.asset(
                              'assets/icons/Watch.svg',
                              width: 20.0,
                              height: 20.0,
                              color: primary,
                            ),
                            const SizedBox(width: 4.0),
                            Text(
                              '20 min',
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Maecenas sed diam eget risus varius blandit sit amet non magna. Integer posuere erat a ante venenatis dapibus posuere velit aliquet.',
                          style: TextStyle(fontSize: 14, color: font),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'SIZE:',
                              style: TextStyle(fontSize: 13, color: black),
                            ),
                            SizedBox(width: 16),
                            CustomOptions(options: [
                              {'text': '14”'},
                              {'text': '14”'},
                              {'text': '14”'}
                            ]),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'INGREDIENTS',
                              style: TextStyle(fontSize: 13, color: black),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                for (String item in [
                                  'salt',
                                  'chicken',
                                  'onion',
                                  'garlic',
                                  'pappers'
                                ])
                                  Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: rectangle,
                                    ),
                                    child: Center(
                                      child: SvgPicture.asset(
                                        'assets/icons/$item.svg',
                                        width: 24,
                                        height: 24,
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
              color: infoLight,
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '\$32',
                            style: TextStyle(fontSize: 28),
                          ),
                          CustomQty(
                            onChanged: (qty) {},
                            maxQty: 20,
                          ),
                        ],
                      ),
                      SizedBox(height: 24),
                      CustomButton(text: 'ADD TO CART', onPressed: () {}),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
