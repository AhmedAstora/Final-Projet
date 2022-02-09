
import 'dart:io';

class Product {
  String id;
  String imageUrl;
  String name;
  String category;
  String locationDetails;
  String descriptionProduct;
  String condition;
  num price;
  String priceType;
  String AdditionalDetails;
  num offerPrice;
  File imageToBeUpload;
  String idStore ;

  Product({
    this.id,
    this.imageUrl,
    this.name,
    this.category,
    this.locationDetails,
    this.descriptionProduct,
    this.condition,
    this.price,
    this.priceType,
    this.AdditionalDetails,
    this.offerPrice,
    this.imageToBeUpload,
    this.idStore,
  });

  Product.fromMap(Map<String, dynamic> map) {
    this.id = map['id'];
    this.name = map['name'];
    this.imageUrl = map['imageUrl'];
    this.category = map['category'];
    this.locationDetails = map['locationDetails'];
    this.descriptionProduct = map['descriptionProduct'];
    this.condition = map['condition'];
    this.price = map['price'];
    this.priceType = map['priceType'];
    this.AdditionalDetails = map['AdditionalDetails'];
    this.offerPrice = map['offerPrice'];
    this.idStore = map['idStore'];
  }

  toMap() {
    return {
      'name': this.name,
      'imageUrl': this.imageUrl,
      'category': this.category,
      'locationDetails': this.locationDetails,
      'descriptionProduct': this.descriptionProduct,
      'condition': this.condition,
      'price': this.price,
      'priceType': this.priceType,
      'AdditionalDetails': this.AdditionalDetails,
      'offerPrice': this.offerPrice,
      'idStore': this.idStore,
    };
  }
}
