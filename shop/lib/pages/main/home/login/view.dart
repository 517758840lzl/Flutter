import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

import '../../../../core/util/image_assets.dart';
import '../../../../core/util/size.dart';
import '../../../../core/util/theme_color.dart';
import '../../../../widget/retangle_checkbox.dart';
import '../../../../widget/time_button.dart';
import 'logic.dart';

class LoginPage extends StatelessWidget with BiliBiliAppTheme,SizeConstantUtil, ImageAssets {
  LoginPage({Key? key}) : super(key: key);

  final logic = Get.find<LoginLogic>();
  final state = Get.find<LoginLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        appBar: AppBar(
          elevation: .5,
          backgroundColor: norWhite01Color,
          /// 自动以返回按钮
          leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Icon(
              Icons.arrow_back,
              color: norTextColors,
              size: iconSizeCons.r,
            ),
          ),
          title: Text(
            state.loginTypeIsMessage.value
                ? "手机号注册登录"
                : "密码登录",
            style: TextStyle(
              fontSize: titleFontSizeCons.r,
              color: norTextColors,
              fontWeight: FontWeight.normal,
            ),
          ),
          /// 对应的就是右itemBar的点击事件，左点击事件是leading中
          actions: [
            GestureDetector(
              onTap: () {
                logic.changeLoginType(context);
              },
              child: Container(
                margin: EdgeInsets.only(right: 10.r),
                child: Text(
                  state.loginTypeIsMessage.value
                      ? "密码登录"
                      : "手机号注册登录",
                  style: TextStyle(
                    fontSize: customFontSizeCons.r,
                    color: norTextColors,
                  ),
                ),
              ),
            ),
          ],
        ),
        body: Column(children: [
          ///2233娘背景
          buildLoginImage(),

          /// 根据条件是否展示地区
          state.loginTypeIsMessage.value ? buildLoginRegion(context) : Container(),

          /// 根据条件展示验证码登录还是密码登录
          state.loginTypeIsMessage.value ? buildTelAndVerifyCode(context) : buildUserNameAndPassword(),

          /// 根据条件展示不同的提交按钮
          Container(
            margin: EdgeInsets.symmetric(vertical: 15.r),
            child: state.loginTypeIsMessage.value ? buildVerifyLoginButton() : buildRegisterAndLoginButton(),
          ),
          /// 底部的条款
          buildLoginAgreement()
        ],),
        ///防止键盘弹出超出边界
        resizeToAvoidBottomInset: false,
      );
    });
  }

  /// 顶部的logo图片
  Widget buildLoginImage() {
    return Stack(
      children: [
        Positioned(
            width: 90.r,
            height: 90.r,
            left: 0,
            bottom: 0,
            child: Image.asset(
              state.isInputPassword.value ? close22PNG : open22PNG,
              gaplessPlayback: true,
            )),
        Center(
          child: Image.asset(
            bilibiliPNG,
            width: 90.r,
            height: 90.r,
          ),
        ),
        Positioned(
            width: 90.r,
            height: 90.r,
            right: 0,
            bottom: 0,
            child: Image.asset(
              state.isInputPassword.value ? close33PNG : open33PNG,
              gaplessPlayback: true,
            )),
      ],
    );
  }
  /// 展示地区 +86
  Widget buildLoginRegion(BuildContext context) {
    return GestureDetector(
      onTap:() {
        buildRegionDialog(context);
      },
      child: Stack(
        children: [
          10.verticalSpace,
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15).r,
            width: double.infinity,
            decoration: BoxDecoration(
              color: norWhite01Color,
              border: Border(
                ///底部设置边框
                bottom: BorderSide(width: 1.r, color: norWhite06Color),
              ),
            ),
            child: Text(
              state.regionList[state.regionIndex.value].region,
              style: TextStyle(color: norTextColors),
            ),
          ),
          Positioned(
            right: 15.r,
            top: 0,
            bottom: 0,
            child: Icon(
              Icons.arrow_forward_ios,
              size: iconSizeCons.r,
            ),
          ),
        ],
      ),
    );
  }
  /// 地区的选择
  buildRegionDialog(BuildContext context) async {
    List<Widget> list = [];
    for(int i=0;i<state.regionList.length;i++) {
      list.add(
          TextButton(
              onPressed: () {
                Navigator.pop(context);
                state.regionIndex.value = i;
              },
              child: Text(
                state.regionList[i].region,
                style: TextStyle(color: norTextColors),
              ))
      );
    }

    var regionDialog = await showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: Text(
                "地区",
                style: TextStyle(
                  fontSize: 14.sp,
                )),
            children: list,
          );
        }
    );
    return regionDialog;
  }

  ///手机号码/验证码
  Widget buildTelAndVerifyCode(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 2.r, horizontal: 15.r),
          decoration: BoxDecoration(
            color: norWhite01Color,
            border: Border(
              bottom: BorderSide(width: 2.r, color: norWhite06Color),
            ),
          ),
          child: Row(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                width: 40.r,
                child: Text(
                  state.regionList[state.regionIndex.value].telNum,
                  style: TextStyle(
                    color: norTextColors,
                    fontSize: titleFontSizeCons.r,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: 15.r),
                  child: TextField(
                    focusNode: state.telFocusNode,
                    autofocus: true,
                    showCursor: true,
                    onChanged: (text) {
                      logic.updateTel(text);
                    },
                    cursorColor: norMainThemeColors,
                    /// 占位文本以及样式
                    decoration: InputDecoration(
                      hintText: "请输入手机号",
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                        fontSize: unSelectTabFontSizeCons.r,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    style: TextStyle(
                      fontSize: customFontSizeCons.r,
                      color: norMainThemeColors,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ),
              TimerButton(
                onTap: () {
                  if(state.telText.isEmpty) {
                    SmartDialog.showToast("留个电话呗");
                  } else {
                    /// 发送验证码

                  }
                },
                isEnable: state.telText.isNotEmpty ? true : false,
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 5.r, horizontal: 15.r),
          decoration: BoxDecoration(
            color: norWhite01Color,
          ),
          child: Row(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                width: 40.r,
                child: Text(
                  "验证码",
                  style: TextStyle(
                    color: norTextColors,
                    fontSize: unSelectTabFontSizeCons.r,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: 15.r),
                  child: TextField(
                    onChanged: (text) {
                      logic.updateVerifyText(text);
                    },
                    showCursor: true,
                    cursorColor: norMainThemeColors,
                    decoration: InputDecoration(
                      hintText: "请输入验证码",
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                        fontSize: customFontSizeCons.r,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    style: TextStyle(
                      fontSize: customFontSizeCons.r,
                      color: norTextColors,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  ///用户名和密码
  Widget buildUserNameAndPassword() {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 2.r, horizontal: 15.r),
          decoration: BoxDecoration(
            color: norWhite01Color,
            border: Border(
              bottom: BorderSide(width: 2.r, color: norWhite06Color),
            ),
          ),
          child: Row(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                width: 40.r,
                child: Text(
                  "账号",
                  style: TextStyle(
                    color: norTextColors,
                    fontSize: titleFontSizeCons.r,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: 15.r),
                  child: TextField(
                    focusNode: state.telFocusNode,
                    autofocus: true,
                    showCursor: true,
                    onChanged: (text) {
                      logic.updateTel(text);
                    },
                    cursorColor: norMainThemeColors,
                    /// 占位文本以及样式
                    decoration: InputDecoration(
                      hintText: "请输入手机号或者邮箱",
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                        fontSize: unSelectTabFontSizeCons.r,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    style: TextStyle(
                      fontSize: customFontSizeCons.r,
                      color: norMainThemeColors,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 5.r, horizontal: 15.r),
          decoration: BoxDecoration(
            color: norWhite01Color,
          ),
          child: Row(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                width: 40.r,
                child: Text(
                  "密码",
                  style: TextStyle(
                    color: norTextColors,
                    fontSize: unSelectTabFontSizeCons.r,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: 15.r),
                  child: TextField(
                    onChanged: (text) {
                      logic.updateVerifyText(text);
                    },
                    showCursor: true,
                    cursorColor: norMainThemeColors,
                    decoration: InputDecoration(
                      hintText: "请输入密码",
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                        fontSize: customFontSizeCons.r,
                        fontWeight: FontWeight.normal,
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          logic.updateIsObscure();
                        },
                        icon: Icon(
                          state.isObscure.value
                              ? Icons.visibility
                              : Icons.visibility_off,
                          size: iconSizeCons.r,
                        ),
                      ),
                    ),
                    style: TextStyle(
                      fontSize: customFontSizeCons.r,
                      color: norTextColors,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 20.r),
                child: Text(
                  "忘记密码",
                  style: TextStyle(
                    color: norMainThemeColors,
                    fontSize: customFontSizeCons.r,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  ///验证登录（短信登录的登录按钮）
  Widget buildVerifyLoginButton() {
    return Opacity(
      opacity: state.telText.isNotEmpty && state.verifyText.isNotEmpty?1:.5,
      child: ElevatedButton(
        style: ButtonStyle(
          overlayColor:
          MaterialStateProperty.all(norTextColors.withOpacity(.1)),
          elevation: MaterialStateProperty.all(0),
          backgroundColor: MaterialStateProperty.all(norMainThemeColors),
          minimumSize: MaterialStateProperty.all(Size(200.r, 40.r)),
        ),
        onPressed: () {
          if(state.telText.isNotEmpty && state.verifyText.isNotEmpty) {

          } else {
            SmartDialog.showToast("电话或者手机号不能为空");
          }
        }, child:Text(
        "验证登录",
        style: TextStyle(
          color: norWhite01Color,
          fontSize: customFontSizeCons.r,
          fontWeight: FontWeight.normal,
        ),
      ),),
    );
  }

  ///注册登录
  Widget buildRegisterAndLoginButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          style: ButtonStyle(
              overlayColor:
              MaterialStateProperty.all(norTextColors.withOpacity(.1)),
              elevation: MaterialStateProperty.all(0),
              backgroundColor: MaterialStateProperty.all(norWhite01Color),
              minimumSize: MaterialStateProperty.all(Size(150.r, 40.r)),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(3.r)),
                    side: BorderSide(color: norMainThemeColors)),
              )),
          onPressed:
          state.userNameText.isNotEmpty && state.passwordText.isNotEmpty
              ? () {
            SmartDialog.showToast("暂无注册功能");
          }
              : null,
          child: Text(
            "注册",
            style: TextStyle(
              color: norMainThemeColors,
              fontSize: customFontSizeCons.r,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        Opacity(
          opacity:
          state.userNameText.isNotEmpty && state.passwordText.isNotEmpty
              ? 1
              : .5,
          child: ElevatedButton(
            style: ButtonStyle(
              overlayColor:
              MaterialStateProperty.all(norTextColors.withOpacity(.1)),
              elevation: MaterialStateProperty.all(0),
              backgroundColor: MaterialStateProperty.all(norMainThemeColors),
              minimumSize: MaterialStateProperty.all(Size(150.r, 40.r)),
            ),
            onPressed:
            state.userNameText.isNotEmpty && state.passwordText.isNotEmpty
                ? () {
              // logic.userNameAndPasswordLogin();
            }
                : null,
            child: Text(
              "登录",
              style: TextStyle(
                color: norWhite01Color,
                fontSize: customFontSizeCons.r,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ),
      ],
    );
  }
  /// 同意条款
  Widget buildLoginAgreement() {
    return Container(
      alignment: Alignment.topCenter,
      padding: EdgeInsets.symmetric(vertical: 15.r,horizontal: 15.r),
      child: Column(
        children: [
          Text.rich(TextSpan(
              children: [
                WidgetSpan(child: RectangleCheckBox(
                    size: customFontSizeCons.r,
                    checkedColor: norMainThemeColors,
                    isChecked: state.isAgree.value,
                    onTap: (value) {
                      state.isAgree.value = value!;
                    }),
                ),
                TextSpan(
                  text: "  我已经阅读并同意",
                  style: TextStyle(
                    color: norGrayColor,
                    fontSize: customFontSizeCons.r,
                  ),
                ),
                TextSpan(
                  text: "用户协议、隐私政策",
                  style: TextStyle(
                    color: norBlue01Colors,
                    fontSize: customFontSizeCons.r,
                  ),
                ),
                TextSpan(
                  text: "和",
                  style: TextStyle(
                    color: norGrayColor,
                    fontSize: customFontSizeCons.r,
                  ),
                ),
                TextSpan(
                  text: "隐私政策",
                  style: TextStyle(
                    color: norBlue01Colors,
                    fontSize: customFontSizeCons.r,
                  ),
                ),
                state.loginTypeIsMessage.value
                    ? TextSpan(
                  text: "，未注册绑定的手机号验证成功后将自动注册",
                  style: TextStyle(
                    color: norGrayColor,
                    fontSize: customFontSizeCons.r,
                  ),
                )
                    : const TextSpan(),
              ]
          )),
          20.verticalSpace,
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: "遇到问题?",
                  style: TextStyle(
                    color: norGrayColor,
                    fontSize: customFontSizeCons.r,
                  ),
                ),
                TextSpan(
                  text: "查看帮助",
                  style: TextStyle(
                    color: norBlue01Colors,
                    fontSize: customFontSizeCons.r,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}