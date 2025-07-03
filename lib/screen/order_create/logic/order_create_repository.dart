import 'package:dio/dio.dart';
import 'package:order_creation/API/api_endpoints.dart';
import 'package:order_creation/API/http_service.dart';
import 'package:order_creation/model/category_list_entity.dart';
import 'package:order_creation/model/customer_list_entity.dart';
import 'package:order_creation/model/product_list_entity.dart';
import 'package:order_creation/shared_preferences/pref_key.dart';
import 'package:order_creation/shared_preferences/shared_pref.dart';

class OrderCreateRepository {
  Future<void> callGetCustomersApi() async {
    Map<String, dynamic> getCustomersMap = {
      "user": {
        "UserName": "v",
        "Password": "v",
        "DeviceId": "355622080315528",
        "Active": true,
        "AppType": "Android",
        "FirstName": "Vinay",
        "Id": 3,
        "LastName": "Patel",
        "OrderCode": "VIE",
        "OrderCount": 1,
        "OrderPredictionCount": 1,
        "Role": "Driver"
      },
      "syncDate": "/Date(536436000-600)/",
      "pageIndex": 0,
      "appVersionNo": "1.0",
      "deviceDate": "/Date(536436000-600)/"
    };
    Response response = await HttpService().postRequest(ApiEndpoints.getCustomersEndPoint, getCustomersMap);

    try {
      if (response.statusCode == 200) {
        CustomerListEntity customerListEntity = CustomerListEntity.fromJson(response.data);

        SharedPref.setString(PrefKey.customerList, customerListEntity.getCustomersResult.toString());
      } else {
        throw Exception("Something Went wrong");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> callGetCategoriesApi() async {
    Map<String, dynamic> getCategoriesMap = {
      "appVersionNo": "20240715.14",
      "deviceDate": "/Date(1721035961915+0530)/",
      "user": {
        "Active": true,
        "AppType": "Mobile",
        "DeviceId": "7f2226495640ecb1",
        "FirstName": "Vinay",
        "Id": 3,
        "IsResetSync": false,
        "LastName": "Emu",
        "OrderCode": "VIE",
        "OrderCount": 98,
        "OrderPredictionCount": 19,
        "Password": "v",
        "Role": "Driver",
        "UserName": "v"
      }
    };
    Response response = await HttpService().postRequest(ApiEndpoints.getCategoriesEndPoint, getCategoriesMap);

    try {
      if (response.statusCode == 200) {
        CategoryListEntity categoryListEntity = CategoryListEntity.fromJson(response.data);

        SharedPref.setString(PrefKey.categoryList, categoryListEntity.toString());
      } else {
        throw Exception("Something Went wrong");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> callGetProductsApi() async {
    Map<String, dynamic> getCategoriesMap = {
      "user": {
        "Active": true,
        "AppType": "Mobile",
        "DeviceId": "7f2226495640ecb1",
        "FirstName": "Vinay",
        "Id": 3,
        "IsResetSync": false,
        "LastName": "Emu",
        "OrderCode": "VIE",
        "OrderCount": 98,
        "OrderPredictionCount": 19,
        "Password": "v",
        "Role": "Driver",
        "UserName": "v"
      },
      "syncDate": "/Date(536436000-600)/",
      "pageIndex": 0,
      "appVersionNo": "1.0",
      "deviceDate": "/Date(1720768210-600)/"
    };
    Response response = await HttpService().postRequest(ApiEndpoints.getProductsEndPoint, getCategoriesMap);

    try {
      if (response.statusCode == 200) {
        ProductListEntity productListEntity = ProductListEntity.fromJson(response.data);

        SharedPref.setString(PrefKey.productList, productListEntity.getProductsResult.toString());
      } else {
        throw Exception("Something Went wrong");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
