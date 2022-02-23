import 'package:news/src/data/local/Entities/ArticleEntity.dart';

import '../../../objectbox.g.dart';
import '../../model/Article.dart';

class LocalDbHelper {


    static Future<int> saveArticle(Article article) async {
        if(await theDbContainsArticle(article) == false)
        {
            var store = await openStore();
            var box = store.box<ArticleEntity>();
            var id = box.put(article.toEntity());
            store.close();
            return id;
        }
        return -200;
    }

    static Future<bool> theDbContainsArticle(Article article) async {
        var store = await openStore();
        var box = store.box<ArticleEntity>();
        if((box.query(ArticleEntity_.id.equals(article.id)).build().findFirst() != null)
            || (box.query(ArticleEntity_.title.equals(article.title)).build().findFirst() != null)
            )
        {
            store.close();
            return true;
        }
        store.close();
        return false;
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
        List<Article> articles = [];
        articles.addAll(articlesEntities.map((e) => e.toArticle()).toList());
        store.close();
        return articles;
    }

    static Future<int> getAllArticlesCount() async {
        var store = await openStore();
        var box = store.box<ArticleEntity>();
        int size = box.getAll().length;
        store.close();
        return size;
    }
}