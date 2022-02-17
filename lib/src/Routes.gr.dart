// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;

import 'view/screen/SecondScreen.dart' as _i2;
import 'view/screen/SplashScreen.dart' as _i1;

class AppRouter extends _i3.RootStackRouter {
  AppRouter([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    SplashScreenRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.SplashScreen());
    },
    SecondScreenRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.SecondScreen());
    }
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig('/#redirect',
            path: '/', redirectTo: 'splash', fullMatch: true),
        _i3.RouteConfig(SplashScreenRoute.name, path: 'splash'),
        _i3.RouteConfig(SecondScreenRoute.name, path: 'second')
      ];
}

/// generated route for
/// [_i1.SplashScreen]
class SplashScreenRoute extends _i3.PageRouteInfo<void> {
  const SplashScreenRoute() : super(SplashScreenRoute.name, path: 'splash');

  static const String name = 'SplashScreenRoute';
}

/// generated route for
/// [_i2.SecondScreen]
class SecondScreenRoute extends _i3.PageRouteInfo<void> {
  const SecondScreenRoute() : super(SecondScreenRoute.name, path: 'second');

  static const String name = 'SecondScreenRoute';
}
