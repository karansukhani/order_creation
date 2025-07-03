import 'dart:convert';

import 'package:order_creation/generated/json/base/json_field.dart';
import 'package:order_creation/generated/json/customer_list_entity.g.dart';

export 'package:order_creation/generated/json/customer_list_entity.g.dart';

@JsonSerializable()
class CustomerListEntity {
  @JSONField(name: "GetCustomersResult")
  List<CustomerListGetCustomersResult>? getCustomersResult = [];

  CustomerListEntity();

  factory CustomerListEntity.fromJson(Map<String, dynamic> json) => $CustomerListEntityFromJson(json);

  Map<String, dynamic> toJson() => $CustomerListEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class CustomerListGetCustomersResult {
  @JSONField(name: "AccountRef")
  String? accountRef = '';
  @JSONField(name: "Address1")
  String? address1 = '';
  @JSONField(name: "Address2")
  String? address2 = '';
  @JSONField(name: "Address3")
  String? address3 = '';
  @JSONField(name: "Address4")
  String? address4 = '';
  @JSONField(name: "Address5")
  String? address5 = '';
  @JSONField(name: "CAddress1")
  String? cAddress1 = '';
  @JSONField(name: "CAddress2")
  String? cAddress2 = '';
  @JSONField(name: "CAddress3")
  String? cAddress3 = '';
  @JSONField(name: "CAddress4")
  String? cAddress4 = '';
  @JSONField(name: "CAddress5")
  String? cAddress5 = '';
  @JSONField(name: "ContactName")
  String? contactName = '';
  @JSONField(name: "CountryCode")
  String? countryCode = '';
  @JSONField(name: "CreatedDate")
  String? createdDate = '';
  @JSONField(name: "DateAccountOpened")
  String? dateAccountOpened = '';
  @JSONField(name: "DiscountPercentage")
  double? discountPercentage;
  @JSONField(name: "Email")
  String? email = '';
  @JSONField(name: "Fax")
  String? fax = '';
  @JSONField(name: "IsCostcutter")
  bool? isCostcutter = false;
  @JSONField(name: "IsDeleted")
  bool? isDeleted = false;
  @JSONField(name: "IsHenderson")
  bool? isHenderson = false;
  @JSONField(name: "IsMessageEnabled")
  bool? isMessageEnabled = false;
  @JSONField(name: "IsMusgrave")
  bool? isMusgrave = false;
  @JSONField(name: "IsPredictionEnable")
  bool? isPredictionEnable = false;
  @JSONField(name: "IsTemplateEnable")
  bool? isTemplateEnable = false;
  @JSONField(name: "Message")
  String? message = '';
  @JSONField(name: "ModifiedDate")
  String? modifiedDate = '';
  @JSONField(name: "Name")
  String? name = '';
  @JSONField(name: "Telephone")
  String? telephone = '';
  @JSONField(name: "Telephone2")
  String? telephone2 = '';
  @JSONField(name: "WebAddress")
  String? webAddress = '';

  CustomerListGetCustomersResult();

  factory CustomerListGetCustomersResult.fromJson(Map<String, dynamic> json) =>
      $CustomerListGetCustomersResultFromJson(json);

  Map<String, dynamic> toJson() => $CustomerListGetCustomersResultToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
