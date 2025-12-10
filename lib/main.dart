import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';

import 'app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en'), // English
        Locale('fr'), // French
        Locale('de'), // German
        Locale('it'), // Italian
        Locale('pt'), // Portuguese
        Locale('es'), // Spanish
      ],
      path: 'lib/localization',
      fallbackLocale: const Locale('en'),
      child:  MyApp(),
    ),
  );
}
