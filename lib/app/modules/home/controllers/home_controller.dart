import 'package:get/get.dart';
import 'package:movieku/app/modules/home/models/movie_model.dart';

class HomeController extends GetxController {
  var selectedIndex = 0.obs;
  var movieCategory = 0.obs;
  var movies = List.empty(growable: true).obs;
  List<MovieModel> newMovie = [
    MovieModel(
        year: "2023",
        duration: "114min",
        tag: "movie",
        image: "interstellar.png",
        title: "Interstellar",
        desc: "",
        point: 8.9),
    MovieModel(
        year: "2023",
        duration: "114min",
        tag: "movie",
        image: "aladin.png",
        title: "Alladin",
        desc: "",
        point: 8.9),
    MovieModel(
        year: "2023",
        duration: "114min",
        tag: "movie",
        image: "avenger.png",
        title: "Avenger End Game",
        desc: "",
        point: 8.9),
    MovieModel(
        year: "2023",
        duration: "114min",
        tag: "movie",
        image: "interstellar.png",
        title: "Interstellar",
        desc: "",
        point: 8.9),
    MovieModel(
        year: "2023",
        duration: "114min",
        tag: "movie",
        image: "aladin.png",
        title: "Alladin",
        desc: "",
        point: 8.9),
    MovieModel(
        year: "2023",
        duration: "114min",
        tag: "movie",
        image: "avenger.png",
        title: "Avenger End Game",
        desc: "",
        point: 8.9),
    MovieModel(
        year: "2023",
        duration: "114min",
        tag: "movie",
        image: "interstellar.png",
        title: "Interstellar",
        desc: "",
        point: 8.9),
    MovieModel(
        year: "2023",
        duration: "114min",
        tag: "movie",
        image: "aladin.png",
        title: "Alladin",
        desc: "",
        point: 8.9),
    MovieModel(
        year: "2023",
        duration: "114min",
        tag: "movie",
        image: "avenger.png",
        title: "Avenger End Game",
        desc: "",
        point: 8.9),
  ].obs;
  List<MovieModel> tvShow = [
    MovieModel(
        year: "2023",
        duration: "114min",
        tag: "tv show",
        image: "interstellar.png",
        title: "Interstellar",
        desc: "",
        point: 8.9),
    MovieModel(
        year: "2023",
        duration: "114min",
        tag: "tv show",
        image: "avenger.png",
        title: "Avenger End Game",
        desc: "",
        point: 8.9),
    MovieModel(
        year: "2023",
        duration: "114min",
        tag: "tv show",
        image: "aladin.png",
        title: "Alladin",
        desc: "",
        point: 8.9),
    MovieModel(
        year: "2023",
        duration: "114min",
        tag: "tv show",
        image: "interstellar.png",
        title: "Interstellar",
        desc: "",
        point: 8.9),
    MovieModel(
        year: "2023",
        duration: "114min",
        tag: "tv show",
        image: "avenger.png",
        title: "Avenger End Game",
        desc: "",
        point: 8.9),
    MovieModel(
        year: "2023",
        duration: "114min",
        tag: "tv show",
        image: "aladin.png",
        title: "Alladin",
        desc: "",
        point: 8.9),
    MovieModel(
        year: "2023",
        duration: "114min",
        tag: "tv show",
        image: "interstellar.png",
        title: "Interstellar",
        desc: "",
        point: 8.9),
    MovieModel(
        year: "2023",
        duration: "114min",
        tag: "tv show",
        image: "avenger.png",
        title: "Avenger End Game",
        desc: "",
        point: 8.9),
    MovieModel(
        year: "2023",
        duration: "114min",
        tag: "tv show",
        image: "aladin.png",
        title: "Alladin",
        desc: "",
        point: 8.9),
  ].obs;
  List<MovieModel> trending = [
    MovieModel(
        year: "2023",
        duration: "114min",
        tag: "trending",
        image: "aladin.png",
        title: "Alladin",
        desc: "",
        point: 8.9),
    MovieModel(
        year: "2023",
        duration: "114min",
        tag: "trending",
        image: "interstellar.png",
        title: "Interstellar",
        desc: "",
        point: 8.9),
    MovieModel(
        year: "2023",
        duration: "114min",
        tag: "trending",
        image: "avenger.png",
        title: "Avenger End Game",
        desc: "",
        point: 8.9),
    MovieModel(
        year: "2023",
        duration: "114min",
        tag: "trending",
        image: "aladin.png",
        title: "Alladin",
        desc: "",
        point: 8.9),
    MovieModel(
        year: "2023",
        duration: "114min",
        tag: "trending",
        image: "interstellar.png",
        title: "Interstellar",
        desc: "",
        point: 8.9),
    MovieModel(
        year: "2023",
        duration: "114min",
        tag: "trending",
        image: "avenger.png",
        title: "Avenger End Game",
        desc: "",
        point: 8.9),
    MovieModel(
        year: "2023",
        duration: "114min",
        tag: "trending",
        image: "aladin.png",
        title: "Alladin",
        desc: "",
        point: 8.9),
    MovieModel(
        year: "2023",
        duration: "114min",
        tag: "trending",
        image: "avenger.png",
        title: "Avenger End Game",
        desc: "",
        point: 8.9),
    MovieModel(
        year: "2023",
        duration: "114min",
        tag: "trending",
        image: "interstellar.png",
        title: "Interstellar",
        desc: "",
        point: 8.9),
  ].obs;
  List<MovieModel> relatedMovies = [
    MovieModel(
        year: "2023",
        duration: "114min",
        tag: "trending",
        image: "aladin.png",
        title: "Alladin",
        desc: "",
        point: 8.9),
    MovieModel(
        year: "2023",
        duration: "114min",
        tag: "trending",
        image: "interstellar.png",
        title: "Interstellar",
        desc: "",
        point: 8.9),
    MovieModel(
        year: "2023",
        duration: "114min",
        tag: "trending",
        image: "avenger.png",
        title: "Avenger End Game",
        desc: "",
        point: 8.9),
    MovieModel(
        year: "2023",
        duration: "114min",
        tag: "trending",
        image: "aladin.png",
        title: "Alladin",
        desc: "",
        point: 8.9),
  ].obs;

  List<MovieModel> movieCarrousel = [
    MovieModel(
        year: "2023",
        duration: "114min",
        tag: "movie",
        image: "moana.png",
        title: "Moana",
        desc:
            "Moana Waialiki is a sea voyaging enthusiast and the only daughter of a chief in a long line of navigators.",
        point: 8.1),
    MovieModel(
        year: "2023",
        duration: "114min",
        tag: "movie",
        image: "moana.png",
        title: "Moana2",
        desc:
            "Moana Waialiki is a sea voyaging enthusiast and the only daughter of a chief in a long line of navigators.",
        point: 8.4),
    MovieModel(
        year: "2023",
        duration: "114min",
        tag: "movie",
        image: "moana.png",
        title: "Moana3",
        desc:
            "Moana Waialiki is a sea voyaging enthusiast and the only daughter of a chief in a long line of navigators.",
        point: 8.1),
    MovieModel(
        year: "2023",
        duration: "114min",
        tag: "movie",
        image: "moana.png",
        title: "Moana4",
        desc:
            "Moana Waialiki is a sea voyaging enthusiast and the only daughter of a chief in a long line of navigators.",
        point: 8.1),
  ].obs;

  List categories = ["Movie", "Tv Show", "Trending"].obs;
  @override
  void onInit() {
    super.onInit();
    movies.value = newMovie;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    print("dispose");
  }

  void onNavbarTapped(int index) {
    selectedIndex.value = index;
  }

  void category(int index) {
    movieCategory.value = index;
    switch (index) {
      case 0:
        movies.value = newMovie;
        break;
      case 1:
        movies.value = tvShow;
        break;
      case 2:
        movies.value = trending;
        break;
      default:
        movies.value = newMovie;
    }
  }
}
