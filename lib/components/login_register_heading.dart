import 'package:flutter/material.dart';
import 'assets_images.dart';

Widget loginRegisterHeading(BuildContext context) {
  return Row(
    children: [
      SizedBox(
        height: 17.0,
        width: 20.0,
        child: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: ImageIcon(
            AssetImage(Images.leftArrowIcon),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 44.0, horizontal: 60.0),
        child: SizedBox(
          height: 88.0,
          width: 185.0,
          child: Image(
            image: AssetImage(Images.freshLocalLogo),
          ),
        ),
      ),
    ],
  );
}
