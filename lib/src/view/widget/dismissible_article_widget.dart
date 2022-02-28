import 'package:flutter/material.dart';
import 'package:news/src/app_theme.dart';
import 'package:news/src/view/widget/single_article_widget.dart';
import 'package:news/src/view_model/saved_news_vm.dart';
import 'package:provider/provider.dart';

class DismissArticlewidget extends StatelessWidget {
  final SingleArticleWidget articleWidget;
  const DismissArticlewidget({Key? key, required this.articleWidget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SavedNewsVM snVM = Provider.of<SavedNewsVM>(context, listen: false);
    return Dismissible(
        key: UniqueKey(),
        child: articleWidget,
        onDismissed: (DismissDirection direction){
            snVM.deleteArticle(articleWidget.article.id);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  content: const Text("Article supprimé"),
                  action: SnackBarAction(
                      label: "Annuler",
                      textColor: AppTheme.rrose,
                      onPressed: () async => {
                          await snVM.saveArticle(articleWidget.article)
                      }
                  ),
              ),
            );
        },
        background: Container(
          color: AppTheme.rrose,
          alignment: Alignment.centerLeft,
          child: const Icon(Icons.delete),
        ),
      secondaryBackground: Container(
        color: AppTheme.rrose,
        alignment: Alignment.centerRight,
        child: const Icon(Icons.delete),
      ),
    );
  }
}
