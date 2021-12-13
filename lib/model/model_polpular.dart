import 'model.dart';

class ModelPopular {
  final int page;
  final List<Movies> results;

  ModelPopular(this.page, this.results);

  ModelPopular.frommap(Map<String, dynamic> json)
      : page = json['page'] ?? 20,
        results =
            List<Movies>.from(json['results'].map((e) => Movies.frommap(e)));
}
