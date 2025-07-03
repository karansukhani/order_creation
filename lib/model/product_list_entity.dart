import 'dart:convert';

import 'package:order_creation/generated/json/base/json_field.dart';
import 'package:order_creation/generated/json/product_list_entity.g.dart';

export 'package:order_creation/generated/json/product_list_entity.g.dart';

@JsonSerializable()
class ProductListEntity {
  @JSONField(name: "GetProductsResult")
  List<ProductListGetProductsResult>? getProductsResult = [];

  ProductListEntity();

  factory ProductListEntity.fromJson(Map<String, dynamic> json) => $ProductListEntityFromJson(json);

  Map<String, dynamic> toJson() => $ProductListEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class ProductListGetProductsResult {
  @JSONField(name: "BarCode")
  String? barCode = '';
  @JSONField(name: "CreatedDate")
  String? createdDate = '';
  @JSONField(name: "Deleted")
  bool? deleted = false;
  @JSONField(name: "Id")
  int? id = 0;
  @JSONField(name: "IsSpecialOfferSelected")
  bool? isSpecialOfferSelected = false;
  @JSONField(name: "IsWeight")
  bool? isWeight = false;
  @JSONField(name: "ModifiedDate")
  String? modifiedDate = '';
  @JSONField(name: "Name")
  String? name = '';
  @JSONField(name: "NominalCode")
  String? nominalCode = '';
  @JSONField(name: "PackSize")
  int? packSize = 0;
  @JSONField(name: "Price")
  double? price;
  @JSONField(name: "ProductCategory")
  String? productCategory = '';
  @JSONField(name: "ProductCode")
  String? productCode = '';
  @JSONField(name: "ProductVatId")
  int? productVatId = 0;

  ProductListGetProductsResult();

  factory ProductListGetProductsResult.fromJson(Map<String, dynamic> json) =>
      $ProductListGetProductsResultFromJson(json);

  Map<String, dynamic> toJson() => $ProductListGetProductsResultToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
