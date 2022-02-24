import 'package:flutter/material.dart';
import 'package:news/src/view_model/QueryNewsListVM.dart';
import 'package:provider/provider.dart';

import '../../data/api/Status.dart';
import '../widget/ArticlesNotFoundWidget.dart';
import '../widget/NewsListWidget.dart';
import '../widget/ShimmerNewsListWidget.dart';


class SearchResultScreen extends StatefulWidget {
  final String keyword;
  const SearchResultScreen({Key? key, required this.keyword}) : super(key: key);

  @override
  _SearchResultScreenState createState() => _SearchResultScreenState();
}

class _SearchResultScreenState extends State<SearchResultScreen> {
  QueryNewsListVM qnlVM = QueryNewsListVM();
  @override
  void initState() {
    super.initState();
    qnlVM.fetchTopHeadlinesNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Theme.of(context).colorScheme.secondary,
        elevation: 0,
        title: RichText(
          overflow: TextOverflow.ellipsis,
          text: TextSpan(
            text: "Résultats pour \"${widget.keyword}\"",
            style: Theme.of(context).textTheme.headline1!.copyWith(fontWeight: FontWeight.w600),
            children: const <TextSpan>[
              TextSpan(text: '.', style: TextStyle(fontSize: 44)),
            ],
          ),
        ),
      ),
      body: ChangeNotifierProvider<QueryNewsListVM>(
        create: (context) => QueryNewsListVM(),
        child: Consumer<QueryNewsListVM>(builder: (context, qnlVM, _) {
          switch (qnlVM.result.status) {
            case Status.LOADING:
              return const ShimmerNewsListWidget();
            case Status.ERROR:
              return const ArticlesNotFoundWidget(errorText: "Une erreur est survenue. Vérifiez létat de votre connexio ");
            case Status.COMPLETED:
              return NewsListWidget<QueryNewsListVM>(articles: qnlVM.topHeadlines,);
            default:
              return const ShimmerNewsListWidget();
          }
        }),
      ),
    );
  }
}
