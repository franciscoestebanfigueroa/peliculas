class Movies {
  final String title;
  final String originaltitle;
  final String posterpath;
  final String? overview;
  final String? backdroppath;

  Movies(
      {this.backdroppath,
      this.overview,
      required this.title,
      required this.originaltitle,
      required this.posterpath});

  Movies.frommap(Map<String, dynamic> map)
      : title = map['title'],
        originaltitle = map['original_title'],
        posterpath = map['poster_path'],
        overview = map['overview'] ?? 'No hay datos',
        backdroppath = map['backdrop_path'];
}
