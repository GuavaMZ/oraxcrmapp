import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:oraxcrm/app/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp());
}