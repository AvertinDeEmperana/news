
import '../data/api/BaseApi.dart';
import '../data/api/NewsApiService.dart';
import '../model/Result.dart';
import 'Repository.dart';

class NewsRepository implements Repository {
  final BaseApiService _apiService = NewsApiService();

  @override
  Future<Result?> getEverythingNewsList() async {
    try{
      dynamic response = await _apiService.getResponse("everything&sortBy=publishedAt&pageSize=20");
      Result result = Result.fromJson(response);
      return result;
    } catch(e){
      rethrow;
    }

    //&sortBy=publishedAt
    //dans le try
    //Result result = Result(response.data)
  }



}