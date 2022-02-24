import 'package:flutter/material.dart';
import 'package:news/src/view_model/news_list_vm.dart';
import 'package:news/src/view_model/query_news_list_vm.dart';
import 'package:news/src/view_model/saved_news_vm.dart';
import 'package:provider/provider.dart';

import 'app_theme.dart';
import 'routes.gr.dart';

/*class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _appRouter = AppRouter();
    return MaterialApp.router(
      debugShowCheckedModeBanner: true,
      theme: AppTheme.lightTheme,
      title: "Your news App",
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}*/

class App extends StatefulWidget {
  App({Key? key}) : super(key: key);
  final _appRouter = AppRouter();

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final NewsListVM nlVM = NewsListVM();
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<NewsListVM>(create: (BuildContext context) {
          nlVM.fetchTopHeadlinesNews();
          return nlVM;
        }),
        ChangeNotifierProvider<SavedNewsVM>(
            create: (BuildContext context) => SavedNewsVM()),
        ChangeNotifierProvider<QueryNewsListVM>(
            create: (BuildContext context) => QueryNewsListVM()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        title: "Your news App",
        routerDelegate: widget._appRouter.delegate(),
        routeInformationParser: widget._appRouter.defaultRouteParser(),
      ),
    );
  }
}
