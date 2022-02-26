import 'package:equatable/equatable.dart';

import 'source.dart';

class Article extends Equatable {
  int id = 0;
  late final Source source;
  late final String author;
  late final String title;
  late final String description;
  late final String url;
  late final String urlToImage;
  late final String publishedAt;
  late final String content;
  bool isSaved = false;

  Article(
      {required this.source,
      required this.author,
      required this.title,
      required this.description,
      required this.url,
      required this.urlToImage,
      required this.publishedAt,
      required this.content});

  Article.fromEntity(
      {required this.id,
      required this.source,
      required this.author,
      required this.title,
      required this.description,
      required this.url,
      required this.urlToImage,
      required this.publishedAt,
      required this.content,
        required this.isSaved});

  Article.fromJson(Map<String, dynamic> json) {
    source = Source.fromJson(json['source'] ?? Source(id: "", name: ""));
    author = json['author'] ?? "";
    title = json['title'] ?? "";
    description = json['description'] ?? "";
    url = json['url'] ?? "";
    urlToImage = json['urlToImage'] ?? "";
    publishedAt = json['publishedAt'] ?? "";
    content = json['content'] ?? "";
  }

  @override
  // TODO: implement props
  List<Object?> get props => [title, publishedAt, url];
}
