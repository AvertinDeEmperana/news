import 'package:flutter/material.dart';
import 'package:news/src/view_model/CategoryNewsListVM.dart';
import 'package:provider/provider.dart';

import '../../data/api/Status.dart';
import '../../model/Article.dart';
import '../../view_model/NewsListVM.dart';
import 'CustomErrorWidget.dart';
import 'NewsListWidget.dart';
import 'ShimmerNewsListWidget.dart';

class ResultSetter extends StatefulWidget {
  final String category;
  const ResultSetter({Key? key, required this.category}) : super(key: key);

  @override
  _ResultSetterState createState() => _ResultSetterState();
}

class _ResultSetterState extends State<ResultSetter> {
  late CategoryNewsListVM cnlVM;
  @override
  void initState() {
    super.initState();
    cnlVM = CategoryNewsListVM(category: widget.category);
    cnlVM.fetchTopHeadlinesNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider<CategoryNewsListVM>(
          create: (context) => cnlVM,
          child: Consumer<CategoryNewsListVM>(builder: (context, cnlVM, _) {
            switch (cnlVM.result.status) {
              case Status.LOADING:
                return const ShimmerNewsListWidget();
              case Status.ERROR:
                return CustomErrorWidget(theNewsVM: cnlVM, errorText: /*viewModel.result.message ?? */ "Une erreur est survenue. Balayer l'écran pour actualiser ");
              case Status.COMPLETED:
                return NewsListWidget(articles: cnlVM.topHeadlines,);
              default:
                return const ShimmerNewsListWidget();
            }
          }),
      )
    );
  }
}