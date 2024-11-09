import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:oraxcrm/app/app.dart';
import 'package:shorebird_code_push/shorebird_code_push.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  await Supabase.initialize(
    url: 'https://aqmicofvwznoxawlsfds.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImFxbWljb2Z2d3pub3hhd2xzZmRzIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Mjc4MjI5MzQsImV4cCI6MjA0MzM5ODkzNH0.PXPgFb8sI6Fu4JwDDj22APpim0hZiWYDMKoOVEoJSUo',
  );

  runApp(MyApp());
}

final shorebirdCodePush = ShorebirdCodePush();
final supabase = Supabase.instance.client;
