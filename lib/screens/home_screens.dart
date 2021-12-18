import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:peliculas/providers/movie_provider.dart';
import 'package:peliculas/widgets/widgers.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dataprovide = Provider.of<MovieProvider>(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            child: const Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {
              showSearch(context: context, delegate: Busqueda());
            },
          )
        ],
        title: const Text('Esteban y Lara'),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: CardSwipper(dataprovider: dataprovide),
          ),
          Expanded(flex: 2, child: SwipperInferior(dataprovider: dataprovide))
        ],
      ),
    );
  }
}

class Busqueda extends SearchDelegate {
  late String value = '';
  @override
  List<Widget>? buildActions(BuildContext context) {
    value = 'consultando';
    return [const Text('Action')];
  }

  @override
  String get searchFieldLabel => 'Buscar Peliculas';

  @override
  Widget? buildLeading(BuildContext context) {
    const Text(
      'Leading',
      style: TextStyle(color: Colors.black),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(child: Text(value));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Center(child: Text(query));
  }
}
