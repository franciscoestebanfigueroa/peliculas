import 'package:flutter/material.dart';

import 'package:peliculas/screens/search.dart';
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
