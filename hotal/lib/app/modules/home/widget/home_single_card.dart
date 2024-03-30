import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../util/random/room_image_util.dart';

class HomePageSingleCard extends StatelessWidget {
  const HomePageSingleCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,

        // child: FadeInImage(
        //   image: NetworkImage(roomRandomUtil()),
        //   placeholder: const AssetImage(
        //     "assets/images/peace.png",
        //   ),
        //     fit: BoxFit.cover,
        // ),

        child: Row(children: [

          for(var i=0;i<5;i++)
            createCard()
        ],),
      ),
    );
  }
}

 Widget createCard() {
  return Row(
    children: [
      const SizedBox(width: 20,),
      ClipRRect(
        borderRadius: BorderRadius.circular(10),

        child: CachedNetworkImage(
          height: 200,
          imageUrl: roomRandomUtil(),
          placeholder: (context, url) => const CircularProgressIndicator(),
          errorWidget: (context, url, error) => const Icon(Icons.error),
          fit: BoxFit.fill,
        ),
      )
    ],
  );
}

