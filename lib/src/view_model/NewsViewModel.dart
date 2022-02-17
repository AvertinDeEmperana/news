import 'package:flutter/material.dart';

import '../data/api/ApiResponse.dart';
import '../model/Result.dart';
import '../repository/NewsRepository.dart';

class NewsList extends ChangeNotifier {
  final _repo = NewsRepository();

  ApiResponse<Result> result = ApiResponse.loading();

  void _setResult(ApiResponse<Result> response) {
    result = response;
    notifyListeners();
  }

  Future<void> fetchEverythingNews() async {
    _setResult(ApiResponse.loading());
    _repo
        .getEverythingNewsList()
        .then((value) => _setResult(ApiResponse.completed(value)))
        .onError((error, stackTrace) => _setResult(ApiResponse.error(error.toString())));
  }
}