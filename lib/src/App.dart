import 'package:flutter/material.dart';

import 'App_Theme.dart';
import 'Routes.gr.dart';

class App extends StatefulWidget {
  App({Key? key}) : super(key: key);
  final _appRouter = AppRouter();

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: true,
      theme: AppTheme.lightTheme,
      title: "Your news App",
      routerDelegate: widget._appRouter.delegate(),
      routeInformationParser: widget._appRouter.defaultRouteParser(),
    );
  }
}

    