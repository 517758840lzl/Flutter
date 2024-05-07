import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../core/util/transform.dart';
import 'state.dart';

class LoginLogic extends GetxController{

  @override
  void onInit() {
    initFocusNode();
    super.onInit();
  }

  final LoginState state = LoginState();

  void selectedRegionIndex(int index) {
    state.regionIndex.value = index;
  }

  void changeLoginType(BuildContext context) {
      state.loginTypeIsMessage.value = !state.loginTypeIsMessage.value;
      clearFocus(context);
  }
  ///监听用户名称输入
  updateUserName(String text) {
    state.userNameText.value = text;
  }

  ///监听密码输入
  updatePassword(String text) {
    state.passwordText.value = text;
  }

  ///监听电话输入
  updateTel(String text) {
    state.telText.value = text;
  }

  ///监听验证码输入
  updateVerifyText(String text) {
    state.verifyText.value = text;
  }

  ///是否同意协议
  changeIsAgree() {
    state.isAgree.value = !state.isAgree.value;
  }

  ///监听是否在输入密码或验证码
  initFocusNode() {

    state.telFocusNode.addListener(() {
      if (state.telFocusNode.hasFocus) {
        state.isInputPassword.value = false;
        print("telFocusNode = ${state.isInputPassword.value}");
        update();
      }
    });

    state.userNameFocusNode.addListener(() {
      if (state.userNameFocusNode.hasFocus) {
        state.isInputPassword.value = false;
        print("userNameFocusNode = ${state.isInputPassword.value}");
        update();
      }
    });
    state.passwordFocusNode.addListener(() {
      if (state.passwordFocusNode.hasFocus) {
        state.isInputPassword.value = true;
        print("passwordFocusNode = ${state.isInputPassword.value}");
        update();
      } else {
        state.isInputPassword.value = false;
        print("passwordFocusNode = ${state.isInputPassword.value}");
        update();
      }
    });
  }

  updateIsObscure() {
    print("state.isObscure.value = ${state.isObscure.value}");
    state.isObscure.value = !state.isObscure.value;
  }
}
