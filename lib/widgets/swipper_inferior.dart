import 'package:flutter/material.dart';
import 'package:peliculas/providers/movie_provider.dart';

class SwipperInferior extends StatefulWidget {
  final MovieProvider dataprovider;

  const SwipperInferior({
    Key? key,
    required this.dataprovider,
  }) : super(key: key);

  @override
  State<SwipperInferior> createState() => _SwipperInferiorState();
}

ScrollController scrollController = ScrollController();

class _SwipperInferiorState extends State<SwipperInferior> {
  @override
  void initState() {
    scrollController.addListener(() {
      if (scrollController.position.pixels >
          scrollController.position.maxScrollExtent - 500) {
        widget.dataprovider.getmoviespopular();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    scrollController.removeListener(() {});
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('Populares'),
        ),
        Expanded(
          child: ListView.builder(
              controller: scrollController,
              itemCount: widget.dataprovider.listapopulares.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => catalogoimg(index)),
        ),
      ],
    );
  }

  Widget catalogoimg(int index) {
    return SizedBox(
      height: 300,
      width: 100,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: GestureDetector(
                onTap: () => {
                  Navigator.pushNamed(context, '/detalis',
                      arguments: widget.dataprovider.listapopulares[index])
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: FadeInImage(
                      fit: BoxFit.cover,
                      placeholder: const AssetImage('assets/no-image.jpg'),
                      image: NetworkImage(
                          'https://image.tmdb.org/t/p/w300${widget.dataprovider.listapopulares[index].posterpath}')),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                '${widget.dataprovider.listapopulares[index].title}',
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
