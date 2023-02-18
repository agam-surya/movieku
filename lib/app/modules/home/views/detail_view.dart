import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:movieku/app/modules/home/controllers/video_controller.dart';
import 'package:movieku/app/routes/app_pages.dart';
import 'package:movieku/app/utils/color.dart';
import 'package:shaky_animated_listview/animators/grid_animator.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../controllers/home_controller.dart';
import '../widgets/new_movie.dart';

class DetailView extends StatefulWidget {
  final String image;
  final String title;
  final String rating;
  final String year;
  final String duration;
  final String tag;

  DetailView({
    super.key,
    required this.image,
    required this.title,
    required this.rating,
    required this.year,
    required this.duration,
    required this.tag,
  });

  @override
  State<DetailView> createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  VideoCOntroller videoCOntroller = Get.put(VideoCOntroller());
  HomeController homeController = Get.put(HomeController());
  @override
  void initState() {
    super.initState();
    Get.delete<VideoCOntroller>();
    videoCOntroller = Get.put(VideoCOntroller());
  }

  // late YoutubePlayerController ytcon;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.until((route) {
          return route.settings.name == Routes.HOME;
        });
        return true;
      },
      child: Obx(
        () => YoutubePlayerBuilder(
          player: YoutubePlayer(
            controller: videoCOntroller.ytcon.value,
            liveUIColor: blueColor,
          ),
          builder: (context, player) => Scaffold(
            backgroundColor: Colors.black,
            body: SizedBox(
              height: Get.height,
              width: Get.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  player,
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 10),
                    child: SizedBox(
                      height: 100,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: [
                              RichText(
                                text: TextSpan(children: [
                                  TextSpan(
                                      text: widget.title,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold)),
                                  WidgetSpan(
                                    child: Transform.translate(
                                      offset: const Offset(2, -12),
                                      child: const Text(
                                        'HD',
                                        //superscript is usual
                                        style: TextStyle(
                                            color: blueColor,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  )
                                ]),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: blueColor, width: 6),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Center(
                                  child: Text(
                                    widget.rating,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 20),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                color: blueColor,
                                child: const Center(
                                  child: Text(
                                    "More Info",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset(
                              "assets/icons/like.svg",
                              color: Colors.white,
                            )),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            "resolusi",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.download,
                              color: Colors.white,
                            )),
                        IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset(
                              "assets/icons/share.svg",
                              color: Colors.white,
                            )),
                        IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset(
                              "assets/icons/bookmark.svg",
                              color: Colors.white,
                            )),
                        IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset(
                              "assets/icons/report.svg",
                              color: Colors.white,
                            )),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 30, horizontal: 15),
                    child: SizedBox(
                      height: 60,
                      child: Text(
                        "Watch TV Shows Online Free watch tv shows online,watch tv shows online on Movieku, watch tv shows online free in high quality, free watch tv shows online",
                        style: TextStyle(color: Colors.white70, height: 1.5),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                    child: Text(
                      "Related Movie",
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          decorationThickness: 2.5,
                          color: Colors.transparent,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          shadows: [
                            Shadow(color: blueColor, offset: Offset(0, -10))
                          ],
                          decorationColor: blueColor),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        itemCount: homeController.relatedMovies.length,
                        itemBuilder: (BuildContext ctx, index) {
                          var movie = homeController.relatedMovies[index];
                          return GridAnimatorWidget(
                            child: AspectRatio(
                              aspectRatio: 4 / 7,
                              child: NewMovie(
                                image: movie.image,
                                title: movie.title,
                                rating: movie.point.toString(),
                                year: movie.year,
                                duration: movie.duration,
                                tag: movie.tag,
                              ),
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}