// https://api.themoviedb.org/3/movie/550?api_key=96bef80d8420636832c209204c0a7bf4

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as https;

class MovieProvider extends ChangeNotifier {
  MovieProvider() {
    getmovis();
  }

  void getmovis() async {
    String url =
        'https://api.themoviedb.org/3/movie/now_playing?api_key=96bef80d8420636832c209204c0a7bf4&language=en-Es&page=1&region=es';
    //  print('en getmovies');
    var response = await https.get(Uri.parse(url));
    var decode = jsonDecode(response.body);

    final xx = ModalMovies.fromjson(decode);
    xx.result.forEach((element) {
      return print('${element.title}');
    });
  }
}

/*
primero consultamos 
segundo decodificamos el body
guardamos en  una lista para poder usar el .map que solo funciona en listas, este nos devuelve un intenerable que convertimos en .list


*/
class ModalMovies {
  final totalresultados;
  final List<Movies> result;

  ModalMovies(this.totalresultados, this.result);

  ModalMovies.fromjson(
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

//ModalMovies.fromjson(this.page, this.result)

  /*@override
  String toString() {
    print('total de resultados: ${totalresultados}');
    for (var item in result) {
      print('titulo original: ${item.title} ');
      print('titulo en español: ${item.originaltitle}');
    }
    return super.toString();
  }
*/
}

class Movies {
  String title;
  String originaltitle;
  String posterpath;

  Movies(
      {required this.title,
      required this.originaltitle,
      required this.posterpath});

  Movies.frommap(Map<String, dynamic> map)
      : title = map['title'],
        originaltitle = map['original_title'],
        posterpath = map['poster_path'];
}
