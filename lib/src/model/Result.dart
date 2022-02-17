import 'Article.dart';

class Result {

  late final String status;
  late final int totalResults;
  late final List<Articles> articles;

  Result({required this.status, required this.totalResults, required this.articles, });

  Result.fromJson(Map<String, dynamic> json){
    status = json['status'];
    totalResults = json['totalResults'];
    articles = List.from(json['articles']).map((e)=>Articles.fromJson(e)).toList();
  }
}



