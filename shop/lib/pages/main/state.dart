import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/pages/main/dynamic_circle/view.dart';
import 'package:shop/pages/main/home/view.dart';
import 'package:shop/pages/main/mall/view.dart';
import 'package:shop/pages/main/mine/view.dart';
import 'package:shop/pages/main/publish/view.dart';
import 'package:shop/pages/main/search/view.dart';

class MainState {
  ///当前下标
   var currentIndex = 0.obs;

  ///主页界面子页面
  late List<Widget> mainPages;

  MainState() {
    mainPages = [
      HomePage(),
      Dynamic_circlePage(),
      PublishPage(),
      MallPage(),
      MinePage()
    ];
  }
}
