// https://api.themoviedb.org/3/movie/550?api_key=96bef80d8420636832c209204c0a7bf4

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as https;
import 'package:peliculas/model/model.dart';

class MovieProvider extends ChangeNotifier {
  List<Movies> _litadepeliculas = [];

  MovieProvider() {
    getmovis();
  }

  void getmovis() async {
    String url =
        'https://api.themoviedb.org/3/movie/now_playing?api_key=96bef80d8420636832c209204c0a7bf4&language=en-Es&page=1&region=es';
    //  print('en getmovies');
    var response = await https.get(Uri.parse(url));
    var decode = jsonDecode(response.body);

    final xx = ModelMovies.fromjson(decode);
    xx.result.forEach((element) {
      _litadepeliculas.add(element);
      return print('${element.title}');
    });
    notifyListeners();
  }

  List<Movies> get lista_peliculas => _litadepeliculas;
}

/*
primero consultamos 
segundo decodificamos el body
guardamos en  una lista para poder usar el .map que solo funciona en listas, este nos devuelve un intenerable que convertimos en .list


*/
