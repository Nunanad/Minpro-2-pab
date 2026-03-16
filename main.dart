import 'package:flutter/material.dart';
import 'pages/landing_page.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const MyGoatApp());
}

class MyGoatApp extends StatelessWidget {
  const MyGoatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MyGoat',
      theme: AppTheme.lightTheme,
      home: const LandingPage(),
    );
  }
}
