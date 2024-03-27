import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

TextTheme appFont(BuildContext context) {
  return Theme.of(context).textTheme;
}

ColorApp appColor(BuildContext context) {
  var scheme = Theme.of(context).colorScheme;
  var theme = Theme.of(context);

  return ColorApp(useScheme: scheme,useThemeData: theme);
}

class ColorApp {

  ColorScheme useScheme;
  ThemeData useThemeData;

  // ColorApp(this.useScheme,this.useThemeData);
  // 这种带required的需要使用{} ，来修饰
  // ColorApp({required this.useScheme,required this.useThemeData});

  // ColorApp({this.useScheme,required this.useThemeData});

  ColorApp({required this.useScheme,required this.useThemeData});
}

ThemeData appTheme(BuildContext context, {bool? useDark}) {
  return ThemeData(
    cupertinoOverrideTheme: CupertinoThemeData(
      brightness:
      (useDark ?? false) == true ? Brightness.dark : Brightness.light,
    ),
    appBarTheme: AppBarTheme(
      titleTextStyle: appFont(context).titleMedium?.copyWith(
        fontWeight: FontWeight.bold,
        color: Theme.of(context).brightness == Brightness.dark
            ? Colors.white
            : Colors.black,
      ),
    ),
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: appColor(context).useScheme.background,
      iconTheme: const MaterialStatePropertyAll(
        IconThemeData(
          size: 20,
        ),
      ),
      labelTextStyle: MaterialStatePropertyAll(
        appFont(context).labelSmall?.copyWith(
          fontFamily: "google",
          fontSize: 10,
          color: Theme.of(context).brightness == Brightness.dark
              ? Colors.white
              : Colors.black,
        ),
      ),
    ),
    fontFamily: "google",
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.blue,
      brightness:
      (useDark ?? false) == true ? Brightness.dark : Brightness.light,
    ),
    brightness: (useDark ?? false) == true ? Brightness.dark : Brightness.light,
    useMaterial3: true,
  );
}

Size appSize(BuildContext context) => MediaQuery.of(context).size;