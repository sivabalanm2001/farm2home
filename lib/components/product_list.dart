import 'dart:convert';
import 'package:farm_2_home/components/product_data_model.dart';
import 'package:farm_2_home/components/product_database.dart';
import 'package:farm_2_home/screens/my_cart_screen/my_cart_data_model.dart';
import 'package:flutter/services.dart' as root_bundle;
import 'package:flutter/material.dart';
import 'add_to_cart_button.dart';
import 'added_to_cart_button.dart';
import 'assets_colors.dart';
import 'assets_images.dart';

class ProductList extends StatefulWidget {
  const ProductList({
    super.key,
  });

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  bool onClick = true;
  int count = 0;
  Future<List<ProductDataModel>> readJsonData() async {
    String jsonData =
        await root_bundle.rootBundle.loadString('assets/product_list.json');
    final list = json.decode(jsonData) as List<dynamic>;
    return list.map((e) => ProductDataModel.fromJson(e)).toList();
  }

  List productData = [];
  @override
  void initState() {
    loadCartProduct();
    super.initState();
  }

  loadCartProduct() async {
    productData = await readJsonData();
    setState(() {});
  }

  bool _isAdded(int count) => count > 0;
  late CartDataModel product;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      primary: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: productData.length,
      separatorBuilder: (BuildContext context, int index) => const Divider(
        thickness: 2.0,
        height: 0,
      ),
      itemBuilder: (BuildContext context, int index) {
        ProductDataModel item = productData[index];
        return productContainer(context, item);
      },
    );
  }

  Widget productContainer(BuildContext context, ProductDataModel item) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 5,
                child: productImage(context, item),
              ),
              SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.036,
              ),
              Expanded(
                flex: 7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    productOfferContainer(item),
                    productName(item),
                    farmName(item),
                    productDescription(item),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Row(
                    children: [
                      productQuantity(item),
                      const SizedBox(
                        width: 16.0,
                      ),
                      productPrice(item),
                      const SizedBox(
                        width: 8.0,
                      ),
                      productOfferPrice(item),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child:
                      _isAdded(item.productCount!) && item.isProductAvailable!
                          ? AddedToCartButton(
                              count: item.productCount!,
                              onDecrement: () {
                                setState(() {
                                  item.productCount = item.productCount! - 1;
                                });
                              },
                              onIncrement: () {
                                setState(() {
                                  item.productCount = item.productCount! + 1;
                                });
                              },
                            )
                          : AddToCart(
                              buttonColor: item.isProductAvailable!
                                  ? AssetColors.cartButtonColor
                                  : AssetColors.bottomBorderColor,
                              text: item.isProductAvailable!
                                  ? 'Add to Cart'
                                  : 'Out of Stock',
                              onClick: () async {
                                final CartDataModel model = CartDataModel(
                                  farmName: item.farmName,
                                  productId: item.productId,
                                  productCount: count,
                                  productName: item.productName,
                                  productOfferPrice: item.productOfferPrice,
                                  productPrice: item.productPrice,
                                  productQuantity: item.productQuantity,
                                );

                                await ProductDatabaseHelper.addProduct(model);

                                setState(() {
                                  item.productCount = 1;
                                });
                              },
                            ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget productOfferContainer(item) {
    return SizedBox(
      child: Stack(
        children: [
          if (item.isDealAvailable! && item.isOfferAvailable!)
            SizedBox(
              height: 25.0,
              width: 200.0,
              child: Stack(
                children: [
                  Stack(
                    children: [
                      Positioned(
                        right: 10,
                        child: SizedBox(
                          height: 24.0,
                          child: Image.asset(Images.redBookmarkImage),
                        ),
                      ),
                      Positioned(
                        right: 25,
                        child: Padding(
                          padding: const EdgeInsets.all(2.5),
                          child: Text(
                            item.offerPercentage.toString(),
                            style: TextStyle(
                                color: AssetColors.backgroundColor,
                                fontSize: 13.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 24.0,
                    child: Image.asset(Images.bookmarkImage),
                  ),
                  Positioned(
                    left: 8,
                    top: 2,
                    child: Text(
                      'Deal of the Day',
                      style: TextStyle(
                          color: AssetColors.backgroundColor, fontSize: 13.0),
                    ),
                  ),
                ],
              ),
            )
          else if (item.isOfferAvailable!)
            Stack(
              children: [
                SizedBox(
                  height: 24.0,
                  child: Image.asset(Images.redBookmarkImage),
                ),
                Positioned(
                  left: 10,
                  child: Padding(
                    padding: const EdgeInsets.all(2.5),
                    child: Text(
                      item.offerPercentage.toString(),
                      style: TextStyle(
                          color: AssetColors.backgroundColor, fontSize: 13.0),
                    ),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }

  Widget productOfferPrice(item) {
    return Text(
      item.productOfferPrice.toString(),
      style: TextStyle(
        color: AssetColors.secondaryTextColor,
        fontSize: 16.0,
      ),
    );
  }

  Widget productPrice(item) {
    return Text(
      item.productPrice.toString(),
      style: TextStyle(
        decoration: TextDecoration.lineThrough,
        color: AssetColors.secondaryTextColor,
        fontSize: 16.0,
      ),
    );
  }

  Widget productQuantity(item) {
    return Text(
      item.productQuantity.toString(),
      style: TextStyle(
        color: AssetColors.secondaryTextColor,
        fontSize: 16.0,
      ),
    );
  }

  Widget productDescription(item) {
    return SizedBox(
      child: Text(
        item.productDescription.toString(),
        textDirection: TextDirection.ltr,
        style: TextStyle(
          fontSize: 13.9,
          color: AssetColors.secondaryTextColor,
        ),
      ),
    );
  }

  Widget farmName(item) {
    return Text(
      item.farmName.toString(),
      style: TextStyle(fontSize: 14.5, color: AssetColors.secondaryTextColor),
    );
  }

  Widget productName(item) {
    return Text(
      item.productName.toString(),
      style: TextStyle(fontSize: 16.0, color: AssetColors.primaryTextColor),
    );
  }

  Widget productImage(BuildContext context, ProductDataModel item) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(8.0),
        ),
      ),
      height: MediaQuery.of(context).size.height * 0.19,
      width: MediaQuery.of(context).size.width * 0.366,
      child: Image.asset(
        item.productImage.toString(),
        fit: BoxFit.cover,
      ),
    );
  }
}
