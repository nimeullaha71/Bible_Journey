import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'app/app.dart';


// ⭐ GLOBAL navigator key (VERY IMPORTANT)
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en'),
        Locale('fr'),
        Locale('de'),
        Locale('it'),
        Locale('pt'),
        Locale('es'),
      ],
      path: 'lib/localization',
      fallbackLocale: const Locale('en'),
      child: const MyApp(),
    ),
  );
}
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:device_preview/device_preview.dart';
//
// import 'app/app.dart';
//
// // ⭐ GLOBAL navigator key
// final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await EasyLocalization.ensureInitialized();
//
//   runApp(
//     DevicePreview(
//       enabled: true, // ❗ Debug এ true, production এ false
//       builder: (context) => EasyLocalization(
//         supportedLocales: const [
//           Locale('en'),
//           Locale('fr'),
//           Locale('de'),
//           Locale('it'),
//           Locale('pt'),
//           Locale('es'),
//         ],
//         path: 'lib/localization',
//         fallbackLocale: const Locale('en'),
//         child: const MyApp(),
//       ),
//     ),
//   );
// }
