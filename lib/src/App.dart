import 'package:flutter/material.dart';
import 'package:news/src/view_model/NewsListVM.dart';
import 'package:news/src/view_model/SavedNewsVM.dart';
import 'package:provider/provider.dart';

import 'App_Theme.dart';
import 'Routes.gr.dart';

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
  final SavedNewsVM snVM = SavedNewsVM();
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
          ChangeNotifierProvider<NewsListVM>(create: (BuildContext context) {
            nlVM.fetchEverythingNews();
            return nlVM;
          }),
        ChangeNotifierProvider<SavedNewsVM>(create: (BuildContext context) {
          return snVM;
        })
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: true,
        theme: AppTheme.lightTheme,
        title: "Your news App",
        routerDelegate: widget._appRouter.delegate(),
        routeInformationParser: widget._appRouter.defaultRouteParser(),
      ),
    );
  }
}

    