
import 'package:flutter/foundation.dart';

import '../data/api/BaseApi.dart';
import '../data/api/NewsApiService.dart';
import '../model/Result.dart';
import 'Repository.dart';

class NewsRepository implements Repository {
    final BaseApiService _apiService = NewsApiService();

    @override
    Future<Result?> getTopHeadlinesNewsList(int page) async {
        String query = "top-headlines?country=fr&page=$page";
        try{
            dynamic response = await _apiService.getResponse(query);
            dynamic resJson = Result.fromJson(response);
            return resJson;
        }
        catch(e){
            if (kDebugMode) {print("e =>  $e");}
            rethrow;
        }
    }

  @override
  Future<Result?> getEverythingNewsList(String keyword, int page) async {
      String query = "everything?q=$keyword&language=fr&page=$page";
      try{
          dynamic response = await _apiService.getResponse(query);
          dynamic resJson = Result.fromJson(response);
          return resJson;
      }
      catch(e){
          if (kDebugMode) {print("e =>  $e");}
          rethrow;
      }
  }

  @override
  Future<Result?> getTopHeadlinesCategoryNewsList(String category, int page) async {
    String query = "top-headlines?category=$category&language=fr&page=$page";
    try{
      dynamic response = await _apiService.getResponse(query);
      dynamic resJson = Result.fromJson(response);
      return resJson;
    }
    catch(e){
      if (kDebugMode) {print("e =>  $e");}
      rethrow;
    }
  }
}