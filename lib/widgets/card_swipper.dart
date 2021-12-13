import 'package:flutter/material.dart';
import 'package:flutter_card_swipper/flutter_card_swiper.dart';
import 'package:flutter_card_swipper/widgets/flutter_page_indicator/flutter_page_indicator.dart';
import 'package:peliculas/providers/movie_provider.dart';

class CardSwipper extends StatelessWidget {
  final MovieProvider dataprovider;
  const CardSwipper({Key? key, required this.dataprovider}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
//el  card necesita minimo 3 datos para inicializarse
    if (dataprovider.listapeliculas.length < 3) {
      return const Center(child: CircularProgressIndicator());
    }

    return Swiper(
      indicatorLayout: PageIndicatorLayout.SLIDE,
      autoplay: true,
      duration: 300,
      fade: 200,
      curve: Curves.easeInQuart,
      layout: SwiperLayout.STACK,
      itemHeight: size.height * 0.5,
      itemWidth: size.width * 0.6,
      itemCount: 10,
      itemBuilder: (_, index) => ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: GestureDetector(
          onDoubleTap: () => Navigator.pushNamed(context, '/detalis',
              arguments:
                  dataprovider.listapeliculas[index].posterpath.toString()),
          child: FadeInImage(
            fit: BoxFit.cover,
            image: NetworkImage(
                'https://image.tmdb.org/t/p/w400${dataprovider.listapeliculas[index].posterpath}'),
            placeholder: const AssetImage('assets/no-image.jpg'),
          ),
        ),
      ),
    );
  }
}
