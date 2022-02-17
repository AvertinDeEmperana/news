import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';

import 'BaseApi.dart';

class NewsApiService extends BaseApiService {

  @override
  Future getResponse(String url) async {
    dynamic responseJson;
    Dio dio = Dio();
    try{
      Response response = await dio.get("$baseUrl/$url&apiKey=$apiKey");
      responseJson = response.data;
    }on DioError catch(e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return responseJson;
  }
}

/*class ApiInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {

  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {

  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {

  }
}*/