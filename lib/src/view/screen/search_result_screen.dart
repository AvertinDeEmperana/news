import 'package:flutter/material.dart';
import 'package:news/src/view_model/query_news_list_vm.dart';
import 'package:provider/provider.dart';

import '../../data/api/status.dart';
import '../widget/articles_not_found_widget.dart';
import '../widget/news_list_widget.dart';
import '../widget/shimmer_news_list_widget.dart';

class SearchResultScreen extends StatefulWidget {
  final String keyword;

  const SearchResultScreen({Key? key, required this.keyword}) : super(key: key);

  @override
  _SearchResultScreenState createState() => _SearchResultScreenState();
}

class _SearchResultScreenState extends State<SearchResultScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          foregroundColor: Theme.of(context).colorScheme.secondary,
          elevation: 0,
          title: Text(
            "Résultats pour \"${widget.keyword}\"",
            style: Theme.of(context)
                .textTheme
                .headline1!
                .copyWith(fontWeight: FontWeight.w600),
          )),
      body: Consumer<QueryNewsListVM>(builder: (context, qnlVM, _) {
        switch (qnlVM.result.status) {
          case Status.LOADING:
            return const ShimmerNewsListWidget();
          case Status.ERROR:
            return const ArticlesNotFoundWidget(
                errorText:
                    "Une erreur est survenue. Vérifiez létat de votre connexio ");
          case Status.COMPLETED:
            return NewsListWidget<QueryNewsListVM>(
              articles: qnlVM.topHeadlines,
            );
          default:
            return const ShimmerNewsListWidget();
        }
      }),
    );
  }
}
