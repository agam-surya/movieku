import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:movieku/app/modules/home/controllers/detail_controller.dart';
import 'package:movieku/app/modules/home/models/movie_model.dart';
import 'package:movieku/app/routes/app_pages.dart';
import 'package:movieku/app/utils/color.dart';
import 'package:shaky_animated_listview/animators/grid_animator.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../controllers/home_controller.dart';
import '../widgets/dialog.dart';
import '../widgets/new_movie.dart';

class DetailView extends StatefulWidget {
  final int id;
  final String image;
  final String title;
  final String rating;
  final String year;
  final String durasi;
  final String desc;
  final String tag;

  DetailView({
    super.key,
    required this.id,
    required this.image,
    required this.title,
    required this.rating,
    required this.year,
    required this.durasi,
    required this.desc,
    required this.tag,
  });

  @override
  State<DetailView> createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  late DetailCOntroller detailCOntroller;
  HomeController homeController = Get.put(HomeController());
  @override
  void initState() {
    Get.delete<DetailCOntroller>();
    detailCOntroller = Get.put(DetailCOntroller());
    super.initState();
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
            controller: detailCOntroller.ytcon.value,
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FittedBox(
                            child: RichText(
                              overflow: TextOverflow.ellipsis,
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
                            ),
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
                              GestureDetector(
                                onTap: () {
                                  showModalBottomSheet<void>(
                                    context: context,
                                    isScrollControlled: true,
                                    builder: (BuildContext context) {
                                      return Container(
                                        height: Get.height * 0.75,
                                        color: Colors.black,
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 20, horizontal: 10),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: <Widget>[
                                            SizedBox(
                                              height: 200,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  FittedBox(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: RichText(
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      text: TextSpan(children: [
                                                        TextSpan(
                                                            text: widget.title,
                                                            style: const TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 30,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold)),
                                                        WidgetSpan(
                                                          child: Transform
                                                              .translate(
                                                            offset:
                                                                const Offset(
                                                                    2, -12),
                                                            child: const Text(
                                                              'HD',
                                                              //superscript is usual
                                                              style: TextStyle(
                                                                  color:
                                                                      blueColor,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                          ),
                                                        )
                                                      ]),
                                                    ),
                                                  ),
                                                  Container(
                                                    height: 40,
                                                    width: 40,
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: blueColor,
                                                            width: 6),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20)),
                                                    child: Center(
                                                      child: Text(
                                                        widget.rating,
                                                        style: const TextStyle(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ),
                                                  ),
                                                  Text(
                                                    "${widget.durasi} Adventure Drama fiction",
                                                    style: const TextStyle(
                                                        color: blueColor),
                                                  ),
                                                  Row(
                                                    children: [
                                                      Expanded(
                                                          child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: const [
                                                          Text(
                                                            "Cristopher Nolan",
                                                            style: TextStyle(
                                                                color:
                                                                    blueColor),
                                                          ),
                                                          Text(
                                                            "Director, Writer",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                        ],
                                                      )),
                                                      Expanded(
                                                          child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: const [
                                                          Text(
                                                            "Jonathan Nolan",
                                                            style: TextStyle(
                                                                color:
                                                                    blueColor),
                                                          ),
                                                          Text(
                                                            "Writer",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                        ],
                                                      )),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                            const SizedBox(height: 20),
                                            Expanded(
                                                child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Text(
                                                  "Sinopsis",
                                                  style: TextStyle(
                                                      fontSize: 24,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    widget.desc,
                                                    style: const TextStyle(
                                                        fontSize: 14,
                                                        height: 1.5,
                                                        color: blueColor),
                                                    softWrap: true,
                                                  ),
                                                ),
                                              ],
                                            ))
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                },
                                child: Container(
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
                            "1080p",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              downloadDialog(context);
                            },
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
                            onPressed: () {
                              reportDialog(context);
                            },
                            icon: SvgPicture.asset(
                              "assets/icons/report.svg",
                              color: Colors.white,
                            )),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 30, horizontal: 15),
                    child: SizedBox(
                      height: 60,
                      child: Text(
                        widget.desc,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                        style:
                            const TextStyle(color: Colors.white70, height: 1.5),
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
                    child: FutureBuilder(
                      future: detailCOntroller.getRelatedMovies(id: widget.id),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else {
                          return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              itemCount: snapshot.data.length,
                              itemBuilder: (BuildContext ctx, index) {
                                MovieModel movie = snapshot.data[index];
                                return GridAnimatorWidget(
                                  child: AspectRatio(
                                    aspectRatio: 4 / 7,
                                    child: NewMovie(
                                      id: movie.id,
                                      image: movie.image,
                                      title: movie.title,
                                      rating: movie.point.toString(),
                                      year: movie.year,
                                      durasi: movie.durasi,
                                      desc: movie.desc,
                                      tag: movie.tag,
                                    ),
                                  ),
                                );
                              });
                        }
                      },
                    ),
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
