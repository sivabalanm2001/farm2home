class ProductDataModel {
  int? productId;
  String? productImage;
  String? productName;
  String? farmName;
  String? productDescription;
  String? productQuantity;
  String? productPrice;
  String? productOfferPrice;
  String? offerPercentage;
  int? productCount;
  bool? noOffer;
  bool? isProductAvailable;
  bool? isDealAvailable;
  bool? isOfferAvailable;

  ProductDataModel({
    this.productId,
    this.productImage,
    this.productName,
    this.farmName,
    this.productDescription,
    this.productQuantity,
    this.productPrice,
    this.productOfferPrice,
    this.offerPercentage,
    this.productCount,
    this.noOffer,
    this.isProductAvailable,
    this.isDealAvailable,
    this.isOfferAvailable,
  });

  ProductDataModel.fromJson(Map<String, dynamic> json) {
    productId = json['productId'];
    productImage = json['productImage'];
    productName = json['productName'];
    farmName = json['farmName'];
    productDescription = json['productDescription'];
    productQuantity = json['productQuantity'];
    productPrice = json['productPrice'];
    productOfferPrice = json['productOfferPrice'];
    offerPercentage = json['offerPercentage'];
    productCount = json['productCount'] ?? 0;
    noOffer = json['noOffer'];
    isProductAvailable = json['isProductAvailable'];
    isDealAvailable = json['isDealAvailable'];
    isOfferAvailable = json['isOfferAvailable'];
  }
}
