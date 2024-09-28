import 'package:flutter/material.dart';
import 'assets_colors.dart';

class LoginButton extends StatelessWidget {
  final String text;
  final Function navigateTo;
  const LoginButton({
    super.key,
    required this.text,
    required this.navigateTo,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(
          AssetColors.cartButtonColor,
        ),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        fixedSize: WidgetStatePropertyAll(
          Size(
            MediaQuery.of(context).size.width * 0.92,
            MediaQuery.of(context).size.height * 0.073,
          ),
        ),
      ),
      onPressed: () {
        navigateTo();
      },
      child: Text(
        text,
        style: TextStyle(
          color: AssetColors.backgroundColor,
          fontSize: 17.0,
        ),
      ),
    );
  }
}
