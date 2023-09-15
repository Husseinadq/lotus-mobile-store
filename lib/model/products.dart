// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:louts_mobile_store/model/photo.dart';


class Products {
  bool? _status;
  String? _statusNumber;
  String? _message;
  List<ProductsItem>? _items;
  List<ProductsItem> get items => _items!;
  ProductsModel({
    required status,
    required statusNumber,
    required message,
    required items,
  }) {
    this._status = status;
    this._statusNumber = statusNumber;
    this._message = message;
    this._items = items;
  }

//

  Products.fromJson(Map<String, dynamic> json) {
    _status = json['status'];
    _statusNumber = json['statusNumber'];
    _message = json['message'];
    if (json['items'] != null) {
      print("object ${json['items']}");
      _items = <ProductsItem>[];
      json['items'].forEach((v) {
        _items?.add(ProductsItem.fromJson(v));
      });
    }
  }
}

class ProductsItem {
  int? id;
  List<Photo>? productImages;
  int? categoryId;
  String? name;
  double? price;
  int? brandId;
  double? discount;
  int? supplierId;
  String? description;
  // List<String>? specifications;
  ProductsItem({
    this.id,
    this.productImages,
    this.categoryId,
    this.name,
    this.price,
    this.brandId,
    this.discount,
    this.supplierId,
    this.description,
    // this.specifications,
  });

  // Map<String, dynamic> toMap() {
  //   return <String, dynamic>{
  //     'id': id,
  //     'productImages': productImages,
  //     'productCategoryId': productCategoryId,
  //     'name': name,
  //     'price': price,
  //     'productBrand': productBrand?.toMap(),
  //     'discount': discount,
  //     'supplier': supplier?.toMap(),
  //     'description': description,
  //     'specifications': specifications,
  //   };
  // }

  ProductsItem.fromJson(Map<String, dynamic> json) {
    // _photos = <ProductsItem>[];

    // return ProductsItem(
    id = json['id'];
    productImages = <Photo>[];
    json['photo'].forEach((element) {
      productImages!.add(Photo.fromJson(element));
    });
    categoryId = json['category_id'];
    name = json['name'];
    price = json['price'];
    brandId = json['brand_id'];
    discount =double.parse( json['discount'].toString());
    supplierId = json['supplier_id'];
    description = json['description'];
    // specifications: List<String>.from(json['specifications'] as List<String>),
    // );
  }

  // String toJson() => json.encode(toMap());

  // factory ProductsItem.fromJson(String source) => ProductsItem.fromMap(json.decode(source) as Map<String, dynamic>);
}
