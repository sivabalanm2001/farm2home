import 'package:flutter/material.dart';
import 'assets_colors.dart';
import 'assets_images.dart';

class AddedToCartButton extends StatefulWidget {
  final int count;
  final Function onIncrement;
  final Function onDecrement;
  const AddedToCartButton({
    super.key,
    required this.count,
    required this.onIncrement,
    required this.onDecrement,
  });
  bool isAdded(int count) => count > 0;
  @override
  State<AddedToCartButton> createState() => _AddedToCartButtonState();
}

class _AddedToCartButtonState extends State<AddedToCartButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AssetColors.cartButtonColor, width: 1),
        borderRadius: BorderRadius.circular(8),
      ),
      height: MediaQuery.of(context).size.height * 0.05,
      width: MediaQuery.of(context).size.width * 0.32,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              if (widget.count > 0) widget.onDecrement();
            },
            child: Container(
              decoration: BoxDecoration(
                color: AssetColors.cartButtonColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(5.0),
                  bottomLeft: Radius.circular(5.0),
                ),
              ),
              height: MediaQuery.of(context).size.height * 0.058,
              width: MediaQuery.of(context).size.width * 0.11,
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Image.asset(Images.subIcon),
              ),
            ),
          ),
          (widget.count > 0)
              ? Text(
                  '${widget.count}',
                  style: TextStyle(
                    fontSize: 15.0,
                    color: AssetColors.primaryTextColor,
                  ),
                )
              : Text(
                  '0',
                  style: TextStyle(
                    fontSize: 15.0,
                    color: AssetColors.primaryTextColor,
                  ),
                ),
          InkWell(
            onTap: () {
              widget.onIncrement();
            },
            child: Container(
              decoration: BoxDecoration(
                  color: AssetColors.cartButtonColor,
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(5.0),
                      bottomRight: Radius.circular(5.0))),
              height: MediaQuery.of(context).size.height * 0.058,
              width: MediaQuery.of(context).size.width * 0.11,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image.asset(Images.addIcon),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
