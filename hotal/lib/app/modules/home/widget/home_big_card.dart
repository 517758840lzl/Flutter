import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../theme/app_theme.dart';
import '../../../util/random/room_image_util.dart';

class HomeBigCard extends StatelessWidget {
  const HomeBigCard({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(nameRandomTypeUtil(),style: appFont(context).titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),),
            SizedBox(height: 8,),
            ClipRRect(borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                width: size.width-40,
                imageUrl: promoRandomUtil(),
                placeholder: (context, url) => const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
                fit: BoxFit.fill,
              ),
            )
          ],
        ),
      ),
    );
  }
}
