import 'package:flutter/material.dart';

import 'assets_colors.dart';

class AddToCart extends StatefulWidget {
  final Color buttonColor;
  final String text;
  final Function onClick;

  const AddToCart({
    super.key,
    required this.buttonColor,
    required this.text,
    required this.onClick,
  });

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onClick();
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: widget.buttonColor,
        ),
        height: MediaQuery.of(context).size.height * 0.05,
        width: MediaQuery.of(context).size.width * 0.32,
        child: Center(
          child: Text(
            widget.text,
            style: TextStyle(
              color: AssetColors.backgroundColor,
              fontSize: 15.0,
            ),
          ),
        ),
      ),
    );
  }
}
