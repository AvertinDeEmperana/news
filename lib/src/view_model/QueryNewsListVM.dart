import 'package:flutter/material.dart';

import '../data/api/ApiResponse.dart';
import '../model/Article.dart';
import '../model/Result.dart';
import '../repository/NewsRepository.dart';

class QueryNewsListVM extends ChangeNotifier {
  final _repo = NewsRepository();
  int page = 1;
  List<Article> news = [];
  int totalResults = 0;
  bool isQuerying = false;
  late String currentKeyword;

  ApiResponse<Result> result = ApiResponse.loading();
  ApiResponse<Result> otherResult = ApiResponse.loading();

  Future<void> fetchNews(String keyword) async {
      if (keyword.isNotEmpty){
          currentKeyword = keyword ;
          _setResult(ApiResponse.loading());
          _repo
              .getEverythingNewsList(keyword, page)
              .then((value) => _setResult(ApiResponse.completed(value)))
              .onError((error, stackTrace) => _setResult(ApiResponse.error(error.toString())));
      }
  }

  Future<void> _setResult(ApiResponse<Result> response) async {
      result = response;
      notifyListeners();
      result.data != null ? news.addAll(result.data!.articles) : "";
      result.data != null ? totalResults = result.data!.totalResults : 0 ;
  }

  Future<void> updateListIfNewDataFetched() async{
      isQuerying = true;
      notifyListeners();
      _repo
          .getEverythingNewsList(currentKeyword, page)
          .then((value) => updateArticlesList(ApiResponse.completed(value)))
          .onError((error, stackTrace) => _setResult(ApiResponse.error(error.toString())));
  }

  void updateArticlesList(ApiResponse<Result> response){
      otherResult = response;
      news.addAll(otherResult.data!.articles);
      notifyListeners();
  }
}