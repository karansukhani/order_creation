import 'dart:convert';

import 'package:order_creation/model/category_list_entity.dart';
import 'package:order_creation/model/product_list_entity.dart';
import 'package:order_creation/shared_preferences/pref_key.dart';
import 'package:order_creation/shared_preferences/shared_pref.dart';

import '../model/customer_list_entity.dart';

class PrefValue {
  Future<List<CustomerListGetCustomersResult>> getCustomerList() async {
    String customerListStr = await SharedPref.getString(PrefKey.customerList);

    if (customerListStr.isNotEmpty) {
      try {
        List<dynamic> jsonList = jsonDecode(customerListStr);
        return jsonList.map((item) => CustomerListGetCustomersResult.fromJson(item)).toList();
      } catch (e) {
        print('Error parsing customer list: $e');
        return [];
      }
    }

    return [];
  }

  Future<List<String>> getCategoryList() async {
    String categoryListStr = await SharedPref.getString(PrefKey.categoryList);

    if (categoryListStr.isNotEmpty) {
      try {
        Map<String, dynamic> jsonMap = jsonDecode(categoryListStr);
        CategoryListEntity categoryListEntity = CategoryListEntity.fromJson(jsonMap);
        return categoryListEntity.getCategoriesResult ?? [];
      } catch (e) {
        print('Error parsing category list: $e');
        return [];
      }
    }

    return [];
  }

  Future<List<ProductListGetProductsResult>> getProductList() async {
    String productListStr = await SharedPref.getString(PrefKey.productList);

    if (productListStr.isNotEmpty) {
      try {
        List<dynamic> jsonList = jsonDecode(productListStr);
        return jsonList.map((item) => ProductListGetProductsResult.fromJson(item)).toList();
      } catch (e) {
        print('Error parsing product list: $e');
        return [];
      }
    }

    return [];
  }
}
