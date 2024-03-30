import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../theme/app_theme.dart';
import '../../../util/random/room_image_util.dart';

class DiscountBooking extends StatelessWidget {
  const DiscountBooking({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 8
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Double Room",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 2.5,),
            const Text("Welcome to fly's hotel"),
            const SizedBox(height: 5,),
            Stack(children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8)
                ),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width / 3,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: CachedNetworkImage(
                    imageUrl: roomRandomUtil(),
                    fit: BoxFit.cover,
                  ),
                ),
              )
            ],),
            const SizedBox(height: 5,),
            Column(children: [
              Row(children: [
                const Column(children: [
                  Text("double room",style: TextStyle(fontWeight: FontWeight.bold),),
                  Text("prince:189.99"),
                ],),
                Expanded(
                  flex: 2,

                  child:ElevatedButton.icon(
                  style: ButtonStyle(
                    padding:
                    const MaterialStatePropertyAll(
                      EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 8,
                      ),
                    ),

                    textStyle: MaterialStatePropertyAll(
                      appFont(context).bodySmall,
                    ),
                  ),
                  onPressed: () {},
                  icon: const Icon(
                    Icons.verified_outlined,
                    size: 20,
                  ),
                  label: const Text("Booking"),
                ),
                )
              ],)
            ],),
          ],
        ),
      ),
    );
  }
}
