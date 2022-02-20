import 'package:flutter/material.dart';
import 'package:news/src/view_model/NewsListVM.dart';
import 'package:provider/provider.dart';

import 'App_Theme.dart';
import 'Routes.gr.dart';

class App extends StatelessWidget {
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
}

    