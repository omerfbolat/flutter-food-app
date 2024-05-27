import 'package:flutter/material.dart';
import 'package:flutter_food_app/utils/theme.dart';
import 'package:flutter_food_app/widget/button.dart';
import 'package:flutter_food_app/widget/image.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> _pages = [
    {
      'image': 'assets/images/1.png',
      'title': 'All your favorites',
      'subtitle':
          'Get all your loved foods in one once place, you just place the order we do the rest'
    },
    {
      'image': 'assets/images/2.png',
      'title': 'Order from choosen chef',
      'subtitle':
          'Get all your loved foods in one once place, you just place the orer we do the rest'
    },
    {
      'image': 'assets/images/3.png',
      'title': 'Free delivery offers',
      'subtitle':
          'Get all your loved foods in one once place, you just place the orer we do the rest'
    },
  ];

  void _nextPage() {
    if (_currentPage < _pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pushNamed(context, '/login');
    }
  }

  void _skip() {
    Navigator.pushNamed(context, '/login');
  }

  List<Widget> _buildPageIndicator() {
    List<Widget> indicators = [];
    for (int i = 0; i < _pages.length; i++) {
      indicators.add(_indicator(i == _currentPage));
    }
    return indicators;
  }

  Widget _indicator(bool isActive) {
    return Container(
      width: 10.0,
      height: 10.0,
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive ? primary : primaryLight,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (int index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemCount: _pages.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ImageBox(
                        image: _pages[index]['image'],
                        height: 292,
                        width: 240,
                      ),
                      const SizedBox(height: 24),
                      Text(
                        _pages[index]['title']!,
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        _pages[index]['subtitle']!,
                        style: const TextStyle(fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 50),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: _buildPageIndicator(),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: CustomButton(
              text: _currentPage == _pages.length - 1 ? 'Get Started' : 'Next',
              onPressed: _nextPage,
            ),
          ),
          TextButton(
            onPressed: _skip,
            child: Text(_currentPage == _pages.length - 1 ? '' : 'Skip',
                style: const TextStyle(color: black)),
          ),
          const SizedBox(height: 25),
        ],
      ),
    );
  }
}
