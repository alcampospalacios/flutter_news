import 'package:flutter/material.dart';
import 'package:news/src/core/models/tabs-navegation-model.dart';
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
    return PageView(
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        Container(color: Colors.red),
        Container(color: Colors.blue)
      ],
    );
  }
}
