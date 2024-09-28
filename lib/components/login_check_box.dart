import 'package:flutter/material.dart';

import 'assets_colors.dart';
import 'assets_images.dart';

// ignore: must_be_immutable
class LoginCheckBox extends StatefulWidget {
  final String text;
  bool onClick;
  final Function onChanged;
  LoginCheckBox({
    super.key,
    required this.text,
    required this.onClick,
    required this.onChanged,
  });

  @override
  State<LoginCheckBox> createState() => _LoginCheckBoxState();
}

class _LoginCheckBoxState extends State<LoginCheckBox> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            widget.onChanged();
          },
          child: ImageIcon(
            AssetImage(
              (widget.onClick)
                  ? Images.selectedCheckBox
                  : Images.unselectedCheckBox,
            ),
            color: AssetColors.cartButtonColor,
            size: 24.0,
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.03,
        ),
        Text(
          widget.text,
          style: TextStyle(
            color: AssetColors.primaryTextColor,
            fontSize: 15.0,
          ),
        ),
      ],
    );
  }
}
