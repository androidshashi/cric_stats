import 'package:flutter/cupertino.dart';

class BottomNavigationViewModel extends ChangeNotifier{
  /// Current index
  int _currentIndex = 0;

  /// Bottom navigation current index
  int get currentIndex => _currentIndex;

  /// set bottom nav current index
  void setCurrentIndex(int index)
  {
    _currentIndex= index;
    notifyListeners();
  }
}