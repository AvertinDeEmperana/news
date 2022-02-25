import '../../../env.dart';

abstract class BaseApiService {
  final String baseUrl = "https://newsapi.org/v2/";
  final apiKey = EnvConfig.api_key;

  Future<dynamic> getResponse(String query);
}
