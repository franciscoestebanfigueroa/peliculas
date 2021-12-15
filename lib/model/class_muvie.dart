class Movies {
  String title;
  String originaltitle;
  String posterpath;
  String overview;

  Movies(
      {required this.overview,
      required this.title,
      required this.originaltitle,
      required this.posterpath});

  Movies.frommap(Map<String, dynamic> map)
      : title = map['title'],
        originaltitle = map['original_title'],
        posterpath = map['poster_path'],
        overview = map['overview'];
}
