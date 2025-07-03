import 'package:order_creation/generated/json/base/json_convert_content.dart';
import 'package:order_creation/model/product_list_entity.dart';

ProductListEntity $ProductListEntityFromJson(Map<String, dynamic> json) {
  final ProductListEntity productListEntity = ProductListEntity();
  final List<ProductListGetProductsResult>? getProductsResult = (json['GetProductsResult'] as List<dynamic>?)
      ?.map((e) => jsonConvert.convert<ProductListGetProductsResult>(e) as ProductListGetProductsResult)
      .toList();
  if (getProductsResult != null) {
    productListEntity.getProductsResult = getProductsResult;
  }
  return productListEntity;
}

Map<String, dynamic> $ProductListEntityToJson(ProductListEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['GetProductsResult'] = entity.getProductsResult?.map((v) => v.toJson()).toList();
  return data;
}

extension ProductListEntityExtension on ProductListEntity {
  ProductListEntity copyWith({
    List<ProductListGetProductsResult>? getProductsResult,
  }) {
    return ProductListEntity()..getProductsResult = getProductsResult ?? this.getProductsResult;
  }
}

ProductListGetProductsResult $ProductListGetProductsResultFromJson(Map<String, dynamic> json) {
  final ProductListGetProductsResult productListGetProductsResult = ProductListGetProductsResult();
  final String? barCode = jsonConvert.convert<String>(json['BarCode']);
  if (barCode != null) {
    productListGetProductsResult.barCode = barCode;
  }
  final String? createdDate = jsonConvert.convert<String>(json['CreatedDate']);
  if (createdDate != null) {
    productListGetProductsResult.createdDate = createdDate;
  }
  final bool? deleted = jsonConvert.convert<bool>(json['Deleted']);
  if (deleted != null) {
    productListGetProductsResult.deleted = deleted;
  }
  final int? id = jsonConvert.convert<int>(json['Id']);
  if (id != null) {
    productListGetProductsResult.id = id;
  }
  final bool? isSpecialOfferSelected = jsonConvert.convert<bool>(json['IsSpecialOfferSelected']);
  if (isSpecialOfferSelected != null) {
    productListGetProductsResult.isSpecialOfferSelected = isSpecialOfferSelected;
  }
  final bool? isWeight = jsonConvert.convert<bool>(json['IsWeight']);
  if (isWeight != null) {
    productListGetProductsResult.isWeight = isWeight;
  }
  final String? modifiedDate = jsonConvert.convert<String>(json['ModifiedDate']);
  if (modifiedDate != null) {
    productListGetProductsResult.modifiedDate = modifiedDate;
  }
  final String? name = jsonConvert.convert<String>(json['Name']);
  if (name != null) {
    productListGetProductsResult.name = name;
  }
  final String? nominalCode = jsonConvert.convert<String>(json['NominalCode']);
  if (nominalCode != null) {
    productListGetProductsResult.nominalCode = nominalCode;
  }
  final int? packSize = jsonConvert.convert<int>(json['PackSize']);
  if (packSize != null) {
    productListGetProductsResult.packSize = packSize;
  }
  final double? price = jsonConvert.convert<double>(json['Price']);
  if (price != null) {
    productListGetProductsResult.price = price;
  }
  final String? productCategory = jsonConvert.convert<String>(json['ProductCategory']);
  if (productCategory != null) {
    productListGetProductsResult.productCategory = productCategory;
  }
  final String? productCode = jsonConvert.convert<String>(json['ProductCode']);
  if (productCode != null) {
    productListGetProductsResult.productCode = productCode;
  }
  final int? productVatId = jsonConvert.convert<int>(json['ProductVatId']);
  if (productVatId != null) {
    productListGetProductsResult.productVatId = productVatId;
  }
  return productListGetProductsResult;
}

Map<String, dynamic> $ProductListGetProductsResultToJson(ProductListGetProductsResult entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['BarCode'] = entity.barCode;
  data['CreatedDate'] = entity.createdDate;
  data['Deleted'] = entity.deleted;
  data['Id'] = entity.id;
  data['IsSpecialOfferSelected'] = entity.isSpecialOfferSelected;
  data['IsWeight'] = entity.isWeight;
  data['ModifiedDate'] = entity.modifiedDate;
  data['Name'] = entity.name;
  data['NominalCode'] = entity.nominalCode;
  data['PackSize'] = entity.packSize;
  data['Price'] = entity.price;
  data['ProductCategory'] = entity.productCategory;
  data['ProductCode'] = entity.productCode;
  data['ProductVatId'] = entity.productVatId;
  return data;
}

extension ProductListGetProductsResultExtension on ProductListGetProductsResult {
  ProductListGetProductsResult copyWith({
    String? barCode,
    String? createdDate,
    bool? deleted,
    int? id,
    bool? isSpecialOfferSelected,
    bool? isWeight,
    String? modifiedDate,
    String? name,
    String? nominalCode,
    int? packSize,
    double? price,
    String? productCategory,
    String? productCode,
    int? productVatId,
  }) {
    return ProductListGetProductsResult()
      ..barCode = barCode ?? this.barCode
      ..createdDate = createdDate ?? this.createdDate
      ..deleted = deleted ?? this.deleted
      ..id = id ?? this.id
      ..isSpecialOfferSelected = isSpecialOfferSelected ?? this.isSpecialOfferSelected
      ..isWeight = isWeight ?? this.isWeight
      ..modifiedDate = modifiedDate ?? this.modifiedDate
      ..name = name ?? this.name
      ..nominalCode = nominalCode ?? this.nominalCode
      ..packSize = packSize ?? this.packSize
      ..price = price ?? this.price
      ..productCategory = productCategory ?? this.productCategory
      ..productCode = productCode ?? this.productCode
      ..productVatId = productVatId ?? this.productVatId;
  }
}
