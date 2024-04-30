import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shop/core/util/transform.dart';

mixin BiliBiliAppTheme {
  final Color norTextColors = Colors.black;
  final Color norBlackColors = Colors.black;
  final Color norWhite01Color = Colors.white;
  final Color norWhite02Color = const Color.fromRGBO(246, 247, 249, 1);
  final Color norWhite03Color = const Color.fromRGBO(255, 236, 240, 1);
  final Color norWhite04Color = const Color.fromRGBO(242, 243, 245, 1);
  final Color norWhite05Color = const Color.fromRGBO(254, 244, 234, 1);
  final Color norWhite06Color = const Color.fromRGBO(241, 242, 244, 1);
  final Color norWhite07Color = const Color.fromRGBO(245, 247, 250, 1);
  final Color norWhite08Color = const Color.fromRGBO(246, 247, 249, 1);
  final Color norWhite09Color = const Color.fromRGBO(247, 247, 247, 1);
  final Color norWhite10Color = const Color.fromRGBO(237, 237, 237, 1);

  ///灰色
  final Color norGrayColor = const Color.fromRGBO(149, 149, 149, 1);
  final Color norGray02Color = const Color.fromRGBO(100, 101, 103, 1);
  final Color norGray03Color = const Color.fromRGBO(95, 103, 106, 1);
  final Color norGray04Color = const Color.fromRGBO(77, 77, 77, 1);
  final Color norGray05Color = const Color.fromRGBO(156, 156, 158, 1);
  final Color unselectedLabelColor = const Color.fromRGBO(95, 95, 95, 1);

  ///粉色（主题色）
  final Color norMainThemeColors = const Color.fromRGBO(253, 105, 155, 1);
  final Color norPink02Colors = const Color.fromRGBO(255, 154, 184, 1);
  final Color norPink03Colors = const Color.fromRGBO(133, 61, 83, 1);
  final Color norPink04Colors = const Color.fromRGBO(255, 102, 156, 1);
  final Color norPink05Colors = const Color.fromRGBO(177, 143, 157, 1);
  final Color norPink06Colors = const Color.fromRGBO(236, 114, 153, 1);
  final Color norPink07Colors = const Color.fromRGBO(226, 134, 159, 1);
  final Color norPink08Colors = const Color.fromRGBO(217, 121, 151, 1);

  ///蓝色
  final Color norBlue01Colors = const Color.fromRGBO(44, 158, 221, 1);
  final Color norBlue02Colors = const Color.fromRGBO(24, 114, 164, 1);
  final Color norBlue03Colors = const Color.fromRGBO(51, 62, 84, 1);
  final Color norBlue04Colors = const Color.fromRGBO(92, 154, 231, 1);
  final Color norBlue05Colors = const Color.fromRGBO(36, 52, 168, 1);

  ///黄色
  final Color norYellow01Colors = const Color.fromRGBO(245, 185, 37, 1);
  final Color norYellow02Colors = const Color.fromRGBO(245, 176, 56, 1);
  final Color norYellow03Colors = const Color.fromRGBO(234, 154, 93, 1);
  final Color norYellow04Colors = const Color.fromRGBO(215, 100, 30, 1);
  final Color norYellow05Colors = const Color.fromRGBO(114, 89, 27, 1);

  ///原谅色
  final Color norGreen01Colors = const Color.fromRGBO(16, 210, 105, 1);

  ///阴影
  final BoxShadow norBoxShadow = BoxShadow(
    color: Colors.black.withOpacity(.1),
    blurRadius: 3,
    spreadRadius: 1,
    offset: const Offset(0, 0),
  );

  ///渐变黑色区域（凸显白色的字）

  ///默认下的主题
  final ThemeData norTheme = ThemeData(
    primaryColor: Colors.white,
    primarySwatch: createMaterialColor(const Color.fromRGBO(253, 105, 155, 1)),
    textSelectionTheme: TextSelectionThemeData(
        cursorColor: const Color.fromRGBO(253, 105, 155, 1),
        selectionColor: const Color.fromRGBO(44, 158, 221, 1).withOpacity(.5)),
    canvasColor: const Color.fromRGBO(241, 242, 244, 1),
    fontFamily: 'bilibiliFonts',
  );

  final SystemUiOverlayStyle mainTheme = const SystemUiOverlayStyle(
    statusBarIconBrightness: Brightness.light,
    statusBarBrightness: Brightness.light,
    statusBarColor: Color.fromRGBO(253, 105, 155, 1),
  );
  final SystemUiOverlayStyle whiteTheme = const SystemUiOverlayStyle(
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.dark,
    statusBarColor: Colors.white,
  );
  final SystemUiOverlayStyle blackTheme = const SystemUiOverlayStyle(
    statusBarIconBrightness: Brightness.light,
    statusBarBrightness: Brightness.light,
    statusBarColor: Colors.black,
  );
}
