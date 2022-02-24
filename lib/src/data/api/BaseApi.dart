import '../../envConfig.dart';

final envConf = EnvironmentConf();

abstract class BaseApiService {
  final String baseUrl = "https://newsapi.org/v2/";
  //final String apiKey = envConf.theApiKey;
  final String apiKey = "96b27f56081640989e48ba5e4c78c291";

  Future<dynamic> getResponse(String query);

}

