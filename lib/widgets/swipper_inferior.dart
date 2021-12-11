import 'package:flutter/material.dart';
import 'package:peliculas/providers/movie_provider.dart';

class SwipperInferior extends StatelessWidget {
  final MovieProvider dataprovider;
  const SwipperInferior({
    Key? key,
    required this.dataprovider,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('Peliculas'),
        ),
        Expanded(
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => catalogoimg(index)),
        ),
      ],
    );
  }

  Widget catalogoimg(int index) {
    return SizedBox(
      width: 180,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: FadeInImage(
                    fit: BoxFit.cover,
                    placeholder: const AssetImage('assets/no-image.jpg'),
                    image: NetworkImage(
                        'https://image.tmdb.org/t/p/w300${dataprovider.lista_peliculas[index].posterpath}')),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                '${dataprovider.lista_peliculas[index].title}',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
      ),
    );
  }
}
