
import 'package:news/src/data/local/Entities/ArticleEntity.dart';

import '../../../objectbox.g.dart';
import '../../model/Article.dart';

class LocalDbHelper {
    static Future<int> saveArticle(Article article) async {
        //ArticleEntity articleEntity = article.toEntity();
        var store = await openStore();
        var box = store.box<ArticleEntity>();
        var id = box.put(article.toEntity());
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

    static Future<Article?> getArticleWithId(int id) async {
      var store = await openStore();
      var box = store.box<ArticleEntity>();
      var res = box.get(id);
      var art = res!.toArticle();
      store.close();
      return art;
    }

    static Future<List<Article>> getAllArticles() async {
      var store = await openStore();
      var box = store.box<ArticleEntity>();
      var articlesEntities = box.getAll();

      /*List<Article> articles = [];
      for (var elem in articlesEntities) {
          articles.add(elem.toArticle());
      }*/

      var articles = articlesEntities.map((e) => e.toArticle()).toList();
      store.close();
      return articles;
    }

    static Future<List<Article>> getTwentyArticles(int page) async {

      var store = await openStore();
      var box = store.box<ArticleEntity>();
      //var articlesEntities = box.query().build();
      var articlesEntities = box.getAll();
      var articles = articlesEntities.map((e) => e.toArticle()).toList();
      /*for (var elem in articlesEntities) {
        articles.add(elem.toArticle());
      }*/
      //var articles = articlesEntities.map((e) => e.toArticle()).toList();
      store.close();
      return articles;
    }

    static Future<int> getAllArticlesCount() async {
        var store = await openStore();
        var box = store.box<ArticleEntity>();
        store.close();
        return box.count();
    }


}