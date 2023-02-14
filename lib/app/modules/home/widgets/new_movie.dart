import 'package:flutter/material.dart';

import '../../../utils/color.dart';

class NewMovie extends StatelessWidget {
  const NewMovie({
    super.key,
    required this.image,
    required this.title,
    required this.rating,
  });

  final String image;
  final String title;
  final String rating;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: Stack(
            children: [
              Image.asset(
                "assets/images/$image",
                fit: BoxFit.cover,
              ),
              Positioned(
                top: 5,
                right: 5,
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
            ],
          )),
          Padding(
              padding: const EdgeInsets.only(left: 10),
              child: FittedBox(
                  child:
                      Text(title, style: const TextStyle(color: blueColor)))),
        ],
      ),
    );
  }
}
