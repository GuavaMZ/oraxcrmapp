import 'package:flutter/material.dart';

import 'package:flutter_localization/flutter_localization.dart';
import 'package:go_router/go_router.dart';
import 'package:oraxcrm/presentation/resources/routes_manager.dart';
import 'package:oraxcrm/presentation/resources/string_manager.dart';

final FlutterLocalization localization = FlutterLocalization.instance;

class MyApp extends StatefulWidget {
  MyApp._internal();

  int appState = 0;

  static final MyApp _instance = MyApp._internal();

  factory MyApp() => _instance;

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
        localization.init(mapLocales: [
      MapLocale('ar', AppStrings.AR,
          /*fontFamily: FontConstants.arabicFontFamily*/),
      MapLocale('en', AppStrings.EN, /*fontFamily: FontConstants.outfitFontFamily*/)
    ], initLanguageCode: 'en');
    localization.onTranslatedLanguage = _onTranslatedLanguage;
    super.initState();
  }

    void _onTranslatedLanguage(Locale? locale) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: Routes.router,
      supportedLocales: localization.supportedLocales,
      localizationsDelegates: localization.localizationsDelegates,
    );
  }
}
