import 'package:flutter/material.dart';
import 'package:flutter_card_swipper/flutter_card_swiper.dart';

class CardSwipper extends StatelessWidget {
  const CardSwipper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Swiper(
      layout: SwiperLayout.TINDER,
      itemHeight: size.height * 0.5,
      itemWidth: double.infinity,
      itemBuilder: (_, index) => ClipRRect(
        borderRadius: BorderRadius.circular(60),
        child: const FadeInImage(
          fit: BoxFit.cover,
          image: NetworkImage('https://via.placeholder.com/300x400'),
          placeholder: NetworkImage(
              'https://dev.to/placeholders/free-image-placeholder-3f3m'),
        ),
      ),
      itemCount: 10,
    );
  }
}
