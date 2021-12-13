// https://api.themoviedb.org/3/movie/550?api_key=96bef80d8420636832c209204c0a7bf4

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as gethttp;
import 'package:peliculas/model/model.dart';

class MovieProvider extends ChangeNotifier {
  final List<Movies> _litadepeliculas = [];
  final List<Movies> _listapopular = [];

  MovieProvider() {
    getmovisnuevos();
    getmoviespopular();
  }

  void getmovisnuevos() async {
    String url =
        'https://api.themoviedb.org/3/movie/now_playing?api_key=96bef80d8420636832c209204c0a7bf4&language=en-Es&page=1&region=es';
    //  print('en getmovies');
    var response = await gethttp.get(Uri.parse(url));
    var decode = jsonDecode(response.body);

    final xx = ModelMovies.fromjson(decode);
    for (var element in xx.result) {
      _litadepeliculas.add(element);
      //print(element.title);
    }
    notifyListeners();
  }

  List<Movies> get listapeliculas => _litadepeliculas;
  List<Movies> get listapopulares => _listapopular;

  void getmoviespopular() async {
    Map<String, String> queryparametros = {
      'api_key': '96bef80d8420636832c209204c0a7bf4',
      'language': 'es-Es',
      'page': '1',
    };

    String baseurl = 'api.themoviedb.org';
    String cuerpo = '/3/movie/popular';

    var url =
        //Uri.https('www.googleapis.com', '/books/v1/volumes', {'q': '{http}'});

        Uri.https(baseurl, cuerpo, queryparametros);

    var estado = await gethttp.get(url);

    if (estado.statusCode != 200) {
      //  print(estado.statusCode);
    } else {
      //print('Conexion exitosa ${estado.statusCode}');
      Map<String, dynamic> body = jsonDecode(estado.body);
      // print(body);

      final modelPopular = ModelPopular.frommap(body);

      for (var element in modelPopular.results) {
        _listapopular.add(element);
      }

      for (var item in _listapopular) {
        // print(item.title);
      }

      _listapopular.map((e) => print('${e.title}'));
    }

    notifyListeners();
  }
}


/*
primero consultamos 
segundo decodificamos el body
guardamos en  una lista para poder usar el .map que solo funciona en listas, este nos devuelve un intenerable que convertimos en .list


*/
