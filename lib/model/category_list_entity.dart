import 'dart:convert';

import 'package:order_creation/generated/json/base/json_field.dart';
import 'package:order_creation/generated/json/category_list_entity.g.dart';

export 'package:order_creation/generated/json/category_list_entity.g.dart';

@JsonSerializable()
class CategoryListEntity {
  @JSONField(name: "GetCategoriesResult")
  List<String>? getCategoriesResult = [];

  CategoryListEntity();

  factory CategoryListEntity.fromJson(Map<String, dynamic> json) => $CategoryListEntityFromJson(json);

  Map<String, dynamic> toJson() => $CategoryListEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
