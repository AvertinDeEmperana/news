import 'Source.dart';

class Article {
  late final Source source;
  late final String author;
  late final String title;
  late final String description;
  late final String url;
  late final String urlToImage;
  late final String publishedAt;
  late final String content;

  Article({required this.source, required author, required title, required description, required url, required urlToImage, required publishedAt, required content});

  Article.fromJson(Map<String, dynamic> json){
    source = Source.fromJson(json['source'] ?? Source(id: "", name: ""));
    author = json['author'] ?? "";
    title = json['title'] ?? "";
    description = json['description'] ?? "";
    url = json['url'] ?? "";
    urlToImage = json['urlToImage'] ?? "";
    publishedAt = json['publishedAt'] ?? "";
    content = json['content'] ?? "";
  }
}