import 'package:flutter/material.dart';
import '../utils/theme.dart';

class CustomInput extends StatefulWidget {
  final String hintText;
  final bool isPassword;
  final String? title;
  final double? width;
  final double? height;
  final bool useHintAsPlaceholder;
  final bool isNumeric;
  final int? maxLength;
  final bool isCentered;
  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;
  final FocusNode? previousFocusNode;
  final bool search;

  const CustomInput({
    Key? key,
    required this.hintText,
    this.title,
    this.isPassword = false,
    this.width = 90,
    this.height = 62,
    this.useHintAsPlaceholder = true,
    this.isNumeric = false,
    this.maxLength,
    this.isCentered = false,
    this.focusNode,
    this.nextFocusNode,
    this.previousFocusNode,
    this.search = false,
  }) : super(key: key);

  @override
  _CustomInputState createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  bool _obscureText = true;

  void _toggleObscureText() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      if (_controller.text.length == widget.maxLength) {
        widget.nextFocusNode?.requestFocus();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: widget.isCentered
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        if (widget.title != null)
          Text(
            widget.title!,
            style: TextStyle(
              color: font,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: SizedBox(
            width: MediaQuery.of(context).size.width * widget.width! / 100,
            height: widget.height,
            child: TextField(
              controller: _controller,
              obscureText: widget.isPassword ? _obscureText : false,
              keyboardType:
                  widget.isNumeric ? TextInputType.number : TextInputType.text,
              textAlign: widget.isCentered ? TextAlign.center : TextAlign.start,
              maxLength: widget.maxLength,
              decoration: InputDecoration(
                filled: true,
                fillColor: infoLight,
                hintText: widget.useHintAsPlaceholder ? widget.hintText : null,
                hintStyle: TextStyle(color: fontPlaceholder),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                counterText: '',
                suffixIcon: widget.isPassword
                    ? IconButton(
                        icon: Icon(
                          _obscureText
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: fontPlaceholder,
                        ),
                        onPressed: _toggleObscureText,
                      )
                    : null,
                prefixIcon: widget.search
                    ? Icon(
                        Icons.search,
                        color: fontPlaceholder,
                      )
                    : null,
              ),
              focusNode: widget.focusNode,
              onChanged: (_) {
                if (_controller.text.isEmpty) {
                  widget.previousFocusNode?.requestFocus();
                }
              },
              onSubmitted: (_) {
                widget.nextFocusNode?.requestFocus();
              },
            ),
          ),
        ),
      ],
    );
  }
}
