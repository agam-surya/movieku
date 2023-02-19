import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieku/app/modules/home/views/detail_view.dart';

import '../../../utils/color.dart';

class NewMovie extends StatelessWidget {
  const NewMovie({
    super.key,
    required this.image,
    required this.title,
    required this.rating,
    required this.year,
    required this.durasi,
    required this.tag,
  });

  final String image;
  final String title;
  final String rating;
  final String year;
  final String durasi;
  final String tag;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(
            () => DetailView(
                image: image,
                title: title,
                rating: rating,
                year: year,
                durasi: durasi,
                tag: tag),
            preventDuplicates: false);
      },
      child: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: Stack(
              children: [
                Positioned(
                  top: 0,
                  right: 5,
                  left: 0,
                  child: Image.asset(
                    "assets/images/$image",
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 5,
                  right: 10,
                  child: CircleAvatar(
                    backgroundColor: blueColor,
                    radius: 10,
                    child: Text(
                      rating,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 8,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const Center(
                  child: Icon(
                    Icons.play_arrow_outlined,
                    color: blueColor,
                    size: 50,
                  ),
                ),
              ],
            )),
            FittedBox(
                child: Text(title,
                    textAlign: TextAlign.left,
                    style: const TextStyle(color: blueColor))),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Row(
                children: [
                  Text(
                    year,
                    style: const TextStyle(color: Colors.white, fontSize: 10),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    durasi,
                    style: const TextStyle(color: Colors.white, fontSize: 10),
                  ),
                  const SizedBox(width: 5),
                  Expanded(
                    child: Container(
                      height: 20,
                      padding: const EdgeInsets.all(3),
                      margin: const EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                          color: Colors.black,
                          border: Border.all(color: Colors.white, width: 2)),
                      child: FittedBox(
                        child: Text(
                          tag,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 12),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
