import '../data/api/api_response.dart';
import '../model/result.dart';

abstract class AbstractNewsListVM {
  Future<void> fetchTopHeadlinesNews() async {}

  Future<void> _setResult(ApiResponse<Result> response) async {}

  Future<void> updateListIfNewDataFetched() async {}

  void updateArticlesList(ApiResponse<Result> response) {}
}
