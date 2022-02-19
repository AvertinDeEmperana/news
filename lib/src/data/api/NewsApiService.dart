import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';
import 'dart:io';

import 'BaseApi.dart';

class NewsApiService extends BaseApiService {

  @override
  //Future getResponse(String url) async {
  Future getResponse(int page) async {
    dynamic responseJson;
    // dio = Dio();
    Dio dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: 5000,
        receiveTimeout: 10000,
      )
    );
    try{
      //Response response = await dio.get(url+"?country=fr&apiKey=$apiKey");
      //https://newsapi.org/v2/
      Response response = await dio.get("top-headlines?apiKey=$apiKey&country=fr&page=$page");
      responseJson = response.data;
    }on DioError catch(e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return responseJson;
  }
}



class ApiInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {

  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {

  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {

  }
}