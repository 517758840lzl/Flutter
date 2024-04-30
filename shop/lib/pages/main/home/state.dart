import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

class HomeState {

  RxString searchKeyWorld = "".obs;

  RxList<Widget> scrollChildKeys = const [
    Tab(text: "直播",),
    Tab(text: "推荐",),
    Tab(text: "热门",),
    Tab(text: "动画",),
    Tab(text: "影视",),
    Tab(text: "抗疫",),
    Tab(text: "新征程",),
  ].obs;

  HomeState() {

  }


}
