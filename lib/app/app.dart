// import 'package:bible_journey/app/routes.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
//
// class MyApp extends StatefulWidget {
//   const MyApp({super.key});
//
//   @override
//   State<MyApp> createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       localizationsDelegates: context.localizationDelegates,
//       supportedLocales: context.supportedLocales,
//       locale: context.locale,
//       debugShowCheckedModeBanner: false,
//       onGenerateRoute: AppRoutes.generateRoute,
//       initialRoute: AppRoutes.splash,
//       //home: const SplashScreen(),
//     );
//   }
// }

import 'package:bible_journey/app/routes.dart';
import 'package:flutter/material.dart';
import 'package:app_links/app_links.dart';
import 'dart:async';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AppLinks _appLinks = AppLinks();
  StreamSubscription? _sub;

  @override
  void initState() {
    super.initState();
    _handleIncomingLinks();
  }

  void _handleIncomingLinks() {
    _sub = _appLinks.uriLinkStream.listen((uri) {
      _sub = _appLinks.uriLinkStream.listen((uri) {
        print('Received deep link: $uri');
      });
      if (uri != null && uri.path == '/payment-success') {
        String? orderId = uri.queryParameters['order_id'];
        Navigator.pushNamed(context, AppRoutes.mainBottomNavScreen, arguments: orderId);
      }
    });
  }

  @override
  void dispose() {
    _sub?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: AppRoutes.generateRoute,
      initialRoute: AppRoutes.splash,
    );
  }
}


