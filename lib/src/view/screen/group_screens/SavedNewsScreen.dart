import 'package:flutter/material.dart';
import 'package:news/src/view/widget/SavedNewsListWidget.dart';
import 'package:provider/provider.dart';

import '../../../data/api/Status.dart';
import '../../../view_model/SavedNewsVM.dart';
import '../../widget/ArticlesNotFoundWidget.dart';
import '../../widget/ShimmerNewsListWidget.dart';

class SavedNewsScreen extends StatelessWidget {
  const SavedNewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<SavedNewsVM>(builder: (context, snVM, _) {
        snVM.loadArticles();
        snVM.getAllSavedArticleCount();
        switch (snVM.status) {
          case Status.LOADING:
            return const ShimmerNewsListWidget();
          case Status.NOTFOUND:
            return const ArticlesNotFoundWidget(errorText: "Une erreur est survenue. Balayer l'écran pour actualiser ");
          case Status.COMPLETED:
            return SavedNewsListWidget(articles: snVM.localDbArticles);
          default:
        }
        return Container();
      }),
    );
  }
}

/*
class SavedNewsScreen extends StatefulWidget {
  const SavedNewsScreen({Key? key}) : super(key: key);

  @override
  _SavedNewsScreenState createState() => _SavedNewsScreenState();
}

class _SavedNewsScreenState extends State<SavedNewsScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<SavedNewsVM>(builder: (context, snVM, _) {
          snVM.loadArticles();
          snVM.getAllSavedArticleCount();
          switch (snVM.status) {
            case Status.LOADING:
              return const ShimmerNewsListWidget();
            case Status.NOTFOUND:
              return const ArticlesNotFoundWidget(errorText: "Une erreur est survenue. Balayer l'écran pour actualiser ");
            case Status.COMPLETED:
              return SavedNewsListWidget(articles: snVM.localDbArticles);
            default:
          }
          return Container();
        }),
    );
  }
}
*/