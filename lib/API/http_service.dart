import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class HttpService {
  late Dio _dio;

  static const baseUrl = "https://foodmanandws.isni.co/AndroidService.svc/";

  HttpService() {
    _dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        receiveTimeout: const Duration(seconds: 60),
        connectTimeout: const Duration(seconds: 60),
        sendTimeout: const Duration(seconds: 60),
      ),
    );

    initializeInterceptors();
  }

  Future<Response> postRequest(String endPoint, dynamic map) async {
    Response response;

    try {
      response = await _dio.post(endPoint, data: map);
    } on DioException catch (e) {
      debugPrint(e.message);
      throw Exception(e.message ?? '');
    }
    return response;
  }

  initializeInterceptors() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onResponse: (response, handler) {
          log("response=>${jsonEncode(response.data)}");
          return handler.next(response);
        },
        onRequest: (options, handler) {
          log("${options.uri}\n${options.data}");

          if (options.data is FormData) {
            var data = options.data as FormData;
            log("${data.fields}\n\n");
          }
          return handler.next(options);
        },
        onError: (error, handler) {
          log(error.message ?? '');
          return handler.next(error);
        },
      ),
    );
  }
}
