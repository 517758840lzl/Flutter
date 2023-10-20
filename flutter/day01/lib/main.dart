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
                  CachedNetworkImage(
                    imageUrl: 'https://pic.616pic.com/bg_w1180/00/00/65/pH7zV5jZ4W.jpg!/fw/1120',
                  ),
                  const SizedBox(height: 10,),
                  CachedNetworkImage(
                    imageUrl: 'https://pic.com/ad',
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
                  )
                ],
              ),
            ),
          ),
        ),
      )
  );
}





