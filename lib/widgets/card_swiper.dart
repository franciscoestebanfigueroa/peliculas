import 'package:flutter/material.dart';
import 'package:flutter_card_swipper/flutter_card_swiper.dart';

class CardSwipper extends StatelessWidget {
  const CardSwipper({Key? key}) : super(key: key);

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
          onDoubleTap: () => Navigator.pushNamed(context, '/detalis'),
          child: FadeInImage(
            fit: BoxFit.cover,
            image: NetworkImage('https://picsum.photos/id/$index/200'),
            placeholder: const AssetImage('assets/no-image.jpg'),
          ),
        ),
      ),
      itemCount: 20,
    );
  }
}
