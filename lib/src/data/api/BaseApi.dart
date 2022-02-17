abstract class BaseApiService {
  final String baseUrl = "https://newsapi.org/v2";
  final String apiKey = "5122fdcc41ba4c26b5b38176583954a9";

  Future<dynamic> getResponse(String url);
}

