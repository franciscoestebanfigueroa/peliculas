// https://api.themoviedb.org/3/movie/550?api_key=96bef80d8420636832c209204c0a7bf4

import 'package:flutter/material.dart';
import 'package:http/http.dart' as https;

class MovieProvider extends ChangeNotifier {
  MovieProvider() {
    getmovis();
  }

  void getmovis() async {
    String url =
        'https://api.themoviedb.org/3/movie/550?api_key=96bef80d8420636832c209204c0a7bf4';

    final response = https.get(Uri.parse(url));
    print('respuesta Get $response');
  }
}
