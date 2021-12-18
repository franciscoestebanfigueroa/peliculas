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

    return FutureBuilder<List<Actores>>(
      future: data.getactores(idmovie),
      builder: (context, AsyncSnapshot<List<Actores>> snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return SizedBox(
            width: double.infinity,
            // color: Colors.orange,
            height: 160,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return ConstrainedBox(
                  constraints:
                      const BoxConstraints(minWidth: 100, maxWidth: 100),
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: FadeInImage(
                              fit: BoxFit.cover,
                              placeholder:
                                  const AssetImage('assets/loading.gif'),
                              imageErrorBuilder: (context, error, stackTrace) =>
                                  Center(
                                      child:
                                          Image.asset('assets/no-image.jpg')),
                              image: NetworkImage(
                                  'https://image.tmdb.org/t/p/w300${snapshot.data![index].profilepath}'),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          snapshot.data![index].name.toString(),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                    //  color: Colors.red,
                  ),
                );
              },
            ),
          );
        }
      },
    );
  }
}
