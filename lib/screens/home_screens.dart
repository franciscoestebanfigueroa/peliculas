import 'package:flutter/material.dart';
import 'package:peliculas/widgets/widgers.dart';

class Home extends StatelessWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                color: Colors.orange,
              ))
        ],
      ),
    );
  }
}
