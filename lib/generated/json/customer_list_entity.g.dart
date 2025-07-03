import 'package:order_creation/generated/json/base/json_convert_content.dart';
import 'package:order_creation/model/customer_list_entity.dart';

CustomerListEntity $CustomerListEntityFromJson(Map<String, dynamic> json) {
  final CustomerListEntity customerListEntity = CustomerListEntity();
  final List<CustomerListGetCustomersResult>? getCustomersResult = (json['GetCustomersResult'] as List<dynamic>?)
      ?.map((e) => jsonConvert.convert<CustomerListGetCustomersResult>(e) as CustomerListGetCustomersResult)
      .toList();
  if (getCustomersResult != null) {
    customerListEntity.getCustomersResult = getCustomersResult;
  }
  return customerListEntity;
}

Map<String, dynamic> $CustomerListEntityToJson(CustomerListEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['GetCustomersResult'] = entity.getCustomersResult?.map((v) => v.toJson()).toList();
  return data;
}

extension CustomerListEntityExtension on CustomerListEntity {
  CustomerListEntity copyWith({
    List<CustomerListGetCustomersResult>? getCustomersResult,
  }) {
    return CustomerListEntity()..getCustomersResult = getCustomersResult ?? this.getCustomersResult;
  }
}

CustomerListGetCustomersResult $CustomerListGetCustomersResultFromJson(Map<String, dynamic> json) {
  final CustomerListGetCustomersResult customerListGetCustomersResult = CustomerListGetCustomersResult();
  final String? accountRef = jsonConvert.convert<String>(json['AccountRef']);
  if (accountRef != null) {
    customerListGetCustomersResult.accountRef = accountRef;
  }
  final String? address1 = jsonConvert.convert<String>(json['Address1']);
  if (address1 != null) {
    customerListGetCustomersResult.address1 = address1;
  }
  final String? address2 = jsonConvert.convert<String>(json['Address2']);
  if (address2 != null) {
    customerListGetCustomersResult.address2 = address2;
  }
  final String? address3 = jsonConvert.convert<String>(json['Address3']);
  if (address3 != null) {
    customerListGetCustomersResult.address3 = address3;
  }
  final String? address4 = jsonConvert.convert<String>(json['Address4']);
  if (address4 != null) {
    customerListGetCustomersResult.address4 = address4;
  }
  final String? address5 = jsonConvert.convert<String>(json['Address5']);
  if (address5 != null) {
    customerListGetCustomersResult.address5 = address5;
  }
  final String? cAddress1 = jsonConvert.convert<String>(json['CAddress1']);
  if (cAddress1 != null) {
    customerListGetCustomersResult.cAddress1 = cAddress1;
  }
  final String? cAddress2 = jsonConvert.convert<String>(json['CAddress2']);
  if (cAddress2 != null) {
    customerListGetCustomersResult.cAddress2 = cAddress2;
  }
  final String? cAddress3 = jsonConvert.convert<String>(json['CAddress3']);
  if (cAddress3 != null) {
    customerListGetCustomersResult.cAddress3 = cAddress3;
  }
  final String? cAddress4 = jsonConvert.convert<String>(json['CAddress4']);
  if (cAddress4 != null) {
    customerListGetCustomersResult.cAddress4 = cAddress4;
  }
  final String? cAddress5 = jsonConvert.convert<String>(json['CAddress5']);
  if (cAddress5 != null) {
    customerListGetCustomersResult.cAddress5 = cAddress5;
  }
  final String? contactName = jsonConvert.convert<String>(json['ContactName']);
  if (contactName != null) {
    customerListGetCustomersResult.contactName = contactName;
  }
  final String? countryCode = jsonConvert.convert<String>(json['CountryCode']);
  if (countryCode != null) {
    customerListGetCustomersResult.countryCode = countryCode;
  }
  final String? createdDate = jsonConvert.convert<String>(json['CreatedDate']);
  if (createdDate != null) {
    customerListGetCustomersResult.createdDate = createdDate;
  }
  final String? dateAccountOpened = jsonConvert.convert<String>(json['DateAccountOpened']);
  if (dateAccountOpened != null) {
    customerListGetCustomersResult.dateAccountOpened = dateAccountOpened;
  }
  final double? discountPercentage = jsonConvert.convert<double>(json['DiscountPercentage']);
  if (discountPercentage != null) {
    customerListGetCustomersResult.discountPercentage = discountPercentage;
  }
  final String? email = jsonConvert.convert<String>(json['Email']);
  if (email != null) {
    customerListGetCustomersResult.email = email;
  }
  final String? fax = jsonConvert.convert<String>(json['Fax']);
  if (fax != null) {
    customerListGetCustomersResult.fax = fax;
  }
  final bool? isCostcutter = jsonConvert.convert<bool>(json['IsCostcutter']);
  if (isCostcutter != null) {
    customerListGetCustomersResult.isCostcutter = isCostcutter;
  }
  final bool? isDeleted = jsonConvert.convert<bool>(json['IsDeleted']);
  if (isDeleted != null) {
    customerListGetCustomersResult.isDeleted = isDeleted;
  }
  final bool? isHenderson = jsonConvert.convert<bool>(json['IsHenderson']);
  if (isHenderson != null) {
    customerListGetCustomersResult.isHenderson = isHenderson;
  }
  final bool? isMessageEnabled = jsonConvert.convert<bool>(json['IsMessageEnabled']);
  if (isMessageEnabled != null) {
    customerListGetCustomersResult.isMessageEnabled = isMessageEnabled;
  }
  final bool? isMusgrave = jsonConvert.convert<bool>(json['IsMusgrave']);
  if (isMusgrave != null) {
    customerListGetCustomersResult.isMusgrave = isMusgrave;
  }
  final bool? isPredictionEnable = jsonConvert.convert<bool>(json['IsPredictionEnable']);
  if (isPredictionEnable != null) {
    customerListGetCustomersResult.isPredictionEnable = isPredictionEnable;
  }
  final bool? isTemplateEnable = jsonConvert.convert<bool>(json['IsTemplateEnable']);
  if (isTemplateEnable != null) {
    customerListGetCustomersResult.isTemplateEnable = isTemplateEnable;
  }
  final String? message = jsonConvert.convert<String>(json['Message']);
  if (message != null) {
    customerListGetCustomersResult.message = message;
  }
  final String? modifiedDate = jsonConvert.convert<String>(json['ModifiedDate']);
  if (modifiedDate != null) {
    customerListGetCustomersResult.modifiedDate = modifiedDate;
  }
  final String? name = jsonConvert.convert<String>(json['Name']);
  if (name != null) {
    customerListGetCustomersResult.name = name;
  }
  final String? telephone = jsonConvert.convert<String>(json['Telephone']);
  if (telephone != null) {
    customerListGetCustomersResult.telephone = telephone;
  }
  final String? telephone2 = jsonConvert.convert<String>(json['Telephone2']);
  if (telephone2 != null) {
    customerListGetCustomersResult.telephone2 = telephone2;
  }
  final String? webAddress = jsonConvert.convert<String>(json['WebAddress']);
  if (webAddress != null) {
    customerListGetCustomersResult.webAddress = webAddress;
  }
  return customerListGetCustomersResult;
}

Map<String, dynamic> $CustomerListGetCustomersResultToJson(CustomerListGetCustomersResult entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['AccountRef'] = entity.accountRef;
  data['Address1'] = entity.address1;
  data['Address2'] = entity.address2;
  data['Address3'] = entity.address3;
  data['Address4'] = entity.address4;
  data['Address5'] = entity.address5;
  data['CAddress1'] = entity.cAddress1;
  data['CAddress2'] = entity.cAddress2;
  data['CAddress3'] = entity.cAddress3;
  data['CAddress4'] = entity.cAddress4;
  data['CAddress5'] = entity.cAddress5;
  data['ContactName'] = entity.contactName;
  data['CountryCode'] = entity.countryCode;
  data['CreatedDate'] = entity.createdDate;
  data['DateAccountOpened'] = entity.dateAccountOpened;
  data['DiscountPercentage'] = entity.discountPercentage;
  data['Email'] = entity.email;
  data['Fax'] = entity.fax;
  data['IsCostcutter'] = entity.isCostcutter;
  data['IsDeleted'] = entity.isDeleted;
  data['IsHenderson'] = entity.isHenderson;
  data['IsMessageEnabled'] = entity.isMessageEnabled;
  data['IsMusgrave'] = entity.isMusgrave;
  data['IsPredictionEnable'] = entity.isPredictionEnable;
  data['IsTemplateEnable'] = entity.isTemplateEnable;
  data['Message'] = entity.message;
  data['ModifiedDate'] = entity.modifiedDate;
  data['Name'] = entity.name;
  data['Telephone'] = entity.telephone;
  data['Telephone2'] = entity.telephone2;
  data['WebAddress'] = entity.webAddress;
  return data;
}

extension CustomerListGetCustomersResultExtension on CustomerListGetCustomersResult {
  CustomerListGetCustomersResult copyWith({
    String? accountRef,
    String? address1,
    String? address2,
    String? address3,
    String? address4,
    String? address5,
    String? cAddress1,
    String? cAddress2,
    String? cAddress3,
    String? cAddress4,
    String? cAddress5,
    String? contactName,
    String? countryCode,
    String? createdDate,
    String? dateAccountOpened,
    double? discountPercentage,
    String? email,
    String? fax,
    bool? isCostcutter,
    bool? isDeleted,
    bool? isHenderson,
    bool? isMessageEnabled,
    bool? isMusgrave,
    bool? isPredictionEnable,
    bool? isTemplateEnable,
    String? message,
    String? modifiedDate,
    String? name,
    String? telephone,
    String? telephone2,
    String? webAddress,
  }) {
    return CustomerListGetCustomersResult()
      ..accountRef = accountRef ?? this.accountRef
      ..address1 = address1 ?? this.address1
      ..address2 = address2 ?? this.address2
      ..address3 = address3 ?? this.address3
      ..address4 = address4 ?? this.address4
      ..address5 = address5 ?? this.address5
      ..cAddress1 = cAddress1 ?? this.cAddress1
      ..cAddress2 = cAddress2 ?? this.cAddress2
      ..cAddress3 = cAddress3 ?? this.cAddress3
      ..cAddress4 = cAddress4 ?? this.cAddress4
      ..cAddress5 = cAddress5 ?? this.cAddress5
      ..contactName = contactName ?? this.contactName
      ..countryCode = countryCode ?? this.countryCode
      ..createdDate = createdDate ?? this.createdDate
      ..dateAccountOpened = dateAccountOpened ?? this.dateAccountOpened
      ..discountPercentage = discountPercentage ?? this.discountPercentage
      ..email = email ?? this.email
      ..fax = fax ?? this.fax
      ..isCostcutter = isCostcutter ?? this.isCostcutter
      ..isDeleted = isDeleted ?? this.isDeleted
      ..isHenderson = isHenderson ?? this.isHenderson
      ..isMessageEnabled = isMessageEnabled ?? this.isMessageEnabled
      ..isMusgrave = isMusgrave ?? this.isMusgrave
      ..isPredictionEnable = isPredictionEnable ?? this.isPredictionEnable
      ..isTemplateEnable = isTemplateEnable ?? this.isTemplateEnable
      ..message = message ?? this.message
      ..modifiedDate = modifiedDate ?? this.modifiedDate
      ..name = name ?? this.name
      ..telephone = telephone ?? this.telephone
      ..telephone2 = telephone2 ?? this.telephone2
      ..webAddress = webAddress ?? this.webAddress;
  }
}
