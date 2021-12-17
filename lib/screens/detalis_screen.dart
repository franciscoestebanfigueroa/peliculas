import 'package:flutter/material.dart';
import 'package:peliculas/model/model.dart';
import 'package:peliculas/providers/movie_provider.dart';
import 'package:peliculas/widgets/widgers.dart';
import 'package:provider/provider.dart';

class DetalisScreens extends StatelessWidget {
  DetalisScreens({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Movies modaldata = ModalRoute.of(context)!.settings.arguments as Movies;
    final provideractores = Provider.of<MovieProvider>(context);
    var builder;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _AppBarSliver(modal: modaldata),
          /* _AppbarSliverSafeArea(
              child: SliverList(
                  delegate: SliverChildListDelegate([
                Container(
                    color: Colors.red,
                    height: 40,
                    child: const Text('MiSuper Claseeeeeee'))
              ])),
              context: context),*/
          //SliverList(
          //  delegate: MisliverDelegate(),
          //),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Detalle de La Pelicula..',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: FadeInImage(
                          fit: BoxFit.cover,
                          height: 180,
                          width: 120,
                          image: NetworkImage(
                            'https://image.tmdb.org/t/p/w300${modaldata.posterpath}',
                          ),
                          placeholder: const AssetImage('assets/no-image.jpg'),
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const SizedBox(
                              width: 30,
                            ),
                            SizedBox(
                              width: 100,
                              child: Text(
                                modaldata.title,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.star_border,
                              size: 20,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              width: 100,
                              child: Text(
                                modaldata.originaltitle,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(modaldata.overview!),
                ),
                SwipperActores()
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _AppBarSliver extends StatelessWidget {
  final Movies modal;

  const _AppBarSliver({
    Key? key,
    required this.modal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true, //fijo el appbar, se expande pero queda en su menor
      // valor
      floating: false, //apartece cuandp bajo, no necesita entar en cero
      expandedHeight: 200,
      flexibleSpace: FlexibleSpaceBar(
        background: Image.network(
          'https://image.tmdb.org/t/p/w300${modal.backdroppath}',
          fit: BoxFit.cover,
        ),
        collapseMode: CollapseMode.pin,
        centerTitle: true,
        title: Text(modal.title),
      ),
    );
  }
}

class MisliverDelegate extends SliverChildDelegate {
  @override
  Widget? build(BuildContext context, int index) {
    return SizedBox(height: 50, child: Center(child: Text('item $index')));
  }

  @override
  bool shouldRebuild(covariant SliverChildDelegate oldDelegate) {
    return true;
  }
}

class _AppbarSliverSafeArea extends StatelessWidget {
  const _AppbarSliverSafeArea(
      {Key? key, required this.child, required this.context})
      : super(key: key);
  final Widget child;
  final BuildContext context;
  @override
  Widget build(BuildContext context) {
    return SliverSafeArea(
        sliver: MediaQuery.removePadding(context: context, child: child));
  }
}
