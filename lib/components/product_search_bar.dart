import 'package:farm_2_home/components/assets_colors.dart';
import 'package:flutter/material.dart';

import 'assets_images.dart';

class ProductSearchBar extends StatelessWidget {
  final String searchContent;
  const ProductSearchBar({
    required this.searchContent,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SizedBox(
          height: 48.0,
          child: TextField(
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(color: AssetColors.secondaryTextColor),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(color: AssetColors.cartButtonColor),
              ),
              contentPadding: const EdgeInsets.symmetric(vertical: 14.0),
              hintText: searchContent,
              prefixIcon: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: ImageIcon(
                  AssetImage(Images.searchIcon),
                  color: AssetColors.secondaryTextColor,
                ),
              ),
            ),
          ),
        ));
  }
}
