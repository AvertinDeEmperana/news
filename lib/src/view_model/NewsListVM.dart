import 'package:flutter/material.dart';

import '../data/api/ApiResponse.dart';
import '../model/Article.dart';
import '../model/Result.dart';
import '../repository/NewsRepository.dart';

class NewsListVM extends ChangeNotifier {
  final _repo = NewsRepository();
  int page = 1;
  List<Article> articles = [];
  int totalResults = 0;

  ApiResponse<Result> result = ApiResponse.loading();

  Future<void> _setResult(ApiResponse<Result> response) async {
    result = response;
    notifyListeners();
    result.data != null ? articles.addAll(result.data!.articles) : "";
    result.data != null ? totalResults = result.data!.totalResults : 0 ;
    //print("The fucking totalResults ${result.data!.totalResults}");
  }

  Future<void> fetchEverythingNews() async {
    _setResult(ApiResponse.loading());
    _repo
        .getEverythingNewsList(page)
        .then((value) => _setResult(ApiResponse.completed(value)))
        .onError((error, stackTrace) => _setResult(ApiResponse.error(error.toString())));
  }

  Future<void> updateListIfNewDataFetched() async{
    result = ApiResponse.loading();
    notifyListeners();
    _repo
        .getEverythingNewsList(page)
        .then((value) => updateArticlesList(ApiResponse.completed(value)))
        .onError((error, stackTrace) => _setResult(ApiResponse.error(error.toString())));
  }

  void updateArticlesList(ApiResponse<Result> response){
    result = response;
    articles.addAll(result.data!.articles);
    //notifyListeners();
    print(articles.length);
  }
}