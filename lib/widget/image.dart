import 'package:flutter/material.dart';
import 'package:flutter_food_app/utils/theme.dart';

class ImageBox extends StatelessWidget {
  final String? image;
  final double width;
  final double height;
  final BoxFit fit;
  final bool circle;
  final double round;

  const ImageBox({
    Key? key,
    this.image,
    this.width = 100,
    this.height = 100,
    this.fit = BoxFit.cover,
    this.circle = false,
    this.round = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (image != null) {
      return Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          shape: circle ? BoxShape.circle : BoxShape.rectangle,
          borderRadius: circle ? null : BorderRadius.circular(round),
          image: DecorationImage(
            image: AssetImage(image!),
            fit: fit,
          ),
        ),
      );
    } else {
      return Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: emptyImage,
          shape: circle ? BoxShape.circle : BoxShape.rectangle,
          borderRadius: circle ? null : BorderRadius.circular(round),
        ),
    );
  }
  }
}
