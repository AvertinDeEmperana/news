import 'Source.dart';

class Articles {
  late final Source source;
  late final String author;
  late final String title;
  late final String description;
  late final String url;
  late final String urlToImage;
  late final String publishedAt;
  late final String content;

  Articles({required this.source, required this.author, required this.title, required this.description, required this.url, required this.urlToImage, required this.publishedAt, required this.content, });


  Articles.fromJson(Map<String, dynamic> json){
    source = Source.fromJson(json['source']);
    author = json['author'];
    title = json['title'];
    description = json['description'];
    url = json['url'];
    urlToImage = json['urlToImage'];
    publishedAt = json['publishedAt'];
    content = json['content'];
  }
}