import 'package:flutter/foundation.dart';
import 'package:news/src/data/local/localdb_helper.dart';
import '../data/api/status.dart';
import '../model/article.dart';

class SavedNewsVM extends ChangeNotifier {
  int page = 1;
  List<Article> localDbArticles = [];
  var status = Status.LOADING;
  late int totalResults = 0;
  late Article currentArticle;
  bool isSaved = false;

  Future<void> loadArticles() async {
    var articles = await LocalDbHelper.getAllArticles();
    if (articles.isNotEmpty) {
      for (var article in articles) {
        if (!localDbArticles.contains(article)) {
          localDbArticles.add(article);
          status = Status.COMPLETED;
          getAllSavedArticleCount();
          notifyListeners();
        }
      }
    }
    if (localDbArticles.isEmpty) {
      status = Status.NOTFOUND;
      notifyListeners();
    }
  }

  Future<int> saveArticle() async {
    var articleID = await LocalDbHelper.saveArticle(currentArticle);
    if (articleID == -200) {
      isSaved = false;
      notifyListeners();
      return -200;
    } else {
      isSaved = true;
      totalResults++;
      loadArticles();
      notifyListeners();
      return articleID;
    }
  }

  Future<bool> deleteArticle(int i) async {
    if (i == 0) {
      return false;
    }
    if (await LocalDbHelper.deleteArticleWithId(i)) {
      isSaved = false;
      totalResults--;
      localDbArticles.removeWhere((element) => element.id == i);
      localDbArticles.isEmpty ? status = Status.NOTFOUND : '';
      notifyListeners();
      return true;
    }
    return false;
  }

  Future<bool> deleteCurrentArticle() async {
    return await deleteArticle(currentArticle.id);
  }

  Future<Article?> loadFirstArticle() async {
    return await LocalDbHelper.getArticleWithId(1);
  }

  Future<void> getAllSavedArticleCount() async {
    totalResults = await LocalDbHelper.getAllArticlesCount();
    notifyListeners();
  }

  Future<void> checkSavedStatus() async {
    isSaved = await LocalDbHelper.theDbContainsArticle(currentArticle);
    if (isSaved) {
      if (await LocalDbHelper.getArticleIdWithTitle(currentArticle.title) !=
          null) {
        currentArticle.id =
            (await LocalDbHelper.getArticleIdWithTitle(currentArticle.title))!;
      }
    }
    notifyListeners();
  }

/*
  if(await LocalDbHelper.theDbContainsArticle(currentArticle)){
        currentArticle.id = (await LocalDbHelper.getArticleIdWithTitle(currentArticle.title))!;
    }
    notifyListeners();
   */

}
