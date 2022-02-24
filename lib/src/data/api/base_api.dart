import '../../../env.dart';

abstract class BaseApiService {
  final String baseUrl = "https://newsapi.org/v2/";
  //final apiKey = EnvConfig.api_key;
  final apiKey = "42b8be96647240dbbde0d6e6fa7016d0";

  Future<dynamic> getResponse(String query);
}
