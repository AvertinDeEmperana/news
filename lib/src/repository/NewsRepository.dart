
import 'package:flutter/foundation.dart';

import '../data/api/BaseApi.dart';
import '../data/api/NewsApiService.dart';
import '../model/Result.dart';
import 'Repository.dart';

class NewsRepository implements Repository {
    final BaseApiService _apiService = NewsApiService();

    @override
    Future<Result?> getTopHeadlinesNewsList(int page) async {
        try{
            //&sortBy=publishedAt&pageSize=20
            dynamic response = await _apiService.getResponse(page);
            dynamic resJson = Result.fromJson(response);
            return resJson;
        }
        catch(e){
            if (kDebugMode) {print("e =>  $e");}
            rethrow;
        }
    }

    @override
    Future<Result?> getEverythingNewsList(int page) {
      throw UnimplementedError();
    }
}