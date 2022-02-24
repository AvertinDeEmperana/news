import 'package:flutter/material.dart';

import '../data/api/ApiResponse.dart';
import '../model/Result.dart';

abstract class AbstractNewsListVM {
  Future<void> fetchTopHeadlinesNews() async {
  }

  Future<void> _setResult(ApiResponse<Result> response) async {
  }

  Future<void> updateListIfNewDataFetched() async{
  }

  void updateArticlesList(ApiResponse<Result> response){
  }
}