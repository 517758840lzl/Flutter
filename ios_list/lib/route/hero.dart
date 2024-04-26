import 'package:flutter/material.dart';
import 'package:ios_list/route/hero_detail.dart';

class LZLHeroPage extends StatefulWidget {
  const LZLHeroPage({super.key});

  @override
  State<LZLHeroPage> createState() => _LZLHeroPageState();
}

class _LZLHeroPageState extends State<LZLHeroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("hero"),),
      body: GridView(
          gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 8,
            childAspectRatio: 16/9,
          ),
        children: List.generate(20, (index) => GestureDetector(
          onTap: () => jumpToDetailPageWithAnimation(context, index),
          child: Hero(
            tag: "https://picsum.photos/500/500?random=$index",
            child: Image.network(
                "https://picsum.photos/500/500?random=$index",
                fit: BoxFit.cover,
            ),
          ),
        ),)
      ),
    );
  }

  void jumpToDetailPage(BuildContext context,int index) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) {
          return const LZLPictureDetail();
        },
        settings: RouteSettings(arguments: "https://picsum.photos/500/500?random=$index",)
        ),
    );
  }

  void jumpToDetailPageWithAnimation(BuildContext context,int index) {
    Navigator.of(context).push(PageRouteBuilder(
        pageBuilder: (context,ani1,ani2) {
          return FadeTransition(opacity: ani1,child: LZLPictureDetail(),);
        },
        settings: RouteSettings(arguments: "https://picsum.photos/500/500?random=$index",)
        ),
    );
  }
}
