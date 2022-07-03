import 'package:flutter/widgets.dart';

abstract class NavigationService {
  Key get navigatorKey;
  String get initialRoute;

  Route? onGenerateRoute(RouteSettings settings);

  Future openHome([bool replace = true]);
}