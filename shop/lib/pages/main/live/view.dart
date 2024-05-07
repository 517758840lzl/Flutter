import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shop/core/util/theme_color.dart';
import '../../../core/util/image_assets.dart';

import 'logic.dart';

class LivePage extends StatelessWidget with BiliBiliAppTheme ,ImageAssets{
  LivePage({Key? key}) : super(key: key);

  final logic = Get.find<LiveLogic>();
  final state = Get.find<LiveLogic>().state;

  @override
  Widget build(BuildContext context) {
    // return Center(
    //   child: Column(
    //     children: [expandDemo()],
    //   ),
    // );
    return  Stack(
    children: [
    // Positioned(
    //     width: 90.r,
    //     height: 90.r,
    //     left: 0,
    //     bottom: 0,
    //     child: Image.asset(
    //       state.isInputPassword.value ? close22PNG : open22PNG,
    //       gaplessPlayback: true,
    //     )),
    Center(
    child: Image.asset(
    bilibiliPNG,
    width: 90.r,
    height: 90.r,
    ),
    ),
    // Positioned(
    //     width: 90.r,
    //     height: 90.r,
    //     right: 0,
    //     bottom: 0,
    //     child: Image.asset(
    //       state.isInputPassword.value ? close33PNG : open33PNG,
    //       gaplessPlayback: true,
    //     )),
    ],
    );
  }

  Widget buildHomeAgreement() {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: "我已经阅读并同意",
            style: TextStyle(color: norGrayColor, fontSize: 10.r),
          ),
          TextSpan(
            text: "用户协议、隐私政策",
            style: TextStyle(color: norBlue01Colors, fontSize: 10.r),
          ),
          TextSpan(
            text: "和",
            style: TextStyle(color: norGrayColor, fontSize: 10.r),
          ),
          TextSpan(
            text: "中国移动号码认证系列服务协议",
            style: TextStyle(color: norBlue01Colors, fontSize: 10.r),
          ),
          TextSpan(
            text: "未注册绑定的手机号验证成功后将自动注册",
            style: TextStyle(color: norGrayColor, fontSize: 10.r),
          ),
        ],
      ),
    );
  }

  Widget expandDemo() {
    return Row(
      children: [
        Container(
          color: Colors.blue,
          height: 50,
          width: 50,
        ),
        Expanded(
          child: Container(
            color: Colors.red,
            height: 50,
          ),
        ),
        Container(
          color: Colors.green,
          height: 50,
          width: 340,
        ),
      ],
    );

  }
}
