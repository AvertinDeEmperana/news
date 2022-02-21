import 'package:objectbox/objectbox.dart';
import 'Source.dart';

@Entity()
class Article {
  @Id()
  late final int id = 0;
  late Source source = ToOne<Source>() as Source;
  late final String? author;
  late final String? title;
  late final String? description;
  late final String? url;
  late final String? urlToImage;
  late final String? publishedAt;
  late final String? content;

  Article({required source, required author, required title, required description, required url, required urlToImage, required publishedAt, required content});

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