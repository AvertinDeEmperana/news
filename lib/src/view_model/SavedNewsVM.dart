import 'package:flutter/foundation.dart';
import 'package:news/src/data/local/LocalDbHelper.dart';
import '../data/api/Status.dart';
import '../model/Article.dart';

class SavedNewsVM extends ChangeNotifier {
  int page = 1;
  List<Article> localDbArticles = [];
  var status = Status.COMPLETED;
  late int totalResults = 0;
  late Article currentArticle;
  bool isSaved = false;

  Future<void> loadArticles() async {
    var articles = await LocalDbHelper.getAllArticles();
    if(articles.isNotEmpty){
      for(var article in articles){
          if(localDbArticles.contains(article)){}
          else{
              localDbArticles.add(article);
              status = Status.COMPLETED;
              getAllSavedArticleCount();
              notifyListeners();
          }
      }
    }
    else{
      status = Status.NOTFOUND;
      notifyListeners();
    }
  }

  Future<int> saveArticle() async{
    var articleID = await LocalDbHelper.saveArticle(currentArticle);
    if(articleID == -200) {
      return -200;
    }
    else{
      isSaved = true;
      totalResults++;
      notifyListeners();
      return articleID;
    }
  }

  Future<bool> deleteArticle(int i) async{
    bool isDeleted = await LocalDbHelper.deleteArticleWithId(i);
    if(isDeleted){
        isSaved = false;
        totalResults--;
        notifyListeners();
    }
    return isDeleted;
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
    notifyListeners();
  }

}