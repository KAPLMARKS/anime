import '/domain/services/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

extension _NavigationServiceRef on WidgetRef {
  NavigationService get navigationService => read(navigationServiceProvider);
}

class App extends ConsumerWidget {

  const App({Key? key}) : super(key: key);

  void run() => runApp(ProviderScope(
        child: this,
      ));

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      navigatorKey: ref.navigationService.navigatorKey,
      initialRoute: ref.navigationService.initialRoute,
      onGenerateRoute: ref.navigationService.onGenerateRoute,
    );
  }
}
