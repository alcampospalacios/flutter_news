import 'package:flutter/material.dart';

class TabsNavegationModel extends ChangeNotifier {
  PageController _pageController = new PageController();

  int _currentPage = 0;

// Getter and setter _currentPage
  int get currentPage => _currentPage;
  set currentPage(int value) {
    _currentPage = value;
    _pageController.animateToPage(value,
        duration: Duration(milliseconds: 250), curve: Curves.easeInOut);
    notifyListeners();
  }

  // Getter _pageController
  PageController get pageController => _pageController;
}
