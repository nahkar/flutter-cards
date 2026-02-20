import 'package:cards/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'My App',
      theme: AppTheme.lightTheme,
      routerConfig: router,
    );
  }
}