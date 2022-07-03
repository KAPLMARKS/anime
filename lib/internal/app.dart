import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/presentation/auth/auth_view.dart';
import '/presentation/home/home_view.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  static final navigatorKey = GlobalKey<NavigatorState>();

  void run() => runApp(ProviderScope(
        child: this,
      ));

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      initialRoute: '/auth',
      onGenerateRoute: (settings) {
        if (settings.name == '/auth') {
          return MaterialPageRoute(
            builder: (context) => const AuthView(),
          );
        } else {
          return MaterialPageRoute(
            builder: (context) => const HomeView(),
          );
        }
      },
    );
  }
}
