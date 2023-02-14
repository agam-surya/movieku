import 'package:get/get.dart';
import 'package:movieku/app/modules/home/models/movie_model.dart';

class HomeController extends GetxController {
  var selectedIndex = 0.obs;
  List<MovieModel> newMovie = [
    MovieModel(
        image: "interstellar.png", title: "Interstellar", desc: "", point: 8.9),
    MovieModel(image: "aladin.png", title: "Alladin", desc: "", point: 8.9),
    MovieModel(
        image: "avenger.png", title: "Avenger End Game", desc: "", point: 8.9),
    MovieModel(
        image: "interstellar.png", title: "Interstellar", desc: "", point: 8.9),
    MovieModel(image: "aladin.png", title: "Alladin", desc: "", point: 8.9),
    MovieModel(
        image: "avenger.png", title: "Avenger End Game", desc: "", point: 8.9),
    MovieModel(
        image: "interstellar.png", title: "Interstellar", desc: "", point: 8.9),
    MovieModel(image: "aladin.png", title: "Alladin", desc: "", point: 8.9),
    MovieModel(
        image: "avenger.png", title: "Avenger End Game", desc: "", point: 8.9),
  ].obs;

  List<MovieModel> movieCarrousel = [
    MovieModel(
        image: "moana.png",
        title: "Moana",
        desc:
            "Moana Waialiki is a sea voyaging enthusiast and the only daughter of a chief in a long line of navigators.",
        point: 8.1),
    MovieModel(
        image: "moana.png",
        title: "Moana2",
        desc:
            "Moana Waialiki is a sea voyaging enthusiast and the only daughter of a chief in a long line of navigators.",
        point: 8.4),
    MovieModel(
        image: "moana.png",
        title: "Moana3",
        desc:
            "Moana Waialiki is a sea voyaging enthusiast and the only daughter of a chief in a long line of navigators.",
        point: 8.1),
    MovieModel(
        image: "moana.png",
        title: "Moana4",
        desc:
            "Moana Waialiki is a sea voyaging enthusiast and the only daughter of a chief in a long line of navigators.",
        point: 8.1),
  ].obs;
  @override
  void onInit() {
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

  void changePage(int newPage) {
    selectedIndex.value = newPage;
  }
}
