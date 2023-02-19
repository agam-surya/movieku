class MovieModel {
  final int id;
  final String image;
  final String title;
  final String desc;
  final String year;
  final String durasi;
  final String tag;
  final String point;

  MovieModel({
    required this.id,
    required this.image,
    required this.title,
    required this.desc,
    required this.year,
    required this.durasi,
    required this.tag,
    required this.point,
  });

  // factory MovieModel.fromJson(Map<String, dynamic> json) {
  //   String tahun = json["release_date"].toString().substring(0, 4).toString();

  //   return MovieModel(
  //       id: json['id'],
  //       image: "https://image.tmdb.org/t/p/original/${json["poster_path"]}",
  //       title: json["title"],
  //       desc: json["overview"],
  //       year: tahun,
  //       durasi: "100min",
  //       tag: "Movie",
  //       point: json["vote_average"].toString());
  // }
}
