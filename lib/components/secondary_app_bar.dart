import 'package:farm_2_home/components/assets_images.dart';
import 'package:flutter/material.dart';

import 'assets_colors.dart';

class SecondaryAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String text;
  const SecondaryAppBar({
    super.key,

    required this.text,
  });

  @override
  State<SecondaryAppBar> createState() => _SecondaryAppBarState();

  @override
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _SecondaryAppBarState extends State<SecondaryAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: ImageIcon(
          AssetImage(Images.leftArrowIcon),
          color: AssetColors.primaryTextColor,
        ),
      ),
      title: Text(
        widget.text,
        style: TextStyle(
          fontSize: 20,
          color: AssetColors.primaryTextColor,
        ),
      ),
    );
  }
}
