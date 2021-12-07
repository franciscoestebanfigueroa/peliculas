import 'package:flutter/material.dart';
import 'widgets/card_swiper.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Peliculas'),
        ),
        body: Column(
          children: [
            CardSwipper(),
          ],
        ),
      ),
    );
  }
}
