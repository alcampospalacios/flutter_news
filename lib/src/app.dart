import 'package:flutter/material.dart';
import 'package:news/src/core/utils/theme/custom-theme.dart';
import 'package:news/src/routes/routes.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'News',
        theme: customTheme,
        initialRoute: 'tabs',
        routes: getApplicationRoutes());
  }
}
