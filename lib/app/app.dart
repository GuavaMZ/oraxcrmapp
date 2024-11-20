import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flutter_localization/flutter_localization.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:oraxcrm/presentation/resources/font_manager.dart';
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
  late final AppLifecycleListener _listener;
  late final StreamSubscription<InternetStatus> _subscription;

  @override
  void initState() {
    localization.init(mapLocales: [
      MapLocale('ar', AppStrings.AR, fontFamily: FontManager.arFont),
      MapLocale('en', AppStrings.EN, fontFamily: FontManager.currentFont)
    ], initLanguageCode: 'ar');
    localization.onTranslatedLanguage = _onTranslatedLanguage;

    _subscription =
        InternetConnection().onStatusChange.listen((InternetStatus status) {
      switch (status) {
        case InternetStatus.connected:
          break;
        case InternetStatus.disconnected:
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(AppStrings.noNetwork.getString(context))));
          break;
      }
    });

    _listener = AppLifecycleListener(
      onResume: _subscription.resume,
      // onHide: _subscription.pause,
      onPause: _subscription.pause,
    );
    super.initState();
  }

  void _onTranslatedLanguage(Locale? locale) {
    setState(() {});
  }

  @override
  void dispose() {
    _subscription.cancel();
    _listener.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: Routes.router,
      supportedLocales: localization.supportedLocales,
      localizationsDelegates: localization.localizationsDelegates,
      theme: ThemeData(
          fontFamily: localization.currentLocale.toString() == 'en'
              ? FontManager.currentFont
              : FontManager.arFont),
      locale: localization.currentLocale,
    );
  }
}
