import 'package:farm_2_home/screens/my_cart_screen/my_cart_screen.dart';
import 'package:flutter/material.dart';
import 'assets_colors.dart';
import 'assets_images.dart';

class PrimaryAppBar extends StatelessWidget implements PreferredSizeWidget {
  const PrimaryAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AssetColors.backgroundColor,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: ImageIcon(
          AssetImage(Images.leftArrowIcon),
          color: AssetColors.primaryTextColor,
        ),
      ),
      actions: [
        Stack(
          children: [
            IconButton(
              onPressed: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context) => ,));
              },
              icon: ImageIcon(
                AssetImage(Images.bellIcon),
                color: AssetColors.primaryTextColor,
              ),
            ),
            appBarIconNotification(
              context,
              AssetColors.bellIconNotificationBackground,
              3,
              AssetColors.backgroundColor,
            ),
          ],
        ),
        Stack(
          children: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MyCartScreen(),
                  ),
                );
              },
              icon: ImageIcon(
                AssetImage(Images.shoppingBasketIcon),
                color: AssetColors.primaryTextColor,
              ),
            ),
            appBarIconNotification(
              context,
              AssetColors.cartButtonColor,
              6,
              AssetColors.backgroundColor,
            ),
          ],
        ),
      ],
    );
  }

  Widget appBarIconNotification(
      BuildContext context, backgroundColor, text, textColor) {
    return Positioned(
      right: 6,
      top: 10,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: backgroundColor,
        ),
        height: MediaQuery.of(context).size.height * 0.022,
        width: MediaQuery.of(context).size.height * 0.022,
        child: Center(
          child: Text(
            "$text",
            style: TextStyle(
              color: textColor,
              fontSize: 10.0,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
