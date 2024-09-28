import 'package:farm_2_home/components/assets_colors.dart';
import 'package:farm_2_home/components/assets_images.dart';
import 'package:farm_2_home/components/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class MyAddress extends StatelessWidget {
  const MyAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: leftArrowIcon(),
        title: headerText('My Addresses'),
        backgroundColor: AssetColors.backgroundColor,
      ),
      backgroundColor: AssetColors.backgroundColor,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                mapBookImageIcon(),
                rowDivider(context),
                headerText('Enter Address Details'),
              ],
            ),
            columnDivider(context),
            textForm('Address Line 1 (House/Apartment Details)'),
            columnDivider(context),
            textForm('Address Line 2 (Street, Area Details)'),
            columnDivider(context),
            textForm('Address Line 3 (Landmark)'),
            columnDivider(context),
            Row(
              children: [
                Flexible(
                  child: dropDown(Images.downArrow, 'City'),
                ),
                rowDivider(context),
                Flexible(
                  child: textForm('Postal Code'),
                ),
              ],
            ),
            columnDivider(context),
            Row(
              children: [
                outlinedButton('Home'),
                rowDivider(context),
                outlinedButton('Office'),
                rowDivider(context),
                outlinedButton('Other')
              ],
            ),
            columnDivider(context),
            textForm('Nick name this address as'),
            columnDivider(context),
            Row(
              children: [
                cancelButton(),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.025,
                ),
                elevatedButton(),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: AppBottomNavigationBar(
        index: 4,
        navigateTo: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const MyAddress(),
            ),
          );
        },
      ),
    );
  }

  Text headerText(String text) {
    return Text(
      text,
      style: TextStyle(
        color: AssetColors.primaryTextColor,
        fontSize: 20.0,
      ),
    );
  }

  Widget mapBookImageIcon() {
    return ImageIcon(
      AssetImage(
        Images.mapIcon,
      ),
    );
  }

  Widget rowDivider(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.02,
    );
  }

  Widget cancelButton() {
    return TextButton(
      onPressed: () {},
      child: Text(
        'Cancel',
        textDirection: TextDirection.ltr,
        style: TextStyle(
          color: AssetColors.primaryTextColor,
          fontSize: 15,
        ),
      ),
    );
  }

  Widget columnDivider(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.020,
    );
  }

  Widget leftArrowIcon() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 18),
      child: InkWell(
        onTap: () {},
        child: ImageIcon(
          AssetImage(
            Images.leftArrowIcon,
          ),
          color: AssetColors.primaryTextColor,
        ),
      ),
    );

    // IconButton(
    //   onPressed: () {},
    //   icon: ImageIcon(
    //     AssetImage(Images.leftArrowIcon),
    //     size: 20.0,
    //     color: const Color.fromRGBO(65, 81, 98, 1),
    //   ),
    // );
  }

  Widget elevatedButton() {
    return ElevatedButton(
      onPressed: () {},
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(AssetColors.cartButtonColor),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 80),
        child: Text(
          'Save Address',
          style: TextStyle(
            color: AssetColors.backgroundColor,
            fontSize: 15,
          ),
        ),
      ),
    );
  }

  Widget outlinedButton(String text) {
    return OutlinedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(AssetColors.borderColor),
        padding: const MaterialStatePropertyAll(
          EdgeInsets.symmetric(horizontal: 25.0),
        ),
        side: MaterialStatePropertyAll(
          BorderSide(color: AssetColors.bottomBorderColor),
        ),
      ),
      onPressed: () {},
      child: Text(
        text,
        style: TextStyle(
          color: AssetColors.secondaryTextColor,
          fontSize: 15,
        ),
      ),
    );
  }

  Widget textForm(String text) {
    return TextFormField(
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        hintText: text,
        hintStyle: TextStyle(
          fontSize: 15,
          color: AssetColors.secondaryTextColor,
        ),
      ),
    );
  }

  Widget dropDown(String assetmanager, String text) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: AssetColors.borderColor),
          borderRadius: BorderRadius.circular(5)),
      padding: const EdgeInsets.all(6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'City',
              style: TextStyle(fontSize: 15),
              textDirection: TextDirection.ltr,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 60),
          ),
          IconButton(
            onPressed: () {},
            icon: ImageIcon(
              AssetImage(assetmanager),
              size: 20.0,
              color: AssetColors.primaryTextColor,
            ),
          ),
        ],
      ),
    );
  }
}
