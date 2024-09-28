import 'package:farm_2_home/components/product_database.dart';
import 'package:farm_2_home/screens/login_popup/login_popup.dart';
import 'package:flutter/material.dart';
import '../../components/added_to_cart_button.dart';
import '../../components/assets_colors.dart';
import '../../components/assets_images.dart';
import 'my_cart_data_model.dart';

class MyCartScreen extends StatefulWidget {
  const MyCartScreen({super.key});
  @override
  State<MyCartScreen> createState() => _MyCartScreenState();
}

class _MyCartScreenState extends State<MyCartScreen> {
  int? noOfProducts;
  double totalAmount = 0.0;
  double totalSaving = 0.0;
  List productData = [];
  // Database? productDatabase;
  // @override
  // void initState() {
  //   loadCartProduct();
  //   super.initState();
  // }

  // loadCartProduct() async {
  //   // productData = await readJsonData();
  //   setState(() {});
  //   getTotalAmount();
  //   getTotalSavings();
  // }

  getTotalAmount() {
    for (var element in productData) {
      totalAmount = totalAmount + double.parse(element.productOfferPrice);
    }
    return totalAmount;
  }

  getTotalSavings() {
    for (var element in productData) {
      if (element.productPrice != '0') {
        totalSaving = totalSaving +
            (double.parse(element.productPrice) -
                double.parse(element.productOfferPrice));
      }
    }
    return totalAmount;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      backgroundColor: AssetColors.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            myCartHeader(),
            cartProductList(),
            totalAmountContainer(context),
            bottomTotalAmountContainer(context),
          ],
        ),
      ),
    );
  }

  Widget bottomTotalAmountContainer(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.102,
      decoration: BoxDecoration(
        color: AssetColors.darkBlueColor,
        border: Border.symmetric(
          horizontal: BorderSide(
            color: AssetColors.bottomBorderColor,
            width: 0,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Total: ${(totalAmount < 0) ? totalAmount = 0 : totalAmount.toStringAsFixed(3)} KD',
                    style: TextStyle(
                      color: AssetColors.backgroundColor,
                      fontSize: 20.0,
                    ),
                  ),
                  Text(
                    'Additional charges may apply.',
                    style: TextStyle(
                      color: AssetColors.bottomBorderColor,
                      fontSize: 15.0,
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                if (productData.isNotEmpty) {
                  loginAlter(context);
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: (productData.isEmpty)
                      ? AssetColors.bottomBorderColor
                      : AssetColors.cartButtonColor,
                ),
                height: MediaQuery.of(context).size.height * 0.058,
                width: MediaQuery.of(context).size.width * 0.32,
                child: Center(
                  child: Text(
                    'Checkout',
                    style: TextStyle(
                      color: AssetColors.backgroundColor,
                      fontSize: 15.0,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget totalAmountContainer(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.121,
      decoration: BoxDecoration(
        color: AssetColors.blueBackground,
        border: Border.symmetric(
          horizontal: BorderSide(
            color: AssetColors.bottomBorderColor,
            width: 0,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total Amount',
                  style: TextStyle(
                    color: AssetColors.darkBlueColor,
                    fontSize: 20.0,
                  ),
                ),
                Text(
                  '  ${(totalAmount < 0) ? totalAmount = 0 : totalAmount.toStringAsFixed(3)} KD',
                  style: TextStyle(
                    color: AssetColors.darkBlueColor,
                    fontSize: 20.0,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total Savings',
                  style: TextStyle(
                    color: AssetColors.secondaryTextColor,
                    fontSize: 17.0,
                  ),
                ),
                Text(
                  '${(totalSaving < 0) ? totalSaving = 0 : totalSaving.toStringAsFixed(3)} KD',
                  style: TextStyle(
                    color: AssetColors.secondaryTextColor,
                    fontSize: 17.0,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget cartProductList() {
    return FutureBuilder(
      future: ProductDatabaseHelper.getAllProducts(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text("${snapshot.error}");
        } else if (snapshot.hasData) {
          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: productData.length,
            itemBuilder: (BuildContext context, int index) {
              CartDataModel item = productData[index];
              return Column(
                children: [
                  productContainer(context, item),
                ],
              );
            },
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }

  Widget productContainer(BuildContext context, CartDataModel item) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.128,
      decoration: BoxDecoration(
        border: Border.symmetric(
          horizontal: BorderSide(
            color: AssetColors.borderColor,
            width: 0,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 12.0,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    productName(item),
                    productFarmName(item),
                  ],
                ),
                AddedToCartButton(
                  count: item.productCount!,
                  onDecrement: () {
                    onDecrement(item);
                  },
                  onIncrement: () {
                    onIncrement(item);
                  },
                ),
              ],
            ),
            productQuantityAndPrice(item, context)
          ],
        ),
      ),
    );
  }

  onDecrement(CartDataModel item) {
    return setState(
      () {
        item.productCount = item.productCount! - 1;

        if (item.productCount == 0) {
          productData.removeWhere(
            (element) {
              return element.productId == item.productId;
            },
          );
        }

        totalAmount = (totalAmount - (double.parse(item.productOfferPrice!)));

        if (item.productPrice != '0') {
          totalSaving = (totalSaving -
              (double.parse(
                    item.productPrice!,
                  ) -
                  double.parse(item.productOfferPrice!)));
        }
      },
    );
  }

  onIncrement(CartDataModel item) {
    return setState(
      () {
        item.productCount = item.productCount! + 1;

        totalAmount = (totalAmount + (double.parse(item.productOfferPrice!)));

        if (item.productPrice != '0') {
          totalSaving = (totalSaving +
              (double.parse(
                    item.productPrice!,
                  ) -
                  double.parse(item.productOfferPrice!)));
        }
      },
    );
  }

  Widget productFarmName(CartDataModel item) {
    return Text(
      item.farmName.toString(),
      style: TextStyle(
        fontSize: 15.0,
        color: AssetColors.primaryTextColor,
      ),
    );
  }

  Widget productName(CartDataModel item) {
    return Text(
      item.productName.toString(),
      style: TextStyle(
        fontSize: 17.0,
        color: AssetColors.primaryTextColor,
      ),
    );
  }

  Widget productQuantityAndPrice(CartDataModel item, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        productQuantity(item),
        Row(
          children: [
            productPrice(item),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.020,
            ),
            productOfferPrice(item)
          ],
        )
      ],
    );
  }

  Widget productOfferPrice(CartDataModel item) {
    return Text(
      '${item.productOfferPrice.toString()} KD',
      style: TextStyle(
        fontSize: 17.0,
        color: AssetColors.primaryTextColor,
      ),
    );
  }

  Widget productPrice(CartDataModel item) {
    return Text(
      (item.productPrice == '0') ? '' : '${item.productPrice.toString()} KD',
      style: TextStyle(
        decoration: TextDecoration.lineThrough,
        fontSize: 17.0,
        color: AssetColors.secondaryTextColor,
      ),
    );
  }

  Widget productQuantity(CartDataModel item) {
    return Text(
      item.productQuantity.toString(),
      style: TextStyle(
        fontSize: 17.0,
        color: AssetColors.secondaryTextColor,
      ),
    );
  }

  Widget myCartHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 12.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'My Cart',
            style: TextStyle(
              fontSize: 20.0,
              color: AssetColors.primaryTextColor,
            ),
          ),
          noOfItems(),
        ],
      ),
    );
  }

  Widget noOfItems() {
    return Text(
      '${productData.length} items',
      style: TextStyle(
        fontSize: 17.0,
        color: AssetColors.secondaryTextColor,
      ),
    );
  }

  AppBar appBar(context) {
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
    );
  }
}
