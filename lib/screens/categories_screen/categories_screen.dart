import 'package:farm_2_home/components/assets_colors.dart';
import 'package:farm_2_home/components/assets_images.dart';
import 'package:farm_2_home/components/primary_app_bar.dart';
import 'package:farm_2_home/components/vertical_spacing.dart';
import 'package:farm_2_home/screens/address_screen/my_address.dart';
import 'package:farm_2_home/screens/products_category_screen/dairy_product_page.dart';
import 'package:flutter/material.dart';
import '../../components/bottom_navigation_bar.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    List<String> catergoryProduct = [
      'Dairy',
      'Poultry',
      'Seafood',
      'Vegetables',
      'Fresh Fruits',
      'Flowers',
    ];
    final List<String> catergoryImage = [
      Images.dairy,
      Images.poultry,
      Images.seafood,
      Images.vegetable,
      Images.freshFruits,
      Images.flowers,
    ];
    return Scaffold(
      appBar: const PrimaryAppBar(),
      backgroundColor: AssetColors.backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              titleText(),
              verticalSpacing(context),
              categoriesGridView(catergoryImage, catergoryProduct)
            ],
          ),
        ),
      ),
      bottomNavigationBar: AppBottomNavigationBar(
          index: 0,
          navigateTo: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return const MyAddress();
              },
            ));
          }),
    );
  }

  Widget categoriesGridView(
    List<String> catergoryImage,
    List<String> catergoryProduct,
  ) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: catergoryImage.length,
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 184,
        mainAxisSpacing: 16,
        crossAxisSpacing: 14,
      ),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return const ProductCategoriesPage();
              },
            ));
          },
          child: categoryContainer(
            catergoryImage,
            index,
            context,
            catergoryProduct,
          ),
        );
      },
    );
  }

  Widget categoryContainer(
    List<String> catergoryImage,
    int index,
    BuildContext context,
    List<String> catergoryProduct,
  ) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        categoriesImage(catergoryImage, index),
        Container(
          height: MediaQuery.of(context).size.height * 0.042,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 5,
          ),
          color: AssetColors.cartButtonColor,
          child: Text(
            catergoryProduct[index],
            style: TextStyle(
              color: AssetColors.backgroundColor,
              fontSize: 17.0,
            ),
          ),
        ),
      ],
    );
  }

  Widget categoriesImage(
    List<String> catergoryImage,
    int index,
  ) {
    return Image(
      image: AssetImage(
        catergoryImage[index],
      ),
      fit: BoxFit.cover,
    );
  }

  Widget titleText() {
    return Text(
      'Categories',
      style: TextStyle(
        color: AssetColors.primaryTextColor,
        fontSize: 20.0,
      ),
    );
  }
}
