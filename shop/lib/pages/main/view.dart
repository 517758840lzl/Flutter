import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../core/util/size.dart';
import '../../core/util/theme_color.dart';
import '../../widget/alive_wrapper.dart';
import 'logic.dart';

class MainPage extends GetView with SizeConstantUtil,BiliBiliAppTheme {
  MainPage({Key? key}) : super(key: key);

  final logic = Get.find<MainLogic>();
  final state = Get.find<MainLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      resizeToAvoidBottomInset: false,
      // body: PageView(
      //   physics: const NeverScrollableScrollPhysics(),
      //   controller: logic.controller.value,
      //   onPageChanged: (index) {
      //     logic.currentPage.value = index;
      //   },
      //   children: state.mainPages,
      //
      // ),
      body: AutoKeepAliveWrapper(
        child: PageTransitionSwitcher(
          duration: const Duration(milliseconds: 0),
          transitionBuilder: (child, animation, secondaryAnimation) =>
              FadeTransition(opacity: animation, child: child),
          child: state.mainPages[state.currentIndex.value],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: selectFontSizeCons.r,
        unselectedFontSize: unSelectFontSizeCons.r,
        selectedItemColor: norMainThemeColors,
        type: BottomNavigationBarType.fixed,
        currentIndex: logic.currentPage.value,
        items: [
          _buildBottomNavigationBarItem("首页", "home"),
          _buildBottomNavigationBarItem("动态", "dynamic"),
          _buildBottomNavigationBarCenterBarItem(),
          _buildBottomNavigationBarItem("vip", "vip"),
          _buildBottomNavigationBarItem("我的", "mine"),
        ],
        onTap: (index) => {
          logic.currentPage.value = index,
          //  使用page可以使用这种方式
          // logic.controller.value.jumpToPage(index),
          logic.showPageWithIndex(index),
        },
      ),
    ));
  }

  /// 创建底部的tarbar
  BottomNavigationBarItem _buildBottomNavigationBarItem (String title, String iconName) {
    return BottomNavigationBarItem(
      label: title.toUpperCase(),
      icon: Image.asset(
        "assets/image/icon/${iconName}_custom.png",
        width: unselectIconSizeCons.r,
        height: unselectIconSizeCons.r,
        /// 原图片保持不变，直到图片加载完成时替换图片，这样就不会出现闪烁
        gaplessPlayback: true,
      ),
      activeIcon: Image.asset(
        "assets/image/icon/${iconName}_selected.png",
        width: selectIconSizeCons.r,
        height: selectIconSizeCons.r,
        gaplessPlayback: true,
      ),
    );
  }
  /// 创建发布按钮
  BottomNavigationBarItem _buildBottomNavigationBarCenterBarItem() {
    const String addCustomPNG = "assets/image/icon/add_custom.png";
    return BottomNavigationBarItem(
      backgroundColor: Colors.red,
      label: "",
      icon: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15).r,
        decoration: BoxDecoration(
          color: norMainThemeColors,
          borderRadius: BorderRadius.all(Radius.circular(15.r)),
        ),
        child: Image.asset(
          addCustomPNG,
          width: unselectIconSizeCons.r,
          height: unselectIconSizeCons.r,
        ),
      ),
    );
  }
}
