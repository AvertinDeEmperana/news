import 'package:flutter/foundation.dart';
import 'package:news/src/data/local/LocalDbHelper.dart';
import '../data/api/Status.dart';
import '../model/Article.dart';

class SavedNewsVM extends ChangeNotifier {
  int page = 1;

  List<Article> localDbArticles = [];
  var status = Status.COMPLETED;
  late int totalResults;
  late Article currentArticle;

  Future<void> loadArticles() async {
    var articles = await LocalDbHelper.getAllArticles();
    if(articles.isNotEmpty){
      localDbArticles.addAll(articles);
      status = Status.COMPLETED;
      notifyListeners();
    }
    else{
      status = Status.NOTFOUND;
      notifyListeners();
    }
  }

  Future<int> saveArticle() async{
    var articleID = await LocalDbHelper.saveArticle(currentArticle);
    getAllSavedArticleCount();
    return articleID;
  }

  Future<bool> deleteArticle(int i) async{
    bool isDeleted = await LocalDbHelper.deleteArticleWithId(i);
    getAllSavedArticleCount();
    return isDeleted;
  }

  Future<Article?> loadFirstArticle() async {
      return await LocalDbHelper.getArticleWithId(1);
  }

  Future<void> getAllSavedArticleCount() async {
    totalResults = await LocalDbHelper.getAllArticlesCount();
    notifyListeners();
  }

  Future<void> getTwentyArticles() async {
    await getAllSavedArticleCount();
      if(localDbArticles.length == totalResults){
          return;
      }
      var articles = await LocalDbHelper.getTwentyArticles(page);
      localDbArticles.addAll(articles);
  }

}