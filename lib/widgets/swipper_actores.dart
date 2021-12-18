import 'package:flutter/material.dart';
import 'package:peliculas/model/class_actores.dart';
import 'package:peliculas/providers/movie_provider.dart';
import 'package:provider/provider.dart';

class SwipperActores extends StatelessWidget {
  final int idmovie;
  const SwipperActores({
    Key? key,
    required this.idmovie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<MovieProvider>(context);
    return Container(
      width: double.infinity,
      height: 200,
      color: Colors.amber,
      child: FutureBuilder<List<Actores>>(
        future: data.getactores(idmovie),
        builder: (context, AsyncSnapshot<List<Actores>> snapshot) {
          return Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Column(
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 120),
                      child: FadeInImage(
                        fit: BoxFit.cover,
                        placeholder: const AssetImage('assets/no-image.jpg'),
                        //image: AssetImage('assets/loading.gif')
                        image: NetworkImage(
                            'https://image.tmdb.org/t/p/w300${snapshot.data![0].profilepath}'),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                //Text(snapshot.data!.name.toString()),
              ],
            ),
            color: Colors.red,
          );
        },
      ),
    );
  }
}
