import 'package:flutter/material.dart';
import 'package:peliculas/model/model.dart';
import 'package:peliculas/providers/movie_provider.dart';
import 'package:provider/provider.dart';

class Busqueda extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      TextButton(
        child: const Text('Borrar'),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  String get searchFieldLabel => 'Buscar Peliculas';

  @override
  Widget? buildLeading(BuildContext context) {
    const Text(
      'Leading',
      style: TextStyle(color: Colors.orange),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(child: Image.asset('assets/no-image.jpg'));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    var buscar = Provider.of<MovieProvider>(context);
    buscar.ingresoquery(query);
    return StreamBuilder(
        stream: buscar.busquedastream,
        builder: (context, AsyncSnapshot<List<Movies>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      Navigator.pushNamed(context, '/detalis',
                          arguments: snapshot.data![index]);
                    },
                    contentPadding: const EdgeInsets.all(1),
                    title: Text(
                      snapshot.data![index].title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    leading: FadeInImage(
                      //fit: BoxFit.cover,

                      placeholder: const AssetImage('assets/no-image.jpg'),
                      image: NetworkImage(
                          'https://image.tmdb.org/t/p/w400${snapshot.data![index].posterpath}'),
                    ),
                  );
                });
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}
