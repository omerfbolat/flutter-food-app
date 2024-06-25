import 'package:flutter/material.dart';
import 'package:flutter_food_app/widget/image.dart';
import '../utils/theme.dart';

class CustomMiniCard extends StatelessWidget {
  final String title;
  final String restaurant;
  final String image;
  final int price;
  final VoidCallback onPressed;

  const CustomMiniCard({
    Key? key,
    required this.title,
    required this.restaurant,
    required this.image,
    required this.price,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ImageBox(
                image: image,
                round: 12,
                height: 75,
                width: 114,
              ),
              const SizedBox(height: 8.0),
              Text(
                title,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5.0),
              Text(
                restaurant,
                style: TextStyle(
                    fontSize: 13, fontWeight: FontWeight.w400, color: font),
              ),
              const SizedBox(height: 5.0),
              Row(
                children: [
                  Text(
                    '${price.toString()} \$',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: black),
                  ),
                  SizedBox(
                    width: 53,
                  ),
                  GestureDetector(
                    onTap: onPressed,
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: primary,
                      ),
                      child: Center(
                        child: Icon(
                          Icons.add,
                          color: white,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
