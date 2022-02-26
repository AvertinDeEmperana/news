import 'package:flutter/material.dart';
import 'package:news/src/util/util.dart';
import 'package:news/src/view_model/saved_news_vm.dart';
import 'package:provider/provider.dart';
import '../../data/api/status.dart';
import '../../model/article.dart';
import 'nlvbldr.dart';

class SavedNewsListWidget extends StatefulWidget {
  final List<Article>? articles;

  const SavedNewsListWidget({Key? key, required this.articles})
      : super(key: key);

  @override
  _SavedNewsListWidgetState createState() => _SavedNewsListWidgetState();
}

class _SavedNewsListWidgetState extends State<SavedNewsListWidget> {
  ScrollController theScrollController = ScrollController();
  bool isLoading = false;
  late bool allLoaded;

  loadMoreData() async {
    SavedNewsVM snVM = Provider.of<SavedNewsVM>(context, listen: false);
    setState(() {
      isLoading = true;
    });
    await Future.delayed(const Duration(seconds: 3));
    if (allLoaded) {
      setState(() {
        isLoading = false;
      });
      Util.allLoadedToast();
      return;
    }
    setState(() {
      isLoading = true;
    });
    snVM.loadArticles();
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      isLoading = false;
      allLoaded = snVM.localDbArticles.length == snVM.totalResults;
    });
  }

  @override
  void initState() {
    super.initState();
    SavedNewsVM snVM = Provider.of<SavedNewsVM>(context, listen: false);
    snVM.loadArticles();
    allLoaded = snVM.localDbArticles.length == snVM.totalResults;
    theScrollController.addListener(() async {
      if ((theScrollController.position.pixels ==
                  theScrollController.position.maxScrollExtent &&
              (snVM.status == Status.COMPLETED)) ||
          (snVM.localDbArticles.length < snVM.totalResults)) {
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
    return SafeArea(
        child: Nlvbldr(theScrollController: theScrollController, isLoading: isLoading, articles: widget.articles, isChildDismmisible: true, ));
  }
}
