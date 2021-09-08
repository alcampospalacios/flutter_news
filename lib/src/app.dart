import 'package:flutter/material.dart';
import 'package:news/src/core/services/news-services.dart';
import 'package:news/src/core/utils/theme/custom-theme.dart';
import 'package:news/src/routes/routes.dart';
import 'package:provider/provider.dart';

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => NewsServices())],
      child: MyApp(),
    );
  }
}

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
