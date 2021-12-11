import 'package:flutter/material.dart';
import 'package:flutter_card_swipper/flutter_card_swiper.dart';
import 'package:peliculas/providers/movie_provider.dart';

class CardSwipper extends StatelessWidget {
  final MovieProvider dataprovider;
  CardSwipper({Key? key, required this.dataprovider}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Swiper(
      layout: SwiperLayout.STACK,
      itemHeight: size.height * 0.5,
      itemWidth: size.width * 0.5,
      itemBuilder: (_, index) => ClipRRect(
        borderRadius: BorderRadius.circular(60),
        child: GestureDetector(
          onDoubleTap: () => Navigator.pushNamed(context, '/detalis',
              arguments: 'card-swipper'),
          child: FadeInImage(
            fit: BoxFit.cover,
            image: NetworkImage(
                'https://image.tmdb.org/t/p/w500${dataprovider.lista_peliculas[index].posterpath}'),
            placeholder: const AssetImage('assets/no-image.jpg'),
          ),
        ),
      ),
      itemCount: 20,
    );
  }
}
