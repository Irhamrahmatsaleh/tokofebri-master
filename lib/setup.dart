import 'package:flutter/material.dart';

import 'app/module/splash/view/splash_view.dart';

Future initApplication() async {}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
final navigator = navigatorKey.currentState!;

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      home: const SplashScreen(),
    );
  }
}
