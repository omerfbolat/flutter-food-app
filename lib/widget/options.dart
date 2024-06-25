import 'package:flutter/material.dart';
import 'package:flutter_food_app/utils/theme.dart';

class CustomOptions extends StatefulWidget {
  final List<Map<String, dynamic>> options;
  final int? size;

  const CustomOptions({Key? key, required this.options, this.size})
      : super(key: key);

  @override
  _OptionsState createState() => _OptionsState();
}

class _OptionsState extends State<CustomOptions> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(widget.options.length, (index) {
              final category = widget.options[index];
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedIndex = index;
                  });
                  if (category['onPressed'] != null) {
                    category['onPressed']!();
                  }
                },
                child: Container(
                  margin: EdgeInsets.only(right: 8.0),
                  padding: EdgeInsets.all(18.0),
                  decoration: BoxDecoration(
                    color: _selectedIndex == index ? activeButton : infoLight,
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  child: Row(
                    children: [
                      Container(
                        child: Center(
                          child: Text(
                            category['text']!,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}
