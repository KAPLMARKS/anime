import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/presentation/home/home_view.dart';
import '/presentation/auth/auth_view.dart';

final navigationServiceProvider = Provider<NavigationService>((ref) => NavigationServiceImpl());

abstract class NavigationService {
  GlobalKey<NavigatorState> get navigatorKey;
  String get initialRoute;

  Route? onGenerateRoute(RouteSettings settings);

  Future<dynamic>? openHome([bool replace = true]);
}

class NavigationServiceImpl  implements NavigationService{

  @override
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  String get initialRoute => '/auth';

  @override
  Route? onGenerateRoute(RouteSettings settings) {
    if (settings.name == initialRoute) {
      return MaterialPageRoute(
        builder: (context) => const AuthView(),
      );
    } else {
      return MaterialPageRoute(
        builder: (context) => const HomeView(),
      );
    }
  }

  @override
  Future<dynamic>? openHome([bool replace = true]) {
    if(replace) {
      return navigatorKey.currentState?.pushReplacementNamed('/');
    } else {
      return navigatorKey.currentState?.pushNamed('/');
    }
  }
}