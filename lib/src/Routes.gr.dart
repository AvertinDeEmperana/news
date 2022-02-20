// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i8;

import 'model/Article.dart' as _i9;
import 'view/screen/group_screens/GroupScreen.dart' as _i3;
import 'view/screen/group_screens/NewsListScreen.dart' as _i5;
import 'view/screen/group_screens/SavedNewsScreen.dart' as _i7;
import 'view/screen/group_screens/SearchScreen.dart' as _i6;
import 'view/screen/NewsDetailsScreen.dart' as _i2;
import 'view/screen/SplashScreen.dart' as _i1;
import 'view_model/NewsListVM.dart' as _i10;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i8.GlobalKey<_i8.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    SplashScreenRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.SplashScreen());
    },
    NewsDetailsScreenRoute.name: (routeData) {
      final args = routeData.argsAs<NewsDetailsScreenRouteArgs>();
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i2.NewsDetailsScreen(
              key: args.key,
              article: args.article,
              theNewsListVM: args.theNewsListVM));
    },
    GroupScreenRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<GroupScreenRouteArgs>(
          orElse: () => GroupScreenRouteArgs(id: pathParams.getString('id')));
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i3.GroupScreen(key: args.key, id: args.id));
    },
    NewsListRouter.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.EmptyRouterPage());
    },
    SearchRouter.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.EmptyRouterPage());
    },
    SavedNewsRouter.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.EmptyRouterPage());
    },
    NewsListScreenRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.NewsListScreen());
    },
    SearchScreenRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.SearchScreen());
    },
    SavedNewsScreenRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.SavedNewsScreen());
    }
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig('/#redirect',
            path: '/', redirectTo: 'splash', fullMatch: true),
        _i4.RouteConfig(SplashScreenRoute.name, path: 'splash'),
        _i4.RouteConfig(NewsDetailsScreenRoute.name,
            path: 'newsdetails/:article'),
        _i4.RouteConfig(GroupScreenRoute.name, path: 'group/:id', children: [
          _i4.RouteConfig(NewsListRouter.name,
              path: 'tab1',
              parent: GroupScreenRoute.name,
              children: [
                _i4.RouteConfig(NewsListScreenRoute.name,
                    path: '', parent: NewsListRouter.name),
                _i4.RouteConfig('*#redirect',
                    path: '*',
                    parent: NewsListRouter.name,
                    redirectTo: '',
                    fullMatch: true)
              ]),
          _i4.RouteConfig(SearchRouter.name,
              path: 'tab2',
              parent: GroupScreenRoute.name,
              children: [
                _i4.RouteConfig(SearchScreenRoute.name,
                    path: '', parent: SearchRouter.name),
                _i4.RouteConfig('*#redirect',
                    path: '*',
                    parent: SearchRouter.name,
                    redirectTo: '',
                    fullMatch: true)
              ]),
          _i4.RouteConfig(SavedNewsRouter.name,
              path: 'tab3',
              parent: GroupScreenRoute.name,
              children: [
                _i4.RouteConfig(SavedNewsScreenRoute.name,
                    path: '', parent: SavedNewsRouter.name),
                _i4.RouteConfig('*#redirect',
                    path: '*',
                    parent: SavedNewsRouter.name,
                    redirectTo: '',
                    fullMatch: true)
              ])
        ])
      ];
}

/// generated route for
/// [_i1.SplashScreen]
class SplashScreenRoute extends _i4.PageRouteInfo<void> {
  const SplashScreenRoute() : super(SplashScreenRoute.name, path: 'splash');

  static const String name = 'SplashScreenRoute';
}

/// generated route for
/// [_i2.NewsDetailsScreen]
class NewsDetailsScreenRoute
    extends _i4.PageRouteInfo<NewsDetailsScreenRouteArgs> {
  NewsDetailsScreenRoute(
      {_i8.Key? key,
      required _i9.Article article,
      required _i10.NewsListVM theNewsListVM})
      : super(NewsDetailsScreenRoute.name,
            path: 'newsdetails/:article',
            args: NewsDetailsScreenRouteArgs(
                key: key, article: article, theNewsListVM: theNewsListVM));

  static const String name = 'NewsDetailsScreenRoute';
}

class NewsDetailsScreenRouteArgs {
  const NewsDetailsScreenRouteArgs(
      {this.key, required this.article, required this.theNewsListVM});

  final _i8.Key? key;

  final _i9.Article article;

  final _i10.NewsListVM theNewsListVM;

  @override
  String toString() {
    return 'NewsDetailsScreenRouteArgs{key: $key, article: $article, theNewsListVM: $theNewsListVM}';
  }
}

/// generated route for
/// [_i3.GroupScreen]
class GroupScreenRoute extends _i4.PageRouteInfo<GroupScreenRouteArgs> {
  GroupScreenRoute(
      {_i8.Key? key, required String id, List<_i4.PageRouteInfo>? children})
      : super(GroupScreenRoute.name,
            path: 'group/:id',
            args: GroupScreenRouteArgs(key: key, id: id),
            rawPathParams: {'id': id},
            initialChildren: children);

  static const String name = 'GroupScreenRoute';
}

class GroupScreenRouteArgs {
  const GroupScreenRouteArgs({this.key, required this.id});

  final _i8.Key? key;

  final String id;

  @override
  String toString() {
    return 'GroupScreenRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i4.EmptyRouterPage]
class NewsListRouter extends _i4.PageRouteInfo<void> {
  const NewsListRouter({List<_i4.PageRouteInfo>? children})
      : super(NewsListRouter.name, path: 'tab1', initialChildren: children);

  static const String name = 'NewsListRouter';
}

/// generated route for
/// [_i4.EmptyRouterPage]
class SearchRouter extends _i4.PageRouteInfo<void> {
  const SearchRouter({List<_i4.PageRouteInfo>? children})
      : super(SearchRouter.name, path: 'tab2', initialChildren: children);

  static const String name = 'SearchRouter';
}

/// generated route for
/// [_i4.EmptyRouterPage]
class SavedNewsRouter extends _i4.PageRouteInfo<void> {
  const SavedNewsRouter({List<_i4.PageRouteInfo>? children})
      : super(SavedNewsRouter.name, path: 'tab3', initialChildren: children);

  static const String name = 'SavedNewsRouter';
}

/// generated route for
/// [_i5.NewsListScreen]
class NewsListScreenRoute extends _i4.PageRouteInfo<void> {
  const NewsListScreenRoute() : super(NewsListScreenRoute.name, path: '');

  static const String name = 'NewsListScreenRoute';
}

/// generated route for
/// [_i6.SearchScreen]
class SearchScreenRoute extends _i4.PageRouteInfo<void> {
  const SearchScreenRoute() : super(SearchScreenRoute.name, path: '');

  static const String name = 'SearchScreenRoute';
}

/// generated route for
/// [_i7.SavedNewsScreen]
class SavedNewsScreenRoute extends _i4.PageRouteInfo<void> {
  const SavedNewsScreenRoute() : super(SavedNewsScreenRoute.name, path: '');

  static const String name = 'SavedNewsScreenRoute';
}
