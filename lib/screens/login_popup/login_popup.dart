import 'package:flutter/material.dart';
import '../../components/assets_colors.dart';
import '../../components/product_filters_feature.dart';
import '../login_screen/login_screen.dart';
import '../register_screen/register_screen.dart';

Future<dynamic> loginAlter(context) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shadowColor: AssetColors.dailogBackground,
          insetPadding: const EdgeInsets.symmetric(horizontal: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.28,
            width: MediaQuery.of(context).size.width * 0.89,
            padding: const EdgeInsets.symmetric(horizontal: 28.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.06,
                  width: MediaQuery.of(context).size.width * 0.55,
                  child: Text(
                    'Create an account with us to place your order.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 17.0,
                      color: AssetColors.primaryTextColor,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 17.5,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RegisterScreen(),
                      ),
                    );
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.92,
                    height: MediaQuery.of(context).size.height * 0.07,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: AssetColors.cartButtonColor),
                    child: Center(
                      child: Text(
                        'Register',
                        style: TextStyle(
                          fontSize: 15.0,
                          color: AssetColors.backgroundColor,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    loginText('Existing User?', AssetColors.primaryTextColor),
                    Padding(
                      padding: const EdgeInsets.only(left: 4.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginScreen()),
                          );
                        },
                        child: loginText(
                          'Login Here',
                          AssetColors.cartButtonColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      });
}
