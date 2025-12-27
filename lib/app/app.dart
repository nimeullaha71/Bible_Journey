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

// import 'package:bible_journey/app/routes.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:app_links/app_links.dart';
// import 'dart:async';

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});
//
//   @override
//   State<MyApp> createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   final AppLinks _appLinks = AppLinks();
//   StreamSubscription? _sub;
//
//   @override
//   void initState() {
//     super.initState();
//     _handleIncomingLinks();
//   }
//
//   void _handleIncomingLinks() {
//     _sub = _appLinks.uriLinkStream.listen((uri) {
//       _sub = _appLinks.uriLinkStream.listen((uri) {
//         print('Received deep link: $uri');
//       });
//       if (uri != null && uri.path == '/payment-success') {
//         String? orderId = uri.queryParameters['order_id'];
//         Navigator.pushNamed(context, AppRoutes.mainBottomNavScreen, arguments: orderId);
//       }
//     });
//   }
//
//   @override
//   void dispose() {
//     _sub?.cancel();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//
//       localizationsDelegates: context.localizationDelegates,
//       supportedLocales: context.supportedLocales,
//       locale: context.locale,
//
//       onGenerateRoute: AppRoutes.generateRoute,
//       initialRoute: AppRoutes.splash,
//     );
//   }
// }

import 'dart:async';

import 'package:app_links/app_links.dart';
import 'package:bible_journey/app/routes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../main.dart';
//
// class MyApp extends StatefulWidget {
//   const MyApp({super.key});
//
//   @override
//   State<MyApp> createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   final AppLinks _appLinks = AppLinks();
//   StreamSubscription<Uri>? _linkSub;
//
//   @override
//   void initState() {
//     super.initState();
//     _listenDeepLinks();
//   }
//
//   /// Listen deep links (Android + iOS)
//   void _listenDeepLinks() {
//     _linkSub = _appLinks.uriLinkStream.listen(
//           (Uri uri) {
//         debugPrint('Received deep link: $uri');
//         _handleDeepLink(uri);
//       },
//       onError: (error) {
//         debugPrint('Deep link error: $error');
//       },
//     );
//   }
//
//   void _handleDeepLink(Uri uri) {
//     // biblejourney://payment-success?order_id=123
//     if (uri.scheme == 'biblejourney' &&
//         uri.host == 'payment-success') {
//
//       final String? orderId = uri.queryParameters['order_id'];
//
//       WidgetsBinding.instance.addPostFrameCallback((_) {
//         Navigator.pushNamed(
//           context,
//           AppRoutes.mainBottomNavScreen,
//           arguments: orderId,
//         );
//       });
//     }
//   }
//
//   @override
//   void dispose() {
//     _linkSub?.cancel();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//
//       localizationsDelegates: context.localizationDelegates,
//       supportedLocales: context.supportedLocales,
//       locale: context.locale,
//
//       onGenerateRoute: AppRoutes.generateRoute,
//       initialRoute: AppRoutes.splash,
//     );
//   }
// }
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AppLinks _appLinks = AppLinks();
  StreamSubscription<Uri>? _linkSub;

  @override
  void initState() {
    super.initState();
    _listenDeepLinks();
  }

  void _listenDeepLinks() {
    _linkSub = _appLinks.uriLinkStream.listen(
          (Uri uri) {
        debugPrint('Deep link received: $uri');
        _handleDeepLink(uri);
      },
      onError: (error) {
        debugPrint('Deep link error: $error');
      },
    );
  }

  void _handleDeepLink(Uri uri) {
    // biblejourney://payment-success?order_id=123
    if (uri.scheme == 'biblejourney' &&
        uri.host == 'payment-success') {

     // final String? orderId = uri.queryParameters['order_id'];

      Future.microtask(() {
        navigatorKey.currentState?.pushNamedAndRemoveUntil(
          AppRoutes.mainBottomNavScreen,
              (route) => false,
       //   arguments: orderId,
        );
      });
    }
  }

  @override
  void dispose() {
    _linkSub?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey, // ⭐ REQUIRED
      debugShowCheckedModeBanner: false,

      // Localization
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,

      // Routing
      onGenerateRoute: AppRoutes.generateRoute,
      initialRoute: AppRoutes.splash,
    );
  }
}


