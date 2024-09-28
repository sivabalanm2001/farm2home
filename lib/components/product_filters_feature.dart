import 'package:farm_2_home/components/vertical_spacing.dart';
import 'package:flutter/material.dart';

import 'assets_colors.dart';
import 'assets_images.dart';

class ProductFilterAndFeature extends StatefulWidget {
  const ProductFilterAndFeature({super.key});

  @override
  State<ProductFilterAndFeature> createState() =>
      _ProductFilterAndFeatureState();
}

class _ProductFilterAndFeatureState extends State<ProductFilterAndFeature> {
  bool click = true;
  final List<String> productText = [
    'Milk',
    'Curd',
    'Eggs',
    'Butter',
    'Cheese',
    'Laban',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          productItemFilters(),
          const Padding(
            padding: EdgeInsets.only(right: 7.69),
          ),
          productItemFeature(),
        ],
      ),
    );
  }

  Widget productItemFeature() {
    return TextButton(
      style: ButtonStyle(
        padding: const MaterialStatePropertyAll(EdgeInsets.zero),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        side: MaterialStatePropertyAll(
          BorderSide(color: AssetColors.cartButtonColor),
        ),
        backgroundColor: MaterialStatePropertyAll(AssetColors.backgroundColor),
        fixedSize: MaterialStatePropertyAll(Size(
            MediaQuery.of(context).size.width * 0.28,
            MediaQuery.of(context).size.height * 0.051)),
      ),
      onPressed: () {},
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Image.asset(Images.sortIcon),
          ),
          Text(
            'Featured',
            style: TextStyle(
              fontSize: 15.0,
              color: AssetColors.primaryTextColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget productItemFilters() {
    return TextButton(
      style: ButtonStyle(
        padding: const MaterialStatePropertyAll(EdgeInsets.zero),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        side: MaterialStatePropertyAll(
          BorderSide(color: AssetColors.borderColor),
        ),
        backgroundColor: MaterialStatePropertyAll(AssetColors.backgroundColor),
        fixedSize: MaterialStatePropertyAll(Size(
            MediaQuery.of(context).size.width * 0.245,
            MediaQuery.of(context).size.height * 0.051)),
      ),
      onPressed: () {
        sortAndFilterBottomSheet();
      },
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                top: 12.0, bottom: 12.0, left: 12.0, right: 8.0),
            child: Image.asset(Images.filterIcon),
          ),
          Text(
            'Filters',
            style: TextStyle(
              fontSize: 15.0,
              color: AssetColors.primaryTextColor,
            ),
          ),
        ],
      ),
    );
  }

  sortAndFilterBottomSheet() {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.80,
          child: Scaffold(
            appBar: bottomSheetAppBar(context),
            backgroundColor: AssetColors.backgroundColor,
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Wrap(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      bottomsheetText('Sort By'),
                      verticalSpacing(context),
                      sortByButtons(),
                      verticalSpacing(context),
                      verticalSpacing(context),
                      bottomsheetText('Filter By'),
                      verticalSpacing(context),
                      subCategoryContainer(),
                      verticalSpacing(context),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          clearAllTextButton(),
                          applyButton(),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget sortByButtons() {
    return Wrap(
      children: <Widget>[
        chipBuild('Featured'),
        chipBuild('Price: Low To High'),
        chipBuild('Price: High To Low'),
      ],
    );
  }

  Widget chipBuild(text) {
    return Chip(
      labelPadding: const EdgeInsets.all(0),
      label: SizedBox(
        height: 40.0,
        child: StatefulBuilder(builder: (context, setState) {
          return TextButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  side: BorderSide(
                      color: (click == true)
                          ? AssetColors.cartButtonColor
                          : AssetColors.primaryTextColor,
                      width: 1.0),
                ),
              ),
              backgroundColor:
                  MaterialStatePropertyAll(AssetColors.backgroundColor),
            ),
            onPressed: () {
              setState(() {
                click = !click;
              });
            },
            child: Text(
              text,
              style: TextStyle(
                fontWeight:
                    (click == true) ? FontWeight.w600 : FontWeight.normal,
                color: AssetColors.primaryTextColor,
              ),
            ),
          );
        }),
      ),
      backgroundColor: AssetColors.backgroundColor,
    );
  }

  Widget subCategoryContainer() {
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            subCategoryTitleContainer(),
            subCategoryProducts(),
          ],
        ),
        Positioned(
          top: 35.0,
          left: 1.0,
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.025,
            width: MediaQuery.of(context).size.width * 0.345,
            child: ColoredBox(color: AssetColors.backgroundColor),
          ),
        ),
      ],
    );
  }

  Widget subCategoryProducts() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      decoration: BoxDecoration(
        border: Border.all(color: AssetColors.borderColor),
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(8.0),
          bottomLeft: Radius.circular(8.0),
          bottomRight: Radius.circular(8.0),
        ),
      ),
      height: MediaQuery.of(context).size.height * 0.25,
      width: MediaQuery.of(context).size.width * 0.92,
      child: GridView.builder(
          itemCount: productText.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 4,
          ),
          itemBuilder: (BuildContext context, int index) {
            return subCategoryProduct(index);
          }),
    );
  }

  Widget subCategoryProduct(int index) {
    return Row(
      children: [
        StatefulBuilder(builder: (context, setState) {
          return IconButton(
            onPressed: () {
              setState(() {
                click = !click;
              });
            },
            icon: Image(
              image: AssetImage(
                (click == true)
                    ? Images.unselectedCheckBox
                    : Images.selectedCheckBox,
              ),
              height: 20.0,
              width: 20.0,
            ),
          );
        }),
        Text(
          productText[index],
          style: TextStyle(color: AssetColors.primaryTextColor, fontSize: 15.0),
        )
      ],
    );
  }

  AppBar bottomSheetAppBar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: AssetColors.backgroundColor,
      title: bottomSheetAppBarTitle(),
      actions: [
        StatefulBuilder(builder: (context, setState) {
          return IconButton(
            onPressed: () {},
            icon: IconButton(
              onPressed: () {},
              icon: ImageIcon(
                AssetImage(Images.closeIcon),
                color: AssetColors.primaryTextColor,
              ),
            ),
          );
        })
      ],
    );
  }

  Widget bottomSheetAppBarTitle() {
    return Text(
      'Sort and Filter',
      style: TextStyle(
        color: AssetColors.primaryTextColor,
        fontSize: 20.0,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget subCategoryTitleContainer() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AssetColors.borderColor),
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(8.0),
          topLeft: Radius.circular(8.0),
        ),
      ),
      height: MediaQuery.of(context).size.height * 0.059,
      width: MediaQuery.of(context).size.width * 0.35,
      child: Center(
        child: Text(
          'Sub-Categories',
          style: TextStyle(
            color: AssetColors.primaryTextColor,
            fontSize: 17.0,
          ),
        ),
      ),
    );
  }

  Widget applyButton() {
    return ElevatedButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            AssetColors.cartButtonColor,
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          minimumSize: const MaterialStatePropertyAll(Size(280.0, 60.0))),
      onPressed: () {},
      child: Text(
        'Apply',
        style: TextStyle(
          color: AssetColors.backgroundColor,
          fontSize: 15.0,
        ),
      ),
    );
  }

  Widget clearAllTextButton() {
    return TextButton(
      style: const ButtonStyle(
        padding: MaterialStatePropertyAll(EdgeInsets.zero),
      ),
      onPressed: () {},
      child: Text(
        'Clear All',
        style: TextStyle(
          fontSize: 15.0,
          color: AssetColors.bellIconNotificationBackground,
        ),
      ),
    );
  }

  Widget bottomsheetText(text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 20.0,
        color: AssetColors.primaryTextColor,
      ),
    );
  }
}

Widget loginText(text, textColor) {
  return Text(
    text,
    style: TextStyle(
      color: textColor,
      fontSize: 15.0,
    ),
  );
}
