import 'package:farm_2_home/components/assets_colors.dart';
import 'package:farm_2_home/screens/categories_screen/categories_screen.dart';
import 'package:farm_2_home/screens/login_screen/login_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const FarmToHome());
}

class FarmToHome extends StatelessWidget {
  const FarmToHome({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeData(),
      home: const LoginScreen(),
    );
  }

  themeData() {
    return ThemeData(
      fontFamily: 'open sans',
      inputDecorationTheme: InputDecorationTheme(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
            color: AssetColors.cartButtonColor,
          ),
        ),
      ),
    );
  }
}
