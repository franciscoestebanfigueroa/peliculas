import 'package:flutter/material.dart';
import 'package:peliculas/screens/screens.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: rutas(),
      title: 'Material App',
    );
  }

  Map<String, WidgetBuilder> rutas() {
    return {
      '/': (_) => const Home(),
      '/detalis': (_) {
        return DetalisScreens();
      }
    };
  }
}
