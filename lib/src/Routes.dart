import 'package:auto_route/auto_route.dart';
import 'package:news/src/view/screen/NewsDetailsScreen.dart';
import 'package:news/src/view/screen/SearchResultScreen.dart';
import 'package:news/src/view/screen/SplashScreen.dart';
import 'package:news/src/view/screen/group_screens/GroupScreen.dart';
import 'package:news/src/view/screen/group_screens/NewsListScreen.dart';
import 'package:news/src/view/screen/group_screens/SavedNewsScreen.dart';
import 'package:news/src/view/screen/group_screens/SearchScreen.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route,Screen',
  routes: <AutoRoute>[
    AutoRoute(path: 'splash', page: SplashScreen, initial: true),
    AutoRoute(path: 'newsdetails/:article', page: NewsDetailsScreen),
    AutoRoute(path: 'searchresult/:keyword', page: SearchResultScreen),
    groupTabRouter,
  ],
)

class $AppRouter {}

const groupTabRouter = AutoRoute(
    path: 'group/:id',
    page: GroupScreen,
    children: [
      AutoRoute(
        path: 'tab1',
        name: 'NewsListRouter',
        page: EmptyRouterPage,
        children: [
          AutoRoute(
            path: '',
            page: NewsListScreen,
          ),
          RedirectRoute(path: '*', redirectTo: ''),
        ],
      ),
      AutoRoute(
        path: 'tab2',
        name: 'SearchRouter',
        page: EmptyRouterPage,
        children: [
          AutoRoute(
              path: '',
              page: SearchScreen
          ),
          RedirectRoute(path: '*', redirectTo: ''),
        ],
      ),
      AutoRoute(
        path: 'tab3',
        name: 'SavedNewsRouter',
        page: EmptyRouterPage,
        children: [
          AutoRoute(
              path: '',
              page: SavedNewsScreen
          ),
          RedirectRoute(path: '*', redirectTo: ''),
        ],
      ),
    ]
);
