import 'package:flutter/material.dart';
import '../utils/theme.dart';

class CustomQty extends StatefulWidget {
  final Function(String)? onChanged;
  final int? maxQty;

  const CustomQty({
    Key? key,
    this.onChanged,
    this.maxQty,
  }) : super(key: key);

  @override
  _CustomQtyState createState() => _CustomQtyState();
}

class _CustomQtyState extends State<CustomQty> {
  int _currentQty = 1;

  void _incrementQty() {
    setState(() {
      if (widget.maxQty == null || _currentQty < widget.maxQty!) {
        _currentQty++;
        widget.onChanged?.call(_currentQty.toString());
      }
    });
  }

  void _decrementQty() {
    setState(() {
      if (_currentQty > 1) {
        _currentQty--;
        widget.onChanged?.call(_currentQty.toString());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: 125,
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(50.0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: _decrementQty,
            child: Container(
              height: 24,
              width: 24,
              decoration: BoxDecoration(
                color: fontBold,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Icon(Icons.remove, color: white, size: 16),
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            width: 50,
            child: Text(
              '$_currentQty',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          GestureDetector(
            onTap: _incrementQty,
            child: Container(
              height: 24,
              width: 24,
              decoration: BoxDecoration(
                color: fontBold,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Icon(Icons.add, color: white, size: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
