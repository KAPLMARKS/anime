import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/domain/services/api/api_service.dart';
import '/domain/services/navigation_service.dart';

extension _NavigationServiceContext on BuildContext {
  NavigationService get navigationService => read();
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  void run() => runApp(
        MultiProvider(
          providers: [
            navigationServiceProvider,
            apiServiceProvider,
          ],
          child: this,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: context.navigationService.routeDelegate,
      routeInformationParser: context.navigationService.routeInformationParser,
    );
  }
}
