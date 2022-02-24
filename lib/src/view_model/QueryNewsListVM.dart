import 'package:flutter/material.dart';
import 'package:news/src/view_model/AbstractNewsListVM.dart';

import '../data/api/ApiResponse.dart';
import '../model/Article.dart';
import '../model/Result.dart';
import '../repository/NewsRepository.dart';

class QueryNewsListVM extends ChangeNotifier implements AbstractNewsListVM{
  final _repo = NewsRepository();
  int page = 1;
  List<Article> topHeadlines = [];
  int totalResults = 0;
  bool isQuerying = false;
  late String currentKeyword = "";

  ApiResponse<Result> result = ApiResponse.loading();
  ApiResponse<Result> otherResult = ApiResponse.loading();

  @override
  Future<void> fetchTopHeadlinesNews() async {
    print("querying");
    _setResult(ApiResponse.loading());
    print("Set response to loading");
    _repo
        .getEverythingNewsList(currentKeyword, page)
        .then((value) => _setResult(ApiResponse.completed(value)))
        .onError((error, stackTrace) => _setResult(ApiResponse.error(error.toString())));
    print("Set response to loading");
  }

  Future<void> _setResult(ApiResponse<Result> response) async {
      result = response;
      notifyListeners();
      result.data != null ? topHeadlines.addAll(result.data!.articles) : "";
      result.data != null ? totalResults = result.data!.totalResults : 0 ;
  }

  @override
  Future<void> updateListIfNewDataFetched() async{
      isQuerying = true;
      notifyListeners();
      _repo
          .getEverythingNewsList(currentKeyword, page)
          .then((value) => updateArticlesList(ApiResponse.completed(value)))
          .onError((error, stackTrace) => _setResult(ApiResponse.error(error.toString())));
  }

  @override
  void updateArticlesList(ApiResponse<Result> response){
      otherResult = response;
      topHeadlines.addAll(otherResult.data!.articles);
      notifyListeners();
  }
}