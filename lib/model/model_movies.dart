import 'package:peliculas/model/model.dart';

class ModelMovies {
  final totalresultados;
  final List<Movies> result;

  ModelMovies(this.totalresultados, this.result);

  ModelMovies.fromjson(
    Map<String, dynamic> json,
  )   : totalresultados = json['total_results'],
        result = List.from(json['results'].map((e) => Movies.frommap(
            e))); //puede quedar mejor List<Movies> List.from devuelve una lista de instancias de elementos

  /* 
  //este metodo hace un map y para acceder hay que user result['title'] el enterior es una instancia y accedemos a sus atributos result.title
  json['results']
            .map((e) => {
                  'title': e['title'],
                  'originaltitle': e['original_title'],
                  'posterpath ': e['poster_path']
                })
            .toList(); */

}
