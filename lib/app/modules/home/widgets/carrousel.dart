import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/color.dart';

class CarrouselMovie extends StatelessWidget {
  const CarrouselMovie({
    super.key,
    required this.image,
    required this.title,
    required this.desc,
    required this.point,
  });

  final String image;
  final String title;
  final String desc;
  final String point;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
            left: 0,
            right: 0,
            top: 0,
            bottom: 0,
            child: Image.asset(
              "assets/images/$image",
              fit: BoxFit.cover,
            )),
        Positioned(
            top: ((Get.height * 0.35) * 0.47),
            bottom: 10,
            left: 10,
            right: Get.width * 0.5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FittedBox(
                  child: Text(
                    title,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: Text(
                    desc,
                    softWrap: false,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12),
                  ),
                ),
                OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        minimumSize: const Size(40, 20),
                        maximumSize: const Size(50, 20),
                        padding: const EdgeInsets.only(
                            top: 0, bottom: 0, right: 5, left: 5),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2.0)),
                        backgroundColor: blueColor),
                    onPressed: () {},
                    child: Text(
                      point,
                      style: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ))
              ],
            ))
      ],
    );
  }
}
