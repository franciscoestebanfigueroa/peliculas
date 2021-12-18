class CastMovies {
  final List<Actores> listaactores;
  final int id;

  CastMovies(this.listaactores, this.id);
  CastMovies.fromjson(Map<String, dynamic> json)
      : id = json['id'],
        listaactores = List.from(json['cast'].map((e) => Actores.frommap(e)));
}

class Actores {
  final String name;
  final String? profilepath;
  final int id;

  Actores(this.name, this.profilepath, this.id);
  Actores.frommap(Map<String, dynamic> map)
      : id = map['id'],
        name = map['name'],
        profilepath = map['profile_path'] ?? 'sin path';
}
