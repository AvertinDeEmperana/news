abstract class BaseApiService {
  final String baseUrl = "https://newsapi.org/v2/";
  final String apiKey = "366ac85cba594261a233d8af0dd437ac";

  //Future<dynamic> getResponse(String url);
  Future<dynamic> getResponse(int page);
}

