import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

void main() {
  runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: const Text("Flutter"),
          ),
          body: SingleChildScrollView(
            child: Center(
              child:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LZLItemIntroduce("hello", "subTitle", "https://pic.616pic.com/bg_w1180/00/00/65/pH7zV5jZ4W.jpg!/fw/1120"),
                  CachedNetworkImage(
                    imageUrl: 'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif',
                  ),
                  CachedNetworkImage(
                    imageUrl: 'https://pic.616pic.com/bg_w1180/00/00/65/pH7zV5jZ4W.jpg!/fw/1120',
                  ),
                  CachedNetworkImage(
                    imageUrl: 'https://pic.616pic.com/bg_w1180/00/18/34/ce3Q8cLocY.jpg!/fw/1120',
                  ),
                  // 使用网络图片，如果加载失败就是用默认的站位图片
                  CachedNetworkImage(
                    imageUrl: 'https://pic.com',
                    // 站位图片很显然只是在加载的过程中晦气效果，加载完成之后如果还想要使用占位就需要使用error来处理了
                    placeholder: (context, url) => Image.asset(
                      'assets/images/belt.jpg',
                    ),
                    errorWidget: (content,url,error) => Image.asset(
                      'assets/images/belt.jpg',
                    ),
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        color: Colors.red,
                        image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                            colorFilter:
                            const ColorFilter.mode(Colors.red, BlendMode.colorBurn)),
                      ),
                    ),
                  ),
                  CachedNetworkImage(
                    imageUrl: 'https://pic.616pic.com/bg_w1180/00/18/34/ce3Q8cLocY.jpg!/fw/1120',
                  ),
                ],
              ),
            ),
          ),
        ),
      )
  );
}

class LZLItemIntroduce extends StatelessWidget {
  String title;
  String subTitle;
  String imageUrl;

  LZLItemIntroduce(this.title,this.subTitle,this.imageUrl,{super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          border: Border.all(
              width: 5, // 设置边框的宽度
              color: Colors.pink// 设置边框的颜色
          )
      ),
      child: Center(
        child: Column(
          children: [
            Text(title,style: const TextStyle(fontSize: 24,color: Colors.black,),),
            const SizedBox(height: 8,),
            Text(subTitle,style: const TextStyle(fontSize: 16,color: Colors.greenAccent,),),
            const SizedBox(height: 8,),
            CachedNetworkImage(
              imageUrl: imageUrl,
            ),
          ],
        ),
      ),
    );
  }
}




