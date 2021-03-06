import 'package:flutter/cupertino.dart';

class HomeChangeNotifier extends ChangeNotifier {
  int _count = 0;

  Future<void> increment() async {
    _count += 1;
    notifyListeners();
  }

  int get count {
    return _count;
  }
}
