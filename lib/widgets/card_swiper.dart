import 'package:flutter/material.dart';
import 'package:flutter_card_swipper/flutter_card_swiper.dart';

class CardSwipper extends StatelessWidget {
  const CardSwipper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      color: Colors.orange,
      height: size.height * 0.5,
      child: Swiper(
        layout: SwiperLayout.STACK,
        itemHeight: size.height * 0.5,
        itemWidth: double.infinity,
        itemBuilder: (BuildContext contex, int index) => const FadeInImage(
          // fit: BoxFit.cover,
          image: NetworkImage('https://via.placeholder.com/300x400'),
          placeholder: NetworkImage('https://via.placeholder.com/300x400'),
        ),
        itemCount: 10,
      ),
    );
  }
}
