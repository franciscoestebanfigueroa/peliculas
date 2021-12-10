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
    final dataprovide = Provider.of<MovieProvider>(context).getmovis();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Column(
        children: [
          const Expanded(
            flex: 3,
            child: CardSwipper(),
          ),
          Expanded(
              flex: 2,
              child: Container(
                child: const SwipperInferior(),
                // color: Colors.orange,
              ))
        ],
      ),
    );
  }
}
