import 'package:farm_2_home/screens/categories_screen/categories_screen.dart';
import 'package:flutter/material.dart';
import '../../components/assets_colors.dart';
import '../../components/assets_images.dart';
import '../../components/bottom_navigation_bar.dart';
import '../../components/primary_app_bar.dart';
import '../../components/product_filters_feature.dart';
import '../../components/product_list.dart';
import '../../components/product_search_bar.dart';
import '../../components/vertical_spacing.dart';
import '../farm_screen/george_farm_screen.dart';

class ProductCategoriesPage extends StatefulWidget {
  const ProductCategoriesPage({super.key});

  @override
  State<ProductCategoriesPage> createState() => _ProductCategoriesPageState();
}

class _ProductCategoriesPageState extends State<ProductCategoriesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PrimaryAppBar(),
      backgroundColor: AssetColors.backgroundColor,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            verticalSpacing(context),
            bodyTitle('Dairy Products'),
            verticalSpacing(context),
            productBanner(context),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.018,
            ),
            const ProductSearchBar(searchContent: 'Search Dairy Products'),
            verticalSpacing(context),
            const ProductFilterAndFeature(),
            const ProductList(),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const FarmScreen()),
                );
              },
              child: const Text('Next Page'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: AppBottomNavigationBar(
          index: 0,
          navigateTo: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return const CategoriesScreen();
              },
            ));
          }),
    );
  }

  Widget bodyTitle(title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w600,
                color: AssetColors.primaryTextColor),
          ),
        ],
      ),
    );
  }

  Widget productBanner(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
        ),
        height: MediaQuery.of(context).size.height * 0.158,
        width: MediaQuery.of(context).size.width * 0.95,
        child: Image.asset(
          Images.dairyProductsImage,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
