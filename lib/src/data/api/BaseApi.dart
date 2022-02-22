import '../../envConfig.dart';

final envConf = EnvironmentConf();

abstract class BaseApiService {
  final String baseUrl = "https://newsapi.org/v2/";
  //final String apiKey = envConf.theApiKey;
  final String apiKey = "5122fdcc41ba4c26b5b38176583954a9";

  Future<dynamic> getResponse(int page);

}

