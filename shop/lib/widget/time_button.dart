import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

import '../core/util/size.dart';
import '../core/util/theme_color.dart';

///倒计时的按钮（例如发送验证码的按钮）
class TimerButton extends StatefulWidget with SizeConstantUtil, BiliBiliAppTheme{
  ///倒计时时间
  final int timeClock;

  ///按钮初始文本
  final String originalButtonText;

  ///按钮点击后再重新恢复后的文本
  final String retryButtonText;

  ///点击执行的操作
  final Function() onTap;

  ///计时器是否有用
  final bool isEnable;

  TimerButton({
    Key? key,
    this.timeClock = 60,
    this.originalButtonText = "获取验证码",
    this.retryButtonText = "重新获取验证码",
    required this.onTap,
    this.isEnable = true,
  }) : super(key: key);

  @override
  State<TimerButton> createState() => _TimerButtonState();
}

class _TimerButtonState extends State<TimerButton>
    with SizeConstantUtil, BiliBiliAppTheme {
  late Timer _timer;
  late int timeClock;

  ///我是干净的，点击之后，我不干净了
  bool _iAmClean = true;

  ///正在倒计时
  late bool isRunning;

  @override
  void initState() {
    _timer = Timer(const Duration(seconds: 1), () {});
    isRunning = false;
    timeClock = widget.timeClock;
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.isEnable) {
          if (!isRunning) {
            isRunning = true;
            setState(() {});
            _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
              timeClock--;
              setState(() {});
              if (timeClock == 0) {
                timeClock = widget.timeClock;
                isRunning = false;
                _iAmClean = false;
                timer.cancel();
              }
            });
            widget.onTap();
          } else {
            SmartDialog.showToast("请等待");
          }
        } else {
          widget.onTap();
        }
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            left: BorderSide(color: norGrayColor.withOpacity(.5)),
          ),
        ),
        padding: const EdgeInsets.only(left: 20).r,
        child: !isRunning
            ? Text(
          _iAmClean
              ? widget.originalButtonText.tr
              : widget.retryButtonText.tr,
          style: TextStyle(
            color: norMainThemeColors,
            fontSize: customFontSizeCons.r,
          ),
        )
            : Text(
          "$timeClock秒重试",
          style: TextStyle(
            color: norGrayColor,
            fontSize: customFontSizeCons.r,
          ),
        ),
      ),
    );
  }
}
