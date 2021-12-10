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
    print('en getmovies');
    var response = await https.get(Uri.parse(url));

    // print('respuesta Get ${response.body}');

    var decode = jsonDecode(response.body);

    print('**********decode**********  ${decode['results'][1]}');
    List listadecode = decode['results'];

    Iterable iterable = listadecode.map((e) => {
          'name': e['title'],
          'foto': e['backdrop_path'],
        });
    print('iterable ***************** ${iterable.toList()[2]}');
  }
}
/*
primero consultamos 
segundo decodificamos el body
guardamos en  una lista los datos de lista a usar en intenerar
luego transformamos en lista para poder ubicarlos


class ModalMovies {
  final page;
  final List<Map<String, dynamic>> result;

  ModalMovies(this.page, this.result);

//ModalMovies.fromjson(this.page, this.result)

}
