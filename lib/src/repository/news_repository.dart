import 'package:flutter/foundation.dart';

import '../data/api/base_api.dart';
import '../data/api/news_api_service.dart';
import '../model/result.dart';
import 'repository.dart';

class NewsRepository implements Repository {
  final BaseApiService _apiService = NewsApiService();

  @override
  Future<Result?> getTopHeadlinesNewsList(int page) async {
    String query = "top-headlines?country=fr&page=$page";
    try {
      dynamic response = await _apiService.getResponse(query);
      dynamic resJson = Result.fromJson(response);
      return resJson;
    } catch (e) {
      if (kDebugMode) {
        print("e =>  $e");
      }
      rethrow;
    }
  }

  @override
  Future<Result?> getEverythingNewsList(String keyword, int page) async {
    String query = "everything?q=$keyword&language=fr&page=$page";
    try {
      dynamic response = await _apiService.getResponse(query);
      dynamic resJson = Result.fromJson(response);
      return resJson;
    } catch (e) {
      if (kDebugMode) {
        print("e =>  $e");
      }
      rethrow;
    }
  }

  @override
  Future<Result?> getTopHeadlinesCategoryNewsList(
      String category, int page) async {
    String query = "top-headlines?category=$category&language=fr&page=$page";
    try {
      dynamic response = await _apiService.getResponse(query);
      dynamic resJson = Result.fromJson(response);
      return resJson;
    } catch (e) {
      if (kDebugMode) {
        print("e =>  $e");
      }
      rethrow;
    }
  }
}
