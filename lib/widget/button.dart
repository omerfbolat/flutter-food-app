import 'package:flutter/material.dart';
import 'package:flutter_food_app/utils/theme.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;
  final Color textColor;
  final String width;
  final double height;
  final bool circle;
  final double round;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.color = primary,
    this.textColor = white,
    this.width = '100%',
    this.height = 62.0,
    this.circle = false,
    this.round = 16,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width == '100%'
          ? MediaQuery.of(context).size.width
          : MediaQuery.of(context).size.width *
              (double.parse(width.replaceAll('%', '')) / 100),
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: textColor,
          shape: circle
              ? const CircleBorder()
              : RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(round),
                ),
          textStyle: const TextStyle(fontSize: 16),
        ),
        child: Text(text),
      ),
    );
  }
}
