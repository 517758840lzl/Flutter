import 'package:flutter/material.dart';
import 'package:ios_list/route/detail.dart';
import 'package:ios_list/route/error.dart';
import 'package:ios_list/route/hero.dart';
import 'package:ios_list/route/setting.dart';

import 'about.dart';

main() => runApp(LZLApp());

class LZLApp extends StatelessWidget {
   LZLApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: LZLHomePage(),
      initialRoute: "/",
      routes: {
        '/': (context) => const LZLHomePage(),
        'setting':(context) => LZLSettingPage(),
        'hero':(context) => const LZLHeroPage()
      },
      onGenerateRoute: (setting) {
        if (setting.name == 'about') {
          return MaterialPageRoute(
            // Navigator.of(context).pushNamed("setting",arguments: message);
              builder: (context) => LZLAboutPage(setting.arguments! as String)
          );
        }
        return null;
      },
      onUnknownRoute: (setting) {
        return MaterialPageRoute(
            builder: (context) => const LZLErrorPage()
        );
      },
    );
  }
}

class LZLHomePage extends StatelessWidget {
  const LZLHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Flutter"),),
      body: LZLHomeContent(),
    );
  }
}

class LZLHomeContent extends StatefulWidget {
  const LZLHomeContent({super.key});

  @override
  State<LZLHomeContent> createState() => _LZLHomeContentState();
}

class _LZLHomeContentState extends State<LZLHomeContent> {
  String _message = "";
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () => jumpToDetail(context),
            child: const Text("点击跳转详情页面"),
          ),
          ElevatedButton(
            onPressed: () => jumpToAbout(context),
            child: const Text("点击跳转关于页面"),
          ),
          ElevatedButton(
            onPressed: () => jumpToSetting(context),
            child: const Text("点击跳转设置页面"),
          ),
          ElevatedButton(
            onPressed: () => jumpToSettingWithRoute(context),
            child: const Text("点击跳转详情页面"),
          ),

          ElevatedButton(
            onPressed: () => jumpToHome(context),
            child: const Text("点击跳转首页页面"),
          ),

          ElevatedButton(
            onPressed: () => jumpToErrorPage(context),
            child: const Text("点击跳转不存在的页面"),
          ),

          Text(_message,style: const TextStyle(fontSize: 24),),
        ],
      )
    );
  }

  void jumpToDetail(BuildContext context) {
      Navigator.of(context).push(
          MaterialPageRoute(
              builder: (context) {
                return const LZLDetailPage();
              }
          )
      );
  }

  void jumpToHome(BuildContext context) {
      Navigator.of(context).pushNamed("hero");
  }

  void jumpToAbout(BuildContext context) {
    Future result = Navigator.of(context).push(
        MaterialPageRoute(
            builder: (context) {
              return LZLAboutPage("我是构造器中传入的参数");
            }
        )
    );

    // 对于Navigator.of(context).push 是有返回值的，返回值类型为Future类型，所以可以通过then的方式进行读取。
    result.then((value) => {
      setState(() {
        _message = value;
      })
    });
  }

  void jumpToSetting(BuildContext context) {
    String message = "我是通过push函数进行传值的参数";
    Future result = Navigator.of(context).push(
        MaterialPageRoute(
            settings: RouteSettings(arguments: message),
            builder: (context) {
              return LZLSettingPage();
            }
        )
    );

    result.then((value) => {
      setState(() {
        _message = value;
      })
    });
  }

  void jumpToSettingWithRoute(BuildContext context) {
    String message = "我是jumpToSettingWithRoute函数进行传值的参数";
    Navigator.of(context).pushNamed("setting",arguments: message);
  }

  void jumpToErrorPage(BuildContext context) {
    String message = "我是jumpToSettingWithRoute函数进行传值的参数";
    Navigator.of(context).pushNamed("list",arguments: message);
  }
}


