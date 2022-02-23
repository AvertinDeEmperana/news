import 'package:flutter/material.dart';

import '../data/api/ApiResponse.dart';
import '../model/Article.dart';
import '../model/Result.dart';
import '../repository/NewsRepository.dart';

class QueryNewsListVM extends ChangeNotifier {
  final _repo = NewsRepository();
  int page = 1;
  List<Article> topHeadlines = [];
  int totalResults = 0;
  bool isQuerying = false;

  ApiResponse<Result> result = ApiResponse.loading();
  ApiResponse<Result> otherResult = ApiResponse.loading();

  Future<void> fetchTopHeadlinesNews() async {
    _setResult(ApiResponse.loading());
    _repo
        .getTopHeadlinesCategoryNewsList("entertainment", page)
        .then((value) => _setResult(ApiResponse.completed(value)))
        .onError((error, stackTrace) => _setResult(ApiResponse.error(error.toString())));
  }

  Future<void> _setResult(ApiResponse<Result> response) async {
    result = response;
    notifyListeners();
    result.data != null ? topHeadlines.addAll(result.data!.articles) : "";
    result.data != null ? totalResults = result.data!.totalResults : 0 ;
  }

  Future<void> updateListIfNewDataFetched() async{
    isQuerying = true;
    notifyListeners();
    _repo
        .getTopHeadlinesCategoryNewsList("entertainment", page)
        .then((value) => updateArticlesList(ApiResponse.completed(value)))
        .onError((error, stackTrace) => _setResult(ApiResponse.error(error.toString())));
  }

  void updateArticlesList(ApiResponse<Result> response){
    otherResult = response;
    topHeadlines.addAll(otherResult.data!.articles);
    notifyListeners();
  }
}