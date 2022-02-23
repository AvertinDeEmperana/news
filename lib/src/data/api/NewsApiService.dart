import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';

import 'AppException.dart';
import 'BaseApi.dart';

class NewsApiService extends BaseApiService {

    @override
    Future getResponse(String query) async {
        dynamic responseJson;
        Dio dio = Dio(
            BaseOptions(
                baseUrl: baseUrl,
                connectTimeout: 5000,
                receiveTimeout: 10000,
                headers: {
                  'X-Api-Key': apiKey
                }
            )
        );
        try{
            Response response = await dio.get(query);
            responseJson = returnResponse(response);
        }on DioError catch(e) {
            if (kDebugMode) {
                print(e);
            }
        }on SocketException {
            throw FetchDataException('No Internet Connection');
        }
        return responseJson;
    }
}

dynamic returnResponse(Response response) {
    switch (response.statusCode) {
        case 200:
            return response.data;
        case 400:
            throw BadRequestException(response.toString());
        case 401:
        case 403:
            throw UnauthorisedException(response.statusMessage.toString());
        case 404:
            throw UnauthorisedException(response.statusMessage.toString());
        case 500:
        default:
            throw FetchDataException(
                'Error lors de la communication avec le serveur server' +
                    ' with status code : ${response.statusCode}');
    }
}

class ApiInterceptors extends Interceptor {
    @override
    void onRequest(RequestOptions options, RequestInterceptorHandler handler) {}
    @override
    void onError(DioError err, ErrorInterceptorHandler handler) {}
    @override
    void onResponse(Response response, ResponseInterceptorHandler handler) {}
}