import 'package:news/objectbox.g.dart';
import 'package:news/src/data/local/Entities/ArticleEntity.dart';

import '../../model/Article.dart';

class LocalDbHelper {
    static Future<int> saveArticle(Article article) async {
        var articleEntity = article.toEntity();
        var store = await openStore();
        var box = store.box<ArticleEntity>();
        var id = box.put(articleEntity);
        store.close();
        return id;
    }

    static Future<bool> deleteArticle(String title) async {
        var store = await openStore();
        var box = store.box<ArticleEntity>();
        var id = box.query(ArticleEntity_.title.equals(title)).build().findFirst()!.id;
        var res = box.remove(id);
        store.close();
        return res;
    }
    static Future<bool> deleteArticleWithId(int id) async {
        var store = await openStore();
        var box = store.box<ArticleEntity>();
        var res = box.remove(id);
        store.close();
        return res;
    }

    static Future<List<Article>> getAllArticles() async {
      var store = await openStore();
      var box = store.box<ArticleEntity>();
      var articlesEntities = box.getAll();
      var articles = articlesEntities.map((e) => e.toArticle()).toList();
      store.close();
      return articles;
    }
}