import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:movieku/app/modules/home/models/movie_model.dart';

class HomeController extends GetxController {
  var selectedIndex = 0.obs;
  var id = 0;
  var movieCategory = 0.obs;
  var movies = List.empty(growable: true).obs;
  var trending = List.empty(growable: true).obs;
  var relatedMovies = List.empty(growable: true).obs;
  final String apikey = "c33de0ec803d2fb2d69777cc18e2b5be&language";

  HomeController({this.id = 505642});

  List<MovieModel> movieCarrousel = [
    MovieModel(
        id: 12,
        year: "2023",
        durasi: "114min",
        tag: "movie",
        image: "moana.png",
        title: "Moana",
        desc:
            "Moana Waialiki is a sea voyaging enthusiast and the only daughter of a chief in a long line of navigators.",
        point: "8.1"),
    MovieModel(
        id: 12,
        year: "2023",
        durasi: "114min",
        tag: "movie",
        image: "moana.png",
        title: "Moana2",
        desc:
            "Moana Waialiki is a sea voyaging enthusiast and the only daughter of a chief in a long line of navigators.",
        point: "8.4"),
    MovieModel(
        id: 12,
        year: "2023",
        durasi: "114min",
        tag: "movie",
        image: "moana.png",
        title: "Moana3",
        desc:
            "Moana Waialiki is a sea voyaging enthusiast and the only daughter of a chief in a long line of navigators.",
        point: "8.1"),
    MovieModel(
        id: 12,
        year: "2023",
        durasi: "114min",
        tag: "movie",
        image: "moana.png",
        title: "Moana4",
        desc:
            "Moana Waialiki is a sea voyaging enthusiast and the only daughter of a chief in a long line of navigators.",
        point: "8.1"),
  ].obs;

  List categories = ["Movie", "Tv Show", "Trending"].obs;
  @override
  void onInit() async {
    await getMovies();
    await getTrending();
    await getRelatedMovies(id: id);
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void onNavbarTapped(int index) {
    selectedIndex.value = index;
  }

  void category(int index) {
    movieCategory.value = index;
    switch (index) {
      case 0:
        movies.value;
        break;
      case 1:
        movies.value;
        break;
      case 2:
        movies.value = trending;
        break;
      default:
        movies.value;
    }
  }

  Future getMovies() async {
    try {
      var response = await Dio().get(
          "https://api.themoviedb.org/3/movie/popular?api_key=$apikey=en-US&page=1");

      if (response.statusCode == 200) {
        movies.value = (response.data['results'] as List).map((e) {
          String tahun =
              e["release_date"].toString().substring(0, 4).toString();

          return MovieModel(
              id: e['id'],
              image: "https://image.tmdb.org/t/p/original/${e["poster_path"]}",
              title: e["title"],
              desc: e["overview"],
              year: tahun,
              durasi: "100min",
              tag: "Movie",
              point: e["vote_average"].toString());
        }).toList();
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future getTrending() async {
    try {
      var response = await Dio().get(
          "https://api.themoviedb.org/3/trending/all/day?api_key=c33de0ec803d2fb2d69777cc18e2b5be&page=1");

      if (response.statusCode == 200) {
        trending.value = (response.data['results'] as List).map((e) {
          if (e["poster_path"] != null) {
            String tahun =
                e["release_date"].toString().substring(0, 4).toString();
            return MovieModel(
                id: e['id'],
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
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future getRelatedMovies({required int id}) async {
    try {
      var response = await Dio().get(
          "https://api.themoviedb.org/3/movie/$id/similar?api_key=$apikey&language=en-US&page=1");
      if (response.statusCode == 200) {
        relatedMovies.value = (response.data['results'] as List).map((e) {
          if (e["poster_path"] != null) {
            String tahun =
                e["release_date"].toString().substring(0, 4).toString();
            return MovieModel(
                id: e['id'],
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
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future getTvShows() async {
    try {
      var response = await Dio().get(
          "https://api.themoviedb.org/3/tv/popular?api_key=$apikey&language=en-US&page=1");

      if (response.statusCode == 200) {
        movies.value = (response.data['results'] as List).map((e) {
          String tahun =
              e["release_date"].toString().substring(0, 4).toString();

          return MovieModel(
              id: e['id'],
              image: "https://image.tmdb.org/t/p/original/${e["poster_path"]}",
              title: e["title"],
              desc: e["overview"],
              year: tahun,
              durasi: "100min",
              tag: "Movie",
              point: e["vote_average"].toString());
        }).toList();
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
