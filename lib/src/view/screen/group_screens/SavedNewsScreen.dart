import 'package:flutter/material.dart';
import 'package:news/src/app_theme.dart';
import 'package:news/src/view/widget/saved_news_list_widget.dart';
import 'package:provider/provider.dart';

import '../../../data/api/status.dart';
import '../../../view_model/saved_news_vm.dart';
import '../../widget/articles_not_found_widget.dart';
import '../../widget/shimmer_news_list_widget.dart';

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
    SavedNewsVM tsnvm = Provider.of<SavedNewsVM>(context, listen: false);
    tsnvm.loadArticles();
    tsnvm.getAllSavedArticleCount();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: RichText(
          overflow: TextOverflow.ellipsis,
          text: TextSpan(
            text: 'Articles enregistrés',
            style: Theme.of(context)
                .textTheme
                .headline1!
                .copyWith(fontWeight: FontWeight.w600),
            children: const <TextSpan>[
              TextSpan(text: '.', style: TextStyle(fontSize: 44, color: AppTheme.rrose)),
            ],
          ),
        ),
      ),
      body: Consumer<SavedNewsVM>(builder: (context, snVM, _) {
        switch (snVM.status) {
          case Status.LOADING:
            return const ShimmerNewsListWidget();
          case Status.NOTFOUND:
            return const ArticlesNotFoundWidget(
                errorText: "Vous n'avez sauvegardé aucun article");
          case Status.COMPLETED:
            return SavedNewsListWidget(articles: snVM.localDbArticles);
          default:
        }
        return Container();
      }),
    );
  }
}
