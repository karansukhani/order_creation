import 'package:order_creation/generated/json/base/json_convert_content.dart';
import 'package:order_creation/model/category_list_entity.dart';

CategoryListEntity $CategoryListEntityFromJson(Map<String, dynamic> json) {
  final CategoryListEntity categoryListEntity = CategoryListEntity();
  final List<String>? getCategoriesResult =
      (json['GetCategoriesResult'] as List<dynamic>?)?.map((e) => jsonConvert.convert<String>(e) as String).toList();
  if (getCategoriesResult != null) {
    categoryListEntity.getCategoriesResult = getCategoriesResult;
  }
  return categoryListEntity;
}

Map<String, dynamic> $CategoryListEntityToJson(CategoryListEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['GetCategoriesResult'] = entity.getCategoriesResult;
  return data;
}

extension CategoryListEntityExtension on CategoryListEntity {
  CategoryListEntity copyWith({
    List<String>? getCategoriesResult,
  }) {
    return CategoryListEntity()..getCategoriesResult = getCategoriesResult ?? this.getCategoriesResult;
  }
}
