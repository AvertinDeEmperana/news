import '../../envConfig.dart';

final envConf = EnvironmentConf();

abstract class BaseApiService {
  final String baseUrl = "https://newsapi.org/v2/";
  final String apiKey = envConf.theApiKey;

  Future<dynamic> getResponse(int page);

}

