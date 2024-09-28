import 'package:flutter/material.dart';
import '../../components/assets_colors.dart';
import '../../components/assets_images.dart';
import '../../components/bottom_navigation_bar.dart';
import '../../components/primary_app_bar.dart';
import '../../components/product_filters_feature.dart';
import '../../components/product_list.dart';
import '../../components/product_search_bar.dart';
import '../../components/vertical_spacing.dart';
import '../categories_screen/categories_screen.dart';

class FarmScreen extends StatefulWidget {
  const FarmScreen({super.key});
  @override
  State<FarmScreen> createState() => _FarmScreenState();
}

class _FarmScreenState extends State<FarmScreen> {
  final List<String> farmImage = [
    Images.georgImage1,
    Images.georgImage2,
    Images.georgImage3,
    Images.georgImage4,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PrimaryAppBar(),
      backgroundColor: AssetColors.backgroundColor,
      body: DefaultTabController(
        length: 3,
        initialIndex: 0,
        child: NestedScrollView(
          headerSliverBuilder: (context, isScrolled) {
            return [
              SliverAppBar(
                backgroundColor: AssetColors.backgroundColor,
                collapsedHeight: 270,
                expandedHeight: 200,
                flexibleSpace: Column(
                  children: [
                    verticalSpacing(context),
                    farmHeading(context),
                    verticalSpacing(context),
                    farmDescription(
                        'George Farm is 100 % certified organic and pure cow milk which is of high quality. Our cows are fed on home grown organic fodder and cattle feed...more'),
                    verticalSpacing(context),
                    farmImages(),
                  ],
                ),
              ),
              SliverPersistentHeader(
                delegate: MyDelegate(
                  TabBar(
                    isScrollable: true,
                    indicatorColor: AssetColors.cartButtonColor,
                    indicatorWeight: 4,
                    labelColor: AssetColors.primaryTextColor,
                    unselectedLabelColor: AssetColors.secondaryTextColor,
                    tabs: <Widget>[
                      productTab('Dairy'),
                      productTab('Poultry'),
                      productTab('Seafood'),
                    ],
                  ),
                ),
                floating: true,
                pinned: true,
              )
            ];
          },
          body: tabBarView(context),
        ),
      ),
      bottomNavigationBar: AppBottomNavigationBar(
          index: 2,
          navigateTo: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return const CategoriesScreen();
              },
            ));
          }),
    );
  }

  Widget farmHeading(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          farmLogo(context, Images.georgeLogo),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.03,
          ),
          farmName('George Farm', 'Dairy   l   Poultry   l   Seafood'),
        ],
      ),
    );
  }

  Widget tabBarView(BuildContext context) {
    return TabBarView(
      children: [
        Column(
          children: [
            verticalSpacing(context),
            const ProductSearchBar(
              searchContent: 'Search Dairy Products from George Farm',
            ),
            verticalSpacing(context),
            const ProductFilterAndFeature(),
            const Expanded(child: ProductList()),
          ],
        ),
        Column(
          children: [
            verticalSpacing(context),
            const ProductSearchBar(
              searchContent: 'Search Poultry Products from George Farm',
            ),
            verticalSpacing(context),
            const ProductFilterAndFeature(),
            const Expanded(child: ProductList()),
          ],
        ),
        Column(
          children: [
            verticalSpacing(context),
            const ProductSearchBar(
              searchContent: 'Search Seafood Products from George Farm',
            ),
            verticalSpacing(context),
            const ProductFilterAndFeature(),
            const Expanded(child: ProductList()),
          ],
        )
      ],
    );
  }

  Widget productTab(tabName) {
    return Tab(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.28,
        child: Center(
          child: Text(
            tabName,
            style: const TextStyle(fontSize: 17.0),
          ),
        ),
      ),
    );
  }

  Widget farmImages() {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 15.0),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.109,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: farmImage.length,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.12,
                  width: MediaQuery.of(context).size.width * 0.23,
                  child: Image(
                    image: AssetImage(farmImage[index]),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget farmDescription(text) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
      child: Text(text,
          style: TextStyle(
            fontSize: 13.8,
            color: AssetColors.secondaryTextColor,
          )),
    );
  }

  Widget farmName(text, farmProducts) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(text,
            style: TextStyle(
              fontSize: 20.0,
              color: AssetColors.primaryTextColor,
            )),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.005,
        ),
        Text(farmProducts,
            style: TextStyle(
              fontSize: 15.0,
              color: AssetColors.secondaryTextColor,
            )),
      ],
    );
  }

  Widget farmLogo(BuildContext context, image) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.10,
      width: MediaQuery.of(context).size.height * 0.10,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        border: Border.all(color: AssetColors.primaryTextColor),
      ),
      child: Image(
        image: AssetImage(image),
      ),
    );
  }
}

class MyDelegate extends SliverPersistentHeaderDelegate {
  MyDelegate(this.productTabBar);
  final TabBar productTabBar;
  @override
  Widget build(context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: AssetColors.backgroundColor,
      child: productTabBar,
    );
  }

  @override
  double get maxExtent => productTabBar.preferredSize.height;

  @override
  double get minExtent => productTabBar.preferredSize.height;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}

