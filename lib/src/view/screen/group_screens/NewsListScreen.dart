import 'package:flutter/material.dart';
import 'package:news/src/view/widget/ShimmerNewsListWidget.dart';
import 'package:news/src/view_model/NewsListVM.dart';
import 'package:provider/provider.dart';

import '../../../data/api/Status.dart';
import '../../widget/NewsListWidget.dart';

class NewsListScreen extends StatefulWidget {
  const NewsListScreen({Key? key}) : super(key: key);

  @override
  _NewsListScreenState createState() => _NewsListScreenState();
}

class _NewsListScreenState extends State<NewsListScreen> {

  final NewsListVM viewModel = NewsListVM();

  @override
  void initState() {
    viewModel.fetchEverythingNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider<NewsListVM>(
        create: (BuildContext context) => viewModel,
        child: Consumer<NewsListVM>(builder: (context, viewModel, _) {
            switch (viewModel.result.status) {
                case Status.LOADING:
                    return const ShimmerNewsListWidget();
                case Status.ERROR:
                    return ErrorWidget(viewModel.result.message ?? "Pas de données");
                case Status.COMPLETED:
                    return NewsListWidget(theNewsVM: viewModel);
               default:
            }
          return Container();
        }),
      ),
    );
  }
}
