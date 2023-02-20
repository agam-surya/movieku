import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../models/movie_model.dart';

class DetailCOntroller extends GetxController {
  var videourl = "https://www.youtube.com/watch?v=-_oZlR-uCTI".obs;
  var ytcon = YoutubePlayerController(initialVideoId: "").obs;
  var relatedMovies = List.empty(growable: true).obs;

  final String apikey = "c33de0ec803d2fb2d69777cc18e2b5be";

  @override
  void onInit() async {
    videourl.value = "https://www.youtube.com/watch?v=-_oZlR-uCTI";
    ytcon.value = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(videourl.value)!,
        flags: const YoutubePlayerFlags(
          mute: false,
          loop: false,
          autoPlay: false,
        ));

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    ytcon.value.dispose();
    super.onClose();
  }

  Future getRelatedMovies({required int id}) async {
    List<MovieModel?> datas = [];
    try {
      print("IDDD - $id");
      var response = await Dio().get(
          "https://api.themoviedb.org/3/movie/$id/similar?api_key=$apikey&language=en-US&page=1");
      if (response.statusCode == 200) {
        datas = (response.data['results'] as List).map((e) {
          if (e["poster_path"] != null && e["id"] != null) {
            String tahun =
                e["release_date"].toString().substring(0, 4).toString();
            return MovieModel(
                id: 123,
                image:
                    "https://image.tmdb.org/t/p/original/${e["poster_path"]}",
                title: e["title"] != null
                    ? e['title']
                    : (e['original_name'] != null)
                        ? e['original_name']
                        : e['original_title'],
                desc: e["overview"],
                year: tahun,
                durasi: "100min",
                tag: "Trending",
                point: e["vote_average"].toString().substring(0, 3));
          }
        }).toList();
        datas.removeWhere((data) => data == null);
      }
    } catch (e) {
      throw Exception(e.toString());
    }

    return datas;
  }
}
