import 'package:news/src/data/local/Entities/article_entity.dart';

import '../../../main.dart';
import '../../../objectbox.g.dart';
import '../../model/article.dart';

class LocalDbHelper {
  static Future<int> saveArticle(Article article) async {
    if (await theDbContainsArticle(article) == false) {
      var storeHandler = objectbox;
      var box = storeHandler.store.box<ArticleEntity>();
      var id = box.put(article.toEntity());
      return id;
    }
    return -200;
  }

  static Future<bool> theDbContainsArticle(Article article) async {
    var storeHandler = objectbox;
    var box = storeHandler.store.box<ArticleEntity>();
    if ((box.query(ArticleEntity_.id.equals(article.id)).build().findFirst() !=
            null) ||
        (box
                .query(ArticleEntity_.title.equals(article.title))
                .build()
                .findFirst() !=
            null)) {
      return true;
    }
    return false;
  }

  static Future<bool> deleteArticle(String title) async {
    var storeHandler = objectbox;
    var box = storeHandler.store.box<ArticleEntity>();
    var id =
        box.query(ArticleEntity_.title.equals(title)).build().findFirst()!.id;
    var res = box.remove(id);
    return res;
  }

  static Future<bool> deleteArticleWithId(int id) async {
    var storeHandler = objectbox;
    var box = storeHandler.store.box<ArticleEntity>();
    var res = box.remove(id);
    return res;
  }

  static Future<Article?> getArticleWithId(int id) async {
    var storeHandler = objectbox;
    var box = storeHandler.store.box<ArticleEntity>();
    var res = box.get(id);
    var art = res!.toArticle();
    return art;
  }

  static Future<int?> getArticleIdWithTitle(String title) async {
    var storeHandler = objectbox;
    var box = storeHandler.store.box<ArticleEntity>();
    int ind;
    ind = box.query(ArticleEntity_.title.equals(title)).build().findFirst()!.id;
    return ind;
  }

  static Future<List<Article>> getAllArticles() async {
    var storeHandler = objectbox;
    var box = storeHandler.store.box<ArticleEntity>();
    var articlesEntities = box.getAll();
    List<Article> articles = [];
    articles.addAll(articlesEntities.map((e) => e.toArticle()).toList());
    return articles;
  }

  static Future<int> getAllArticlesCount() async {
    var storeHandler = objectbox;
    var box = storeHandler.store.box<ArticleEntity>();
    int size = box.getAll().length;
    return size;
  }
}
