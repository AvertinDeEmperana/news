import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/api/status.dart';
import '../../model/article.dart';
import '../../util/util.dart';
import 'nlvbldr.dart';

class NewsListWidget<AbstractNewsListVM> extends StatefulWidget {
  final List<Article> articles;

  const NewsListWidget({Key? key, required this.articles}) : super(key: key);

  @override
  _NewsListWidget<AbstractNewsListVM> createState() =>
      _NewsListWidget<AbstractNewsListVM>();
}

class _NewsListWidget<AbstractNewsListVM>
    extends State<NewsListWidget<AbstractNewsListVM>> {
  ScrollController theScrollController = ScrollController();
  bool isLoading = false;
  bool allLoaded = false;
  late var vm;

  loadMoreData() async {
    if (allLoaded) {
      Util.allLoadedToast();
      return;
    }
    setState(() {
      isLoading = true;
    });
    vm!.page++;
    await vm!.updateListIfNewDataFetched();
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      isLoading = false;
      allLoaded = vm!.articles.length == vm!.totalResults;
    });
  }

  @override
  void initState() {
    super.initState();
    AbstractNewsListVM abnlVM = Provider.of<AbstractNewsListVM>(context, listen: false);
    vm = abnlVM;
    theScrollController.addListener(() async {
      if (theScrollController.position.pixels ==
              theScrollController.position.maxScrollExtent &&
          (vm!.result.status == Status.COMPLETED)) {
        loadMoreData();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    theScrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Nlvbldr(theScrollController: theScrollController, isLoading: isLoading, articles: widget.articles, isChildDismmisible: false,);
  }
}
