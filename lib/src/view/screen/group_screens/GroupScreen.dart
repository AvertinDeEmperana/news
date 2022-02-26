import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:news/src/app_theme.dart';

import '../../../routes.gr.dart';

class GroupScreen extends StatelessWidget {
  final String id;

  const GroupScreen({Key? key, @PathParam('id') required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: AutoTabsRouter(
        routes: const [
          NewsListRouter(),
          SearchRouter(),
          SavedNewsRouter(),
        ],
        duration: const Duration(milliseconds: 400),
        builder: (context, child, animation) {
          final tabsRouter = context.tabsRouter;
          return Scaffold(
              body: FadeTransition(
                opacity: animation,
                child: child,
              ),
              bottomNavigationBar: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
                child: buildBottomNavigationBar(context, tabsRouter),
              ));
        },
      ),
    );
  }
}

BottomNavigationBar buildBottomNavigationBar(
    BuildContext context, TabsRouter tabsRouter) {
  return BottomNavigationBar(
    type: BottomNavigationBarType.fixed,
    //backgroundColor: AppTheme.rrose,
    backgroundColor: const Color(0xFF1A1A1A),
    onTap: tabsRouter.setActiveIndex,
    currentIndex: tabsRouter.activeIndex,
    iconSize: 25,
    selectedFontSize: 13,
    unselectedFontSize: 13,
    selectedItemColor: Colors.white,
    unselectedItemColor: Colors.grey,
    items: const [
      BottomNavigationBarItem(
          activeIcon: Icon(Icons.home_rounded),
          icon: Icon(Icons.home_outlined),
          label: 'Accueil'),
      BottomNavigationBarItem(
          icon: Icon(Icons.search_rounded), label: 'Rechercher'),
      BottomNavigationBarItem(
          activeIcon: Icon(Icons.bookmark),
          icon: Icon(Icons.bookmark_border_outlined),
          label: 'Enregistrés'),
    ],
  );
}
