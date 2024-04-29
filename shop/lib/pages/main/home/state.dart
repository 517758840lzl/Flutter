import 'package:flutter/material.dart';
import 'package:shop/pages/main/dynamic_circle/view.dart';
import 'package:shop/pages/main/home/view.dart';
import 'package:shop/pages/main/mall/view.dart';
import 'package:shop/pages/main/mine/view.dart';
import 'package:shop/pages/main/publish/view.dart';

class HomeState {
  ///当前下标
  late int currentIndex;

  ///主页界面子页面
  late List<Widget> mainPages;

  HomeState() {
    currentIndex = 0;

    mainPages = [
      HomePage(),
      Dynamic_circlePage(),
      PublishPage(),
      MallPage(),
      MinePage()
    ];
  }


}
