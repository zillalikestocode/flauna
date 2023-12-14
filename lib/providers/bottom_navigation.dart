import 'package:flutter/material.dart';

class BottomNavigationBarProvider extends ChangeNotifier {
  int currentIndex;
  BottomNavigationBarProvider({this.currentIndex = 0});

  void setIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }
}
