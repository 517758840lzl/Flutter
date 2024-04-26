import 'package:flutter/cupertino.dart';

class shareData extends ChangeNotifier {
   int _count = 100;

   String _name = "zhangsan";

  int get count => _count;

  set count(int value) {
    _count = value;
    // 通知所有监听者
    notifyListeners();
  }

  String get name => _name;

  set name(String value) {
    _name = value;
    // 通知所有监听者
    notifyListeners();
  }
}

class UserInfo extends ChangeNotifier {
  String _name = "张三";

  String get name => _name;

  set name(String value) {
    _name = value;
    notifyListeners();
  }
}