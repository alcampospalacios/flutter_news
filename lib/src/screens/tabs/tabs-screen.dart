import 'package:flutter/material.dart';
import 'package:news/src/core/models/tabs-navegation-model.dart';
import 'package:news/src/core/services/news-services.dart';
import 'package:news/src/screens/tabs/tab1/tab1-screen.dart';
import 'package:provider/provider.dart';

class TabsScreen extends StatelessWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TabsNavegationModel(),
      child: Scaffold(
        body: _Pages(),
        bottomNavigationBar: _NavegationBarTabs(),
      ),
    );
  }
}

class _NavegationBarTabs extends StatelessWidget {
  const _NavegationBarTabs({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navegationModel = Provider.of<TabsNavegationModel>(context);

    return BottomNavigationBar(
        currentIndex: navegationModel.currentPage,
        onTap: (value) => navegationModel.currentPage = value,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline), label: 'Para ti'),
          BottomNavigationBarItem(icon: Icon(Icons.public), label: 'Para ti')
        ]);
  }
}

class _Pages extends StatelessWidget {
  const _Pages({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navegationModel = Provider.of<TabsNavegationModel>(context);

    return PageView(
      controller: navegationModel.pageController,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[Tab1Screen(), Container(color: Colors.blue)],
    );
  }
}

// 6f6607db969e4bd39160f8778c318f40
