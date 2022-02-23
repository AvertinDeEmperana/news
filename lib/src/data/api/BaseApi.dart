import '../../envConfig.dart';

final envConf = EnvironmentConf();

abstract class BaseApiService {
  final String baseUrl = "https://newsapi.org/v2/";
  //final String apiKey = envConf.theApiKey;
  final String apiKey = "8d6eee3fb2d74d568f3e540a185ce452";

  Future<dynamic> getResponse(String query);

}

