import 'package:flutter/material.dart';
import "package:flutter_screenutil/flutter_screenutil.dart";
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';

main() => runApp(LZLApp());

class LZLApp extends StatelessWidget {
  LZLApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context,child) => const GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: LZLHomePage(),
      ),
    );
  }
}

class LZLHomePage extends StatelessWidget {
  const LZLHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Flutter"),),
      body: const LZLHomeContent(),
    );
  }
}

class LZLHomeContent extends StatelessWidget {
  const LZLHomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    const imageUrl = "http://i2.hdslb.com/bfs/archive/8784e34bf9a96313bdad49149738ca68494680d5.jpg";
    print(500.h);
    return Center(
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        height: 500.h,
        fit: BoxFit.fitHeight,
      ),
    );
  }
}


