import 'package:auto_route/auto_route.dart';
import 'package:news/src/view/screen/SecondScreen.dart';
import 'package:news/src/view/screen/SplashScreen.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route,Screen',
  routes: <AutoRoute>[
    AutoRoute(path: 'splash', page: SplashScreen, initial: true),
    AutoRoute(path: 'second', page: SecondScreen),
    /*AutoRoute(path: 'newsdetails', page: NewsDetail),
    groupTabRouter,*/
  ],
)

class $AppRouter {}

/*const groupTabRouter = AutoRoute(
    path: 'group/:id',
    page: GroupScreen,
    children: [
      AutoRoute(
        path: 'tab1',
        name: 'GroupTab1Router',
        page: EmptyRouterPage,
        children: [
          AutoRoute(
            path: '',
            page: NewsList,
          ),
          RedirectRoute(path: '*', redirectTo: ''),
        ],
      ),
      AutoRoute(
        path: 'tab2',
        name: 'GroupTab2Router',
        page: EmptyRouterPage,
        children: [
          AutoRoute(
              path: '',
              page: Tab2Screen
          ),
          RedirectRoute(path: '*', redirectTo: ''),
        ],
      ),
      AutoRoute(
        path: 'tab3',
        name: 'GroupTab3Router',
        page: EmptyRouterPage,
        children: [
          AutoRoute(
              path: '',
              page: Tab3Screen
          ),
          RedirectRoute(path: '*', redirectTo: ''),
        ],
      ),
    ]
);*/
