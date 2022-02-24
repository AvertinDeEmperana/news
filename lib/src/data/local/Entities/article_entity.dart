import 'package:objectbox/objectbox.dart';
import '../../../model/article.dart';
import 'source_entity.dart';

@Entity()
class ArticleEntity {
  int id = 0;
  late String author;
  late String title;
  late String description;
  late String url;
  late String urlToImage;
  late String publishedAt;
  late String content;

  final sourceEntity = ToOne<SourceEntity>();

  Article toArticle() {
    return Article.fromEntity(
      author: author,
      content: content,
      description: description,
      url: url,
      urlToImage: urlToImage,
      publishedAt: publishedAt,
      title: title,
      id: id,
      source: sourceEntity.target!.toSource(),
    );
  }

/*ArticleEntity(Article article){
      SourceEntity theSourceEntity = SourceEntity();
      theSourceEntity.stringId = article.source.id;
      theSourceEntity.name = article.source.name;

      author = article.author;
      title = article.title;
      description = article.description;
      url = article.url;
      urlToImage = article.urlToImage;
      publishedAt = article.publishedAt;
      content = article.content;
      sourceEntity.target = theSourceEntity;
  }*/

}

extension ArticleExtension on Article {
  ArticleEntity toEntity() {
    //Source entity
    ArticleEntity articleEntity = ArticleEntity();
    SourceEntity sourceEntity = SourceEntity();
    sourceEntity.stringId = source.id;
    sourceEntity.name = source.name;

    articleEntity.id = id;
    articleEntity.author = author;
    articleEntity.title = title;
    articleEntity.description = description;
    articleEntity.url = url;
    articleEntity.urlToImage = urlToImage;
    articleEntity.publishedAt = publishedAt;
    articleEntity.content = content;
    articleEntity.sourceEntity.target = sourceEntity;
    return articleEntity;
  }
}
