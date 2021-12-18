// https://api.themoviedb.org/3/movie/550?api_key=96bef80d8420636832c209204c0a7bf4

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as gethttp;
import 'package:peliculas/model/class_actores.dart';
import 'package:peliculas/model/model.dart';

class MovieProvider extends ChangeNotifier {
  final List<Movies> _litadepeliculas = [];
  List<Movies> _listapopular = [];
  List<Actores> listadoactores = [];
  Map<int, List<Actores>> mapaactores = {};
  int _page = 0;

  MovieProvider() {
    getmovisnuevos();
    getmoviespopular();
    // getactores(580459);
  }

  Future<gethttp.Response> getheadboard(String page, String cuerpo) async {
    Map<String, String> queryparametros = {
      'api_key': '96bef80d8420636832c209204c0a7bf4',
      'language': 'es-Es',
      'page': page,
    };

    var url = Uri.https('api.themoviedb.org', cuerpo, queryparametros);
    var response = await gethttp.get(url);

    if (response.statusCode != 200) {
      print('error ${response.statusCode}');
      return response;
    } else {
      print('conectado ${response.statusCode}');
      return response;
    }
  }

  List<Movies> get listapopulares => _listapopular;
  List<Movies> get listapeliculas => _litadepeliculas;

  Future<List<Actores>> getactores(int idmovie) async {
    if (mapaactores.containsKey(idmovie)) {
      print('no consulta en servidor, el dato esta en cache');
      return mapaactores[idmovie]!;
    } else {
      gethttp.Response getactores =
          await getheadboard('1', '/3/movie/$idmovie/credits');
      Map<String, dynamic> decodegetactores = jsonDecode(getactores.body);
      CastMovies cast = CastMovies.fromjson(decodegetactores);
      mapaactores[cast.id] = cast.listaactores;

      var t = mapaactores[idmovie]!.map((e) => {e.id});
      List tt = t.toList();
      // print(tt);
      return cast.listaactores;
    }
  }

  void getmovisnuevos() async {
    gethttp.Response conectar = await getheadboard('1', '/3/movie/now_playing');
    var decode = jsonDecode(conectar.body);

    final xx = ModelMovies.fromjson(decode);
    for (var element in xx.result) {
      _litadepeliculas.add(element);
      //print(element.title);
    }
    notifyListeners();
  }

  void getmoviespopular() async {
    String cuerpo = '/3/movie/popular';
    _page++;

    //Uri.https('www.googleapis.com', '/books/v1/volumes', {'q': '{http}'});
    var estado = await getheadboard(_page.toString(), cuerpo);

    Map<String, dynamic> body = jsonDecode(estado.body);

    final modelPopular = ModelPopular.frommap(body);

    //_listapopular = modelPopular.results;
    _listapopular = [..._listapopular, ...modelPopular.results];
    // concatena desectructurando por que cambia los page
    notifyListeners();
  }
}


/*
primero consultamos 
segundo decodificamos el body
guardamos en  una lista para poder usar el .map que solo funciona en listas, este nos devuelve un intenerable que convertimos en .list


*/
