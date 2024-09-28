class CartDataModel {
  int? productId;
  String? productName;
  String? farmName;
  String? productQuantity;
  String? productPrice;
  String? productOfferPrice;
  int? productCount;
  CartDataModel({
    this.productId,
    this.productName,
    this.farmName,
    this.productQuantity,
    this.productPrice,
    this.productOfferPrice,
    this.productCount,
  });

  CartDataModel.fromJson(Map<String, dynamic> json) {
    productId = json['productId'] ?? 0;
    productName = json['productName'];
    farmName = json['farmName'];
    productQuantity = json['productQuantity'];
    productPrice = json['productPrice'];
    productOfferPrice = json['productOfferPrice'];
    productCount = json['productCount'] ?? 0;
  }

  Map<String, dynamic> toJson() => {
        "productId": productId,
        "productName": productName,
        "farmName": farmName,
        "productQuantity": productQuantity,
        "productPrice": productPrice,
        "productOfferPrice": productOfferPrice,
        "productCount": productCount,
      };
}
