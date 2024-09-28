import 'package:flutter/material.dart';
import 'assets_colors.dart';
import 'assets_images.dart';

class AppBottomNavigationBar extends StatelessWidget {
  final int index;
  final Function navigateTo;

  const AppBottomNavigationBar({
    required this.index,
    super.key,
    required this.navigateTo,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: AssetColors.borderColor,
        ),
      ),
      child: BottomNavigationBar(
        backgroundColor: AssetColors.backgroundColor,
        currentIndex: index,
        unselectedItemColor: AssetColors.primaryTextColor,
        selectedItemColor: AssetColors.cartButtonColor,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          _navigationBarItem(Images.menuIcon, 'Catergories', context),
          _navigationBarItem(Images.searchIcon, 'QuickSearch', context),
          _navigationBarItem(Images.homeIcon, 'Home', context),
          _navigationBarItem(Images.listIcon, 'Orders', context),
          _navigationBarItem(Images.userIcon, 'Accounts', context),
        ],
      ),
    );
  }

  BottomNavigationBarItem _navigationBarItem(
      String image, String text, context) {
    return BottomNavigationBarItem(
      icon: GestureDetector(
        onTap: () {
          navigateTo();
        },
        child: ImageIcon(
          AssetImage(image),
        ),
      ),
      label: text,
    );
  }
}
