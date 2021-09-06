import 'package:flutter/material.dart';
import 'package:news/src/screens/home/home-screen.dart';
import 'package:news/src/screens/tabs/tabs-screen.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    'home': (_) => HomeScreen(),
    'tabs': (_) => TabsScreen()
  };
}
