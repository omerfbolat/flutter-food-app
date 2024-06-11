import 'package:flutter/material.dart';
import 'package:flutter_food_app/widget/image.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../utils/theme.dart';

class CustomCard extends StatelessWidget {
  final String title;
  final String image;
  final List<String> keys;
  final double point;
  final String delivery;
  final String time;

  const CustomCard({
    Key? key,
    required this.title,
    required this.image,
    required this.keys,
    required this.point,
    required this.delivery,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImageBox(
              image: 'assets/images/card1.jpg',
              round: 12,
              height: 137,
              width: MediaQuery.of(context).size.height * 100,
            ),
            const SizedBox(height: 8.0),
            Text(
              title,
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 8.0),
            Text(
              keys.join(' - '),
              style: TextStyle(color: fontPlaceholder, fontSize: 14),
            ),
            const SizedBox(height: 8.0),
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
                  point.toString(),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
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
                  delivery,
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
                  time,
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
