import 'package:flutter/material.dart';
import 'package:flutter_food_app/widget/mini_card.dart';
import 'package:flutter_food_app/widget/options.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../utils/theme.dart';

class RestaurantScreen extends StatefulWidget {
  const RestaurantScreen({Key? key}) : super(key: key);

  @override
  _RestaurantScreenState createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  int _current = 0;
  final List<String> imgList = [
    'assets/images/card1.jpg',
    'assets/images/card1.jpg',
    'assets/images/card1.jpg',
  ];

  List<Map<String, dynamic>> _options = [];
  String _ingredientsText = '';

  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    _options = [
      {
        'text': 'Burger',
        'onPressed': () {
          setState(() {
            _ingredientsText = 'Burger';
          });
        }
      },
      {
        'text': 'Sandwich',
        'onPressed': () {
          setState(() {
            _ingredientsText = 'Sandwich';
          });
        }
      },
      {
        'text': 'Pizza',
        'onPressed': () {
          setState(() {
            _ingredientsText = 'Pizza';
          });
        }
      },
      {
        'text': 'Sandwich',
        'onPressed': () {
          setState(() {
            _ingredientsText = 'Sandwich';
          });
        }
      },
    ];
    _ingredientsText = _options.first['text'];
  }

  List<Widget> generateImageTiles() {
    return imgList
        .map((element) => ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                element,
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
              ),
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        height: 321,
                        child: PageView(
                          controller: _pageController,
                          onPageChanged: (index) {
                            setState(() {
                              _current = index;
                            });
                          },
                          children: generateImageTiles(),
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        left: 0,
                        right: 0,
                        child: Center(
                          child: SmoothPageIndicator(
                            controller: _pageController,
                            count: imgList.length,
                            effect: ScrollingDotsEffect(
                              dotWidth: 10.0,
                              dotHeight: 10.0,
                              activeDotColor: Colors.white,
                              dotColor: Colors.grey,
                              activeStrokeWidth: 2.0,
                              activeDotScale: 1.5,
                              strokeWidth: 1.5,
                              radius: 8.0,
                            ),
                          ),
                        ),
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
                          child: Container(
                            width: 45,
                            height: 45,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                            child: Center(
                                child: Transform.rotate(
                              angle: 90 * 3.1415927 / 180,
                              child: SvgPicture.asset(
                                'assets/icons/More.svg',
                                width: 20.0,
                                height: 20.0,
                              ),
                            )),
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
                        SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Spicy restaurant',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(height: 7),
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
                        CustomOptions(options: _options),
                        SizedBox(
                          height: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _ingredientsText + ' (10)',
                              style: TextStyle(fontSize: 20, color: black),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomMiniCard(
                                title: 'Burger Ferguson',
                                image: 'assets/images/card1.jpg',
                                price: 40,
                                restaurant: 'Spicy restaurant',
                                onPressed: () {}),
                            CustomMiniCard(
                                title: 'Burger Ferguson',
                                image: 'assets/images/card1.jpg',
                                price: 40,
                                restaurant: 'Spicy restaurant',
                                onPressed: () {})
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
