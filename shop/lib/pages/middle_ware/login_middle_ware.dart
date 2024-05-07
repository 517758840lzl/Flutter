

//登录中间件
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:shop/core/util/theme_color.dart';

import '../../core/router/page_name.dart';
import '../../core/util/bilibili_share_key_name.dart';
import '../../core/util/image_assets.dart';
import '../../core/util/shared_preference.dart';
import '../../core/util/size.dart';
import '../../widget/retangle_checkbox.dart';

class LoginAuthMiddleWare extends GetMiddleware with RouteName{
  @override
  RouteSettings? redirect(String? route) {
    /// 是否登录
    bool isLogin =
        SharedPreferenceUtil.getBool(BilibiliSharedPreference.isLogin) ?? false;
    Future.delayed(const Duration(seconds: 1),
            () => Get.snackbar("提示", "请先登录，账号/密码:admin/admin"));
    return isLogin ? null : RouteSettings(name: RouteName.LOGIN);
  }
}

class LoginWidget with SizeConstantUtil, BiliBiliAppTheme, ImageAssets {
  void goToLogin() {
    SmartDialog.showLoading(
        displayTime: const Duration(milliseconds: 200),
        /// 背景色
        maskColor:  const Color.fromRGBO(0, 0, 0, .4),
        builder: (context) {
          return Container(
            decoration: BoxDecoration(
              color: const Color.fromRGBO(0, 0, 0, .8),
              borderRadius: BorderRadius.all(
                Radius.circular(8.r),
              ),
            ),
            height: 80.r,
            width: 80.r,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  ploadingGif,
                  width: 35.r,
                  height: 35.r,
                ),
                10.verticalSpace,
                Text(
                  "  正在加载...",
                  style: TextStyle(
                    color: norGrayColor,
                    fontSize: customFontSizeCons.r,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          );
        }
    ).whenComplete(() {
      if (defaultTargetPlatform == TargetPlatform.android ||
          defaultTargetPlatform == TargetPlatform.iOS) {
        SmartDialog.dismiss();
        SmartDialog.show(
          builder: (ctx) {
            return buildHomeOneClickLogin();
          },
        );
      } else {
        Get.toNamed(RouteName.LOGIN);
      }
    });

  }

  Widget buildHomeOneClickLogin() {
    bool? flag=true;
    return Card(
      child: Container(
        padding: EdgeInsets.all(10.r),
        width: 270.r,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(15.r),
              child: Column(
                /// 主轴方向尽可能的小，让其内容撑起来
                mainAxisSize: MainAxisSize.min,
                /// 这里如果有副轴的宽度足够大，就可以不用设置stack alignment: Alignment.center, 居中属性了，但是没有
                children: [
                  Text("登录注册解锁更多精彩内容",
                    style: TextStyle(
                      color: norTextColors,
                      fontSize: titleFontSizeCons.r,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 30.r, bottom: 20.r),
                    child: Text(
                      "183****1731",
                      style: TextStyle(fontSize: 18.sp, color: norTextColors),
                    ),
                  ),
                  TextButton(
                      onPressed:() {},
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                            EdgeInsets.symmetric(vertical: 10.r),
                          ),
                          backgroundColor: MaterialStateProperty.all(norMainThemeColors)),
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 2.r),
                        alignment: AlignmentDirectional.center,
                        width: 260.r,
                        child: Text(
                          "本机号码一键登录",
                          style: TextStyle(
                            color: norWhite01Color,
                            fontSize: titleFontSizeCons.r,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      )),
                  Container(
                    padding: EdgeInsets.only(top: 15.r, bottom: 20.r),
                    child: GestureDetector(
                      onTap: () {
                        Get.toNamed(RouteName.LOGIN);
                        SmartDialog.dismiss();
                      },
                      child: Text("其他方式登录",
                        style:
                        TextStyle(fontSize: 14.sp, color: norGray04Color),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RectangleCheckBox(
                        onTap: (value) { flag = value!;},
                        ///自定义矩形的checkbox
                        size: 14.r,
                        checkedColor: norMainThemeColors,
                        isChecked: flag,
                      ),
                      5.horizontalSpace,
                      buildHomeAgreement()
                    ],
                  ),
                ],),
            ),
            Positioned(
              right: 0.r,
              top: 0.r,
              child: GestureDetector(
                onTap: () {
                  SmartDialog.dismiss();
                },
                child: Icon(
                  Icons.close,
                  color: norGrayColor,
                  size: iconSizeCons.r,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  ///用户协议
  Widget buildHomeAgreement() {
    return Expanded(
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: "我已经阅读并同意",
              style: TextStyle(color: norGrayColor, fontSize: 10.r),
            ),

            TextSpan(
              text: "用户协议、隐私政策",
              style: TextStyle(color: norBlue01Colors, fontSize: 10.r),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Get.toNamed(RouteName.USERAGREEMENT,arguments: "用户协议、隐私政策");
                },

            ),
            TextSpan(
              text: "和",
              style: TextStyle(color: norGrayColor, fontSize: 10.r),
            ),
            TextSpan(
              text: "中国移动号码认证系列服务协议",
              style: TextStyle(color: norBlue01Colors, fontSize: 10.r),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Get.toNamed(RouteName.USERAGREEMENT,arguments: "中国移动号码认证系列服务协议");
                },
            ),
            TextSpan(
              text: "未注册绑定的手机号验证成功后将自动注册",
              style: TextStyle(color: norGrayColor, fontSize: 10.r),
            ),
          ],
        ),
      ),
    );
  }
}