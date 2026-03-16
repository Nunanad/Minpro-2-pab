import 'package:flutter/material.dart';
import 'pages/landing_page.dart';
import 'theme/app_theme.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://hpnkpdboaywyjevplbpk.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImhwbmtwZGJvYXl3eWpldnBsYnBrIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzM2NDU3MjMsImV4cCI6MjA4OTIyMTcyM30.hV8uz4Fi_sqXn5jtpauUpd0xOBi2WmYldgHf4O1Bado',
  );
  runApp(const MyGoatApp());
}

class MyGoatApp extends StatefulWidget {
  const MyGoatApp({super.key});

  static _MyGoatAppState? of(BuildContext context) {
    return context.findAncestorStateOfType<_MyGoatAppState>();
  }

  @override
  State<MyGoatApp> createState() => _MyGoatAppState();
}

class _MyGoatAppState extends State<MyGoatApp> {

  ThemeMode themeMode = ThemeMode.system;

  void toggleTheme() {
    setState(() {
      themeMode =
          themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
  title: 'MyGoat',

  theme: ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.green,
  ),

  darkTheme: ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.green,
  ),

  themeMode: themeMode,

  home: const LandingPage(),
  debugShowCheckedModeBanner: false,
);
  }
}