import 'package:flutter/material.dart';

class DetalisScreens extends StatelessWidget {
  DetalisScreens({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String data =
        'Un párrafo, también llamado parágrafo (del griego παράγραφος [parágraphos], y este de παρα, «próximo, semejante», y γραφος, «escritura»), es una unidad comunicativa formada por un conjunto de oraciones secuenciales que trata un mismo tema. Está compuesto por un conjunto de oraciones que tienen cierta unidad temática o que, sin tenerla, se enuncian juntas. Es un componente del texto que en su aspecto externo comienza con una mayúscula y termina en un punto y aparte. Comprende varias oraciones relacionadas sobre el mismo subtema; una de ellas expresa la idea principal.';
    final String setingDetalles =
        ModalRoute.of(context)?.settings.arguments.toString() ?? 'sin data';

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // const _AppBarSliver(),
          _AppbarSliverSafeArea(
              child: SliverList(
                  delegate: SliverChildListDelegate([
                Container(
                    color: Colors.red,
                    height: 40,
                    child: const Text('MiSuper Claseeeeeee'))
              ])),
              context: context),
          //SliverList(
          //  delegate: MisliverDelegate(),
          //),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Titulos',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: const FadeInImage(
                          fit: BoxFit.cover,
                          height: 180,
                          width: 120,
                          image: NetworkImage(
                              'https://via.placeholder.com/250x250'),
                          placeholder: AssetImage('assets/no-image.jpg'),
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: const [
                            SizedBox(
                              width: 30,
                            ),
                            SizedBox(
                              width: 100,
                              child: Text(
                                'Los datos que no se ',
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
                          children: const [
                            Icon(
                              Icons.star_border,
                              size: 20,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              width: 100,
                              child: Text(
                                'Los datos que no se ',
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
                  child: Text(data),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(data),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(data),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _AppBarSliver extends StatelessWidget {
  const _AppBarSliver({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true, //fijo el appbar, se expande pero queda en su menor
      // valor
      floating: false, //apartece cuandp bajo, no necesita entar en cero
      expandedHeight: 200,
      flexibleSpace: FlexibleSpaceBar(
        background: Image.asset(
          'assets/no-image.jpg',
          fit: BoxFit.cover,
        ),
        collapseMode: CollapseMode.pin,
        centerTitle: true,
        title: const Text('Peliculas de Esteban y Lara'),
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
  _AppbarSliverSafeArea({Key? key, required this.child, required this.context})
      : super(key: key);
  final Widget child;
  final BuildContext context;
  @override
  Widget build(BuildContext context) {
    return SliverSafeArea(
        sliver: MediaQuery.removePadding(context: context, child: child));
  }
}
