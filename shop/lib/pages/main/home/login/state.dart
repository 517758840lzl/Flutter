import 'package:flutter/cupertino.dart';
import 'package:shop/pages/main/home/login/region_model.dart';

import 'package:get/get.dart';

class LoginState {
  var regionList = <RegionModel>[
  RegionModel("中国大陆", "+86"),
  RegionModel("美国", "+21"),
  RegionModel("意大利", "+156"),
  RegionModel("西班牙", "+56"),
  RegionModel("泰国", "+65"),
  RegionModel("韩国", "+53"),
  RegionModel("英国", "+78"),
  RegionModel("印度", "+12"),
  RegionModel("埃及", "+82"),
  ].obs;

  var regionIndex = 0.obs;

  var isAgree = true.obs;
  var isObscure = true.obs;
  var isInputPassword = false.obs;
  var telFocusNode = FocusNode();
  var userNameFocusNode = FocusNode();
  var passwordFocusNode = FocusNode();

  var loginTypeIsMessage = true.obs;

  var telText = "".obs;

  var verifyText = "".obs;

  ///用户名
  var userNameText = "".obs;

  ///登录密码
  var passwordText = "".obs;
}
