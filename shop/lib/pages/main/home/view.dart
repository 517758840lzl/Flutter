import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:shop/core/util/image_assets.dart';
import 'package:shop/pages/main/live/view.dart';

import '../../../core/router/page_name.dart';
import '../../../core/util/size.dart';
import '../../../core/util/theme_color.dart';
import '../../../widget/circle_button.dart';
import '../../middle_ware/login_middle_ware.dart';
import 'logic.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin ,
    BiliBiliAppTheme, ImageAssets, SizeConstantUtil {
  final logic = Get.find<HomeLogic>();

  final state = Get.find<HomeLogic>().state;

  late TabController _tabBarController;

  @override
  void initState() {
    _tabBarController = TabController(length: 7,vsync: this, initialIndex: 1);
    _tabBarController.addListener(() {

    });
    super.initState();
  }

  @override
  void didChangeDependencies() {

    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _tabBarController.removeListener(() { });
    _tabBarController.dispose();

    super.dispose();
  }
  /// 单纯的使用tarbar的话，当title个数过多的时候，是没有办法滑动的，使用NestedScrollView可以进行滑动。
  /// SliverToBoxAdapter 是在滑动的sliver中将一个非sliver的box转换为可滑动的sliver块
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: buildWhiteStatusBar(),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled)
        {
          return [
            //
            SliverToBoxAdapter(child: buildHomeTopAppBar()),
            SliverAppBar(
              title: buildHomeTabBar(),
              pinned: true,
              floating: false,
              snap: false,
              surfaceTintColor: norWhite01Color,
              backgroundColor: norWhite01Color,
              shadowColor: norWhite01Color,
              elevation: 0,
            ),
          ];
        },
        body: buildHomeTabBarView(),
      ),
    );
  }

  /// 顶部状态栏为白色
  buildWhiteStatusBar() {
    return AppBar(
      systemOverlayStyle: whiteTheme,
      toolbarHeight: 0,
      elevation: 0,
    );
  }

  ///圆形图标（登录图标)
  Widget buildHomeUserIcon() {
    return CircleInkWellButton(
      bgColor: norWhite06Color,
      onTap: () {
        LoginWidget().goToLogin();
      },
      width: 40.r,
      height: 40.r,
      child: Text(
        "登录",
        textAlign: TextAlign.center,
        maxLines: 1,
        style: TextStyle(
          fontWeight: FontWeight.normal,
          color: norMainThemeColors,
          fontSize: customFontSizeCons.r,
        ),
      ),
    );
  }

  /// 搜索框
  Widget buildSearchTextField() {
    return GestureDetector(
      onTap: () {
        logic.gotoSearch();
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 15.r),
        alignment: Alignment.centerLeft,
        height: 35.r,
        decoration: BoxDecoration(
          color: norWhite02Color,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.r),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10.r),
                child: Image.asset(
                  searchCustomPNG,
                  width: iconSizeCons.r,
                  height: iconSizeCons.r,
                  color: norGray02Color,
                ),
              ),
              GetBuilder<HomeLogic>(
                builder: (logic) {
                  return Text(
                    "请输入要搜索的内容",
                    style: TextStyle(
                      fontSize: subTitleFontSizeCons.r,
                      color: norGray02Color,
                      overflow: TextOverflow.ellipsis,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  ///
  Widget buildHomeTopAppBar() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.r, vertical: 5.r),
      width: 1.sw,
      color: norWhite01Color,
      child: Row(
        children: [
          buildHomeUserIcon(),
          Expanded(child: buildSearchTextField()),
          CircleInkWellButton(
            bgColor: norWhite06Color,
            onTap: () {},
            width: 40.r,
            height: 40.r,
            child: Image.asset(
              gameCustomPNG,
              width: iconSizeCons.r,
              height: iconSizeCons.r,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 15.r),
            child: Image.asset(
              width: iconSizeCons.r,
              height: iconSizeCons.r,
              mailCustomPNG,
            ),
          ),
        ],
      ),
    );
  }

  ///主页 顶部TabBar title
  Theme buildHomeTabBar() {
    return Theme(
      data: Theme.of(context).copyWith(
        colorScheme: ColorScheme.light(
          primary: norMainThemeColors,
          surface: norWhite01Color,
        ),
      ),
      child: TabBar(
        tabAlignment: TabAlignment.start,
        controller: _tabBarController,
        tabs: state.scrollChildKeys,
        indicatorPadding:
        EdgeInsets.only(bottom: 10.r, left: 15.r, right: 15.r),
        indicatorColor: norMainThemeColors,
        unselectedLabelColor: unselectedLabelColor,
        labelColor: norMainThemeColors,
        indicatorSize: TabBarIndicatorSize.tab,
        labelStyle: TextStyle(
          fontSize: selectTabBarFontSizeCons.r,
          fontWeight: FontWeight.normal,
          color: norMainThemeColors,
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: unSelectTabBarFontSizeCons.r,
          fontWeight: FontWeight.normal,
          color: norTextColors,
        ),
        isScrollable: true,
      ),
    );
  }

  ///home中主要显示的内容，与tabBar对应
  Widget buildHomeTabBarView() {
    ///未同意用户协议
    return TabBarView(
      controller: _tabBarController,
      children: [
        LivePage(),
        LivePage(),
        LivePage(),
        LivePage(),
        LivePage(),
        LivePage(),
        LivePage(),
      ],
    );
  }
}



