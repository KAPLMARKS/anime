import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:routemaster/routemaster.dart';

import '/presentation/home/home_view.dart';
import '/presentation/auth/auth_view.dart';

final navigationServiceProvider =
    Provider<NavigationService>(
        create: (ref) => NavigationServiceImpl(),
    );

abstract class NavigationService {
  String get initialRoute;

  RoutemasterDelegate get routeDelegate;

  RouteInformationParser<Object> get routeInformationParser;

  NavigationResult<Future<dynamic>?> openHome([bool replace = true]);
}

class NavigationServiceImpl implements NavigationService {
  @override
  final RoutemasterDelegate routeDelegate = RoutemasterDelegate(
    routesBuilder: (context) => RouteMap(routes: {
      '/': (context) => const MaterialPage(child: AuthView()),
      '/home': (context) => const MaterialPage(child: HomeView()),
    }),
  );

  @override
  final RouteInformationParser<Object> routeInformationParser =
      const RoutemasterParser();

  @override
  String get initialRoute => '/auth';

  @override
  NavigationResult<Future<dynamic>?> openHome([bool replace = true]) {
    if (replace) {
      return routeDelegate.push('/home');
    } else {
      return routeDelegate.push('/');
    }
  }
}
