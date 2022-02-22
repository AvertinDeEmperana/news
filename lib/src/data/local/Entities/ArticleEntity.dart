import 'package:objectbox/objectbox.dart';
import '../../../model/Article.dart';
import 'SourceEntity.dart';

@Entity()
class ArticleEntity {
  int id = 0;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  final sourceEntity = ToOne<SourceEntity>();

  Article toArticle() {
      return Article(
        source: sourceEntity.target!.toSource(),
        author: author,
        content: content,
        description: description,
        url: url,
        urlToImage: urlToImage,
        publishedAt: publishedAt,
        title: title
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


extension ArticleExtension on Article{
    ArticleEntity toEntity() {
        //Source entity
        SourceEntity sourceEntity = SourceEntity();
        sourceEntity.stringId = source.id;
        sourceEntity.name = source.name;

        ArticleEntity articleEntity = ArticleEntity();
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